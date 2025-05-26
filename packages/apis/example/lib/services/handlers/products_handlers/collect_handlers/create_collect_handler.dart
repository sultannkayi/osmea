import 'package:apis/apis.dart';
import 'package:apis/network/remote/products/collect/abstract/collect_service.dart';
import 'package:apis/network/remote/products/collect/freezed_model/request/create_collect_request.dart';
import 'package:example/services/api_request_handler.dart';
import 'package:example/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///**************************************************************
///******************* ➕ CREATE COLLECT ***********************
///**************************************************************

class CreateCollectHandler implements ApiRequestHandler {
  
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
    if (method != 'POST') {
      return {
        "status": "error",
        "message": "Method $method not supported. Only POST is allowed.",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    // Extract and validate required parameters
    final productIdStr = _cleanParam(params['product_id']);
    final collectionIdStr = _cleanParam(params['collection_id']);
    
    if (productIdStr == null || productIdStr.isEmpty) {
      return {
        "status": "error",
        "message": "Product ID is required",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
    
    if (collectionIdStr == null || collectionIdStr.isEmpty) {
      return {
        "status": "error",
        "message": "Collection ID is required",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    // Parse IDs to integers
    final productId = int.tryParse(productIdStr);
    final collectionId = int.tryParse(collectionIdStr);
    
    if (productId == null) {
      return {
        "status": "error",
        "message": "Invalid product ID format",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
    
    if (collectionId == null) {
      return {
        "status": "error",
        "message": "Invalid collection ID format",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      // Create the request model
      final request = CreateCollectRequest(
        collect: CollectToCreate(
          productId: productId,
          collectionId: collectionId,
        ),
      );

      // Call the API method
      final response = await GetIt.I<CollectService>().createCollect(
        apiVersion: ApiNetwork.apiVersion,
        model: request,
      );

      // Create params object with only non-null values
      final appliedParams = <String, dynamic>{
        'product_id': productId,
        'collection_id': collectionId,
      };

      // Return success response
      return {
        "status": "success",
        "message": "Collect created successfully",
        "collect": response.collect?.toJson(),
        "params": appliedParams,
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      // Handle errors
      return {
        "status": "error",
        "message": "Failed to create collect: ${e.toString()}",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  @override
  List<String> get supportedMethods => ['POST'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
    'POST': [
      const ApiField(
        name: 'product_id',
        label: 'Product ID',
        hint: 'ID of the product to associate with the collection',
        isRequired: true,
      ),
      const ApiField(
        name: 'collection_id',
        label: 'Collection ID',
        hint: 'ID of the collection to associate with the product',
        isRequired: true,
      ),
    ],
  };
}
