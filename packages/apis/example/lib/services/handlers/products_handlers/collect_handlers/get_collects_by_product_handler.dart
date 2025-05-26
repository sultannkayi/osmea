import 'package:apis/apis.dart';
import 'package:apis/network/remote/products/collect/abstract/collect_service.dart';
import 'package:example/services/api_request_handler.dart';
import 'package:example/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///*******************************************************************
///***** 📦 GET COLLECTS BY PRODUCT (Product ID + Main) ************
///*******************************************************************

class GetCollectsByProductHandler implements ApiRequestHandler {
  
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

    // Extract required product_id parameter
    final productId = _cleanParam(params['product_id']);
    if (productId == null) {
      return {
        "status": "error",
        "message": "Product ID is required",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    // Extract and clean optional parameters
    final limitStr = params['limit']?.trim();
    final limit = (limitStr?.isNotEmpty == true) ? int.tryParse(limitStr!) : null;
    
    final sinceId = _cleanParam(params['since_id']);
    final fields = _cleanParam(params['fields']);

    try {
      // Call the API method with product filter
      final response = await GetIt.I<CollectService>().getCollectsByProduct(
        apiVersion: ApiNetwork.apiVersion,
        productId: productId,
        limit: limit,
        sinceId: sinceId,
        fields: fields,
      );

      // Process collects data with field filtering if needed
      var collectsData = response.collects?.map((collect) => collect.toJson()).toList() ?? [];

      if (fields != null && fields.isNotEmpty) {
        final fieldsList = fields.split(',').map((f) => f.trim()).toList();
        
        collectsData = response.collects?.map((collect) {
          final json = collect.toJson();
          final filteredJson = <String, dynamic>{};
          
          for (final field in fieldsList) {
            if (json.containsKey(field)) {
              filteredJson[field] = json[field];
            }
          }
          
          return filteredJson;
        }).toList() ?? [];
      }

      // Create params object with only non-null values
      final appliedParams = <String, dynamic>{
        'product_id': productId,
      };
      if (limit != null) appliedParams['limit'] = limit;
      if (sinceId != null) appliedParams['since_id'] = sinceId;
      if (fields != null) appliedParams['fields'] = fields;

      // Return success response
      return {
        "status": "success",
        "message": "Collects by product retrieved successfully",
        "collects": collectsData,
        "count": collectsData.length,
        "params": appliedParams,
        "filtered_by_fields": fields != null && fields.isNotEmpty,
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      // Handle errors
      return {
        "status": "error",
        "message": "Failed to retrieve collects by product: ${e.toString()}",
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
        name: 'product_id',
        label: 'Product ID',
        hint: 'The ID of the product to filter collects by',
        isRequired: true,
      ),
      const ApiField(
        name: 'limit',
        label: 'Limit',
        hint: 'Maximum number of collects to retrieve (max: 250)',
        isRequired: false,
      ),
      const ApiField(
        name: 'since_id',
        label: 'Since ID',
        hint: 'Retrieve collects after the specified ID',
        isRequired: false,
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
