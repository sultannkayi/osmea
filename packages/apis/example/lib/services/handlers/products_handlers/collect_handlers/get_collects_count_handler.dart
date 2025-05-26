import 'package:apis/apis.dart';
import 'package:apis/network/remote/products/collect/abstract/collect_service.dart';
import 'package:example/services/api_request_handler.dart';
import 'package:example/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///**************************************************************
///***************** 📦 GET COLLECTS COUNT **********************
///**************************************************************

class GetCollectsCountHandler implements ApiRequestHandler {

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

    // Extract optional filter parameters
    final productId = _cleanParam(params['product_id']);
    final collectionId = _cleanParam(params['collection_id']);

    try {
      // Call the API method with filter parameters
      final response = await GetIt.I<CollectService>().getCollectsCount(
        apiVersion: ApiNetwork.apiVersion,
        productId: productId,
        collectionId: collectionId,
      );

      // Create params object with only non-null values
      final appliedParams = <String, dynamic>{};
      if (productId != null) appliedParams['product_id'] = productId;
      if (collectionId != null) appliedParams['collection_id'] = collectionId;

      // Return success response
      return {
        "status": "success",
        "message": "Collects counted successfully",
        "count": response.count,
        "params": appliedParams,
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      // Handle errors
      return {
        "status": "error",
        "message": "Failed to count collects: ${e.toString()}",
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
        hint: 'Filter count by product ID (optional)',
        isRequired: false,
      ),
      const ApiField(
        name: 'collection_id',
        label: 'Collection ID',
        hint: 'Filter count by collection ID (optional)',
        isRequired: false,
      ),
    ],
  };
}