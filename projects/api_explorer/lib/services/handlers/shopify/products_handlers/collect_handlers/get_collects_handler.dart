import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/products/collect/abstract/collect_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///**************************************************************
///******************* 📦 GET COLLECTS **************************
///**************************************************************

class GetCollectsHandler implements ApiRequestHandler {
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

    // Extract and clean optional parameters
    final limitStr = params['limit']?.trim();
    final limit =
        (limitStr?.isNotEmpty == true) ? int.tryParse(limitStr!) : null;

    final sinceId = _cleanParam(params['since_id']);
    final fields = _cleanParam(params['fields']);
    final productId = _cleanParam(params['product_id']);
    final collectionId = _cleanParam(params['collection_id']);

    try {
      // Call the API method
      final response = await GetIt.I<CollectService>().getCollects(
        apiVersion: ApiNetwork.apiVersion,
        limit: limit,
        sinceId: sinceId,
        fields: fields,
        productId: productId,
        collectionId: collectionId,
      );

      // Process collects data with field filtering if needed
      var collectsData =
          response.collects?.map((collect) => collect.toJson()).toList() ?? [];

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
            }).toList() ??
            [];
      }

      // Create params object with only non-null values
      final appliedParams = <String, dynamic>{};
      if (limit != null) appliedParams['limit'] = limit;
      if (sinceId != null) appliedParams['since_id'] = sinceId;
      if (fields != null) appliedParams['fields'] = fields;
      if (productId != null) appliedParams['product_id'] = productId;
      if (collectionId != null) appliedParams['collection_id'] = collectionId;

      // Return success response
      return {
        "status": "success",
        "message": "Collects retrieved successfully",
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
        "message": "Failed to retrieve collects: ${e.toString()}",
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
          const ApiField(
            name: 'product_id',
            label: 'Product ID',
            hint: 'Filter collects by product ID',
            isRequired: false,
          ),
          const ApiField(
            name: 'collection_id',
            label: 'Collection ID',
            hint: 'Filter collects by collection ID',
            isRequired: false,
          ),
        ],
      };
}
