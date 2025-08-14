import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/products/collection/abstract/collection_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///**************************************************************
///******* 📦 PRODUCTS BELONGING TO COLLECTION HANDLER *********
///**************************************************************

class ProductsBelongingToCollectionHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    // Only handle GET requests
    if (method != 'GET') {
      return {
        "status": "error",
        "message": "Method $method not supported. Only GET is allowed.",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    // Extract required parameters
    final collectionId = params['collection_id'];

    // Validate required parameters
    if (collectionId == null || collectionId.isEmpty) {
      return {
        "status": "error",
        "message": "Collection ID is required",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      // Call the API method
      final response =
          await GetIt.I<CollectionService>().productsBelongingToCollection(
        apiVersion: ApiNetwork.apiVersion,
        collectionId: collectionId,
      );

      // Return success response
      return {
        "status": "success",
        "message": "Products retrieved successfully",
        "products": response.products?.map((p) => p.toJson()).toList(),
        "params": {
          "collection_id": collectionId,
        },
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      // Handle errors
      return {
        "status": "error",
        "message": "Failed to retrieve products: ${e.toString()}",
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
            name: 'collection_id',
            label: 'Collection ID',
            hint: 'The ID of the collection to retrieve products from',
            isRequired: true,
          ),
        ],
      };
}
