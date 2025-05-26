import 'package:apis/apis.dart';
import 'package:apis/network/remote/products/custom_collection/abstract/custom_collections_service.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/request/add_collect_to_collection_by_product_id_request.dart';
import 'package:example/services/api_request_handler.dart';
import 'package:example/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///*******************************************************************
///********** ➕ ADD COLLECT TO COLLECTION BY PRODUCT ID HANDLER ➕ ***
///*******************************************************************

class AddCollectToCollectionByProductIdHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    // 🔒 Only handle PUT requests for adding collect to collection
    if (method == 'PUT') {
      // 🔍 Check if collection ID is provided - required parameter
      final collectionId = params['collection_id'] ?? '';
      if (collectionId.isEmpty) {
        return {
          "status": "error",
          "message": "Collection ID is required",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      // 🔍 Check required fields
      final requiredParams = ['product_id'];

      for (final param in requiredParams) {
        if (params[param] == null || params[param]!.isEmpty) {
          return {
            "status": "error",
            "message": "$param is required",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }
      }

      try {
        int collectionIdInt;
        int productIdInt;

        // Convert collection ID to integer
        try {
          collectionIdInt = int.parse(collectionId);
        } catch (_) {
          return {
            "status": "error",
            "message": "Collection ID must be a valid number",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

        // Convert product ID to integer
        try {
          productIdInt = int.parse(params['product_id']!);
        } catch (_) {
          return {
            "status": "error",
            "message": "Product ID must be a valid number",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

        // Extract optional position parameter
        int? position;
        if (params['position'] != null && params['position']!.isNotEmpty) {
          try {
            position = int.parse(params['position']!);
          } catch (_) {
            return {
              "status": "error",
              "message": "Position must be a valid number",
              "timestamp": DateTime.now().toIso8601String(),
            };
          }
        }

        // Create request to add collect to collection
        final addCollectRequest = AddCollectToCollectionByProductIdRequest(
          customCollection: CustomCollection(
            id: collectionIdInt,
            collects: [
              Collect(
                productId: productIdInt,
                position: position,
              ),
            ],
          ),
        );

        // 📞 Call the custom collections service API to add collect
        final response = await GetIt.I
            .get<CustomCollectionsService>()
            .addCollectToCollectionByProductId(
              apiVersion: ApiNetwork.apiVersion,
              customCollectionId: collectionIdInt,
              model: addCollectRequest,
            );

        // 📋 Return the updated collection data
        return {
          "status": "success",
          "message": "Product added to collection successfully",
          "collection_id": collectionId,
          "product_id": params['product_id'],
          "custom_collection": response.customCollection?.toJson(),
          "timestamp": DateTime.now().toIso8601String(),
        };
      } catch (e) {
        // ❌ Generic error handling
        return {
          "status": "error",
          "message": "Failed to add product to collection: ${e.toString()}",
          "collection_id": collectionId,
          "product_id": params['product_id'],
          "timestamp": DateTime.now().toIso8601String(),
        };
      }
    }

    // ⛔ Unsupported method error
    return {
      "status": "error",
      "message":
          "Method $method not supported for Add Collect to Collection by Product ID API. Only PUT is allowed.",
      "timestamp": DateTime.now().toIso8601String(),
    };
  }

  @override
  List<String> get supportedMethods => ['PUT'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'PUT': [
          const ApiField(
            name: 'collection_id',
            label: 'Collection ID',
            hint: 'ID of the custom collection to add product to',
            isRequired: true,
          ),
          const ApiField(
            name: 'product_id',
            label: 'Product ID',
            hint: 'ID of the product to add to the collection',
            isRequired: true,
          ),
          const ApiField(
            name: 'position',
            label: 'Position',
            hint: 'Position of the product in the collection (optional)',
            isRequired: false,
          ),
        ],
      };
}
