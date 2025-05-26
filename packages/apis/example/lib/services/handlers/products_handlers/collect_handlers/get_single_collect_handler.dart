import 'package:apis/apis.dart';
import 'package:apis/network/remote/products/collect/abstract/collect_service.dart';
import 'package:example/services/api_request_handler.dart';
import 'package:example/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///**************************************************************
///***************** 📦 GET SINGLE COLLECT **********************
///**************************************************************

class GetSingleCollectHandler implements ApiRequestHandler {
  
  /// Helper method to clean and validate parameters
  String? _cleanParam(String? param) {
    if (param == null) return null;
    final trimmed = param.trim();
    return trimmed.isEmpty ? null : trimmed;
  }

  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'GET') {
      return {
        "status": "error",
        "message": "Method $method not supported. Only GET is allowed.",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    // Extract and clean parameters
    final collectId = _cleanParam(params['collect_id']);
    final fields = _cleanParam(params['fields']);

    // Validate required parameters
    if (collectId == null) {
      return {
        "status": "error",
        "message": "Collect ID is required",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      // Call the API method
      final response = await GetIt.I<CollectService>().getSingleCollect(
        apiVersion: ApiNetwork.apiVersion,
        collectId: collectId,
        fields: fields,
      );

      // Process collect data
      var collectData = response.collect?.toJson();

      if (fields != null && fields.isNotEmpty && collectData != null) {
        final fieldsList = fields.split(',').map((f) => f.trim()).toList();
        final filteredJson = <String, dynamic>{};
        
        for (final field in fieldsList) {
          if (collectData.containsKey(field)) {
            filteredJson[field] = collectData[field];
          }
        }
        
        collectData = filteredJson;
      }

      // Create params object with only non-null values
      final appliedParams = <String, dynamic>{};
      appliedParams['collect_id'] = collectId;
      if (fields != null) appliedParams['fields'] = fields;

      // Return success response
      return {
        "status": "success",
        "message": "Collect retrieved successfully",
        "collect": collectData,
        "params": appliedParams,
        "filtered_by_fields": fields != null && fields.isNotEmpty,
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      // Handle errors
      return {
        "status": "error",
        "message": "Failed to retrieve collect: ${e.toString()}",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  @override
  List<String> get supportedMethods => ['GET'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
    'GET': [
      const ApiField(
        name: 'collect_id',
        label: 'Collect ID',
        hint: 'The ID of the collect to retrieve',
        isRequired: true,
      ),
      const ApiField(
        name: 'fields',
        label: 'Fields',
        hint: 'Comma-separated list of fields to include',
        isRequired: false,
      ),
    ],
  };
}