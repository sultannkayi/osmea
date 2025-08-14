import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/products/custom_collection/abstract/custom_collections_service.dart';
import 'package:apis/network/remote/shopify/products/custom_collection/freezed_model/request/publish_hidden_custom_collection_request.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///*******************************************************************
///*********** 📢 PUBLISH HIDDEN CUSTOM COLLECTION HANDLER 📢 ****
///*******************************************************************

class PublishHiddenCustomCollectionHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    // 🔒 Only handle PUT requests for publishing hidden custom collection
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

      try {
        int collectionIdInt;

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

        // Create request to publish hidden collection
        final publishRequest = PublishHiddenCustomCollectionRequest(
          customCollection: CustomCollection(
            id: collectionIdInt,
            published: true, // Set to true to publish the collection
          ),
        );

        // 📞 Call the custom collections service API to publish collection
        final response = await GetIt.I
            .get<CustomCollectionsService>()
            .publishHiddenCustomCollection(
              apiVersion: ApiNetwork.apiVersion,
              customCollectionId: collectionIdInt,
              model: publishRequest,
            );

        // 📋 Return the published collection data
        return {
          "status": "success",
          "message": "Hidden custom collection published successfully",
          "collection_id": collectionId,
          "custom_collection": response.customCollection?.toJson(),
          "timestamp": DateTime.now().toIso8601String(),
        };
      } catch (e) {
        // ❌ Generic error handling
        return {
          "status": "error",
          "message":
              "Failed to publish hidden custom collection: ${e.toString()}",
          "collection_id": collectionId,
          "timestamp": DateTime.now().toIso8601String(),
        };
      }
    }

    // ⛔ Unsupported method error
    return {
      "status": "error",
      "message":
          "Method $method not supported for Publish Hidden Custom Collection API. Only PUT is allowed.",
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
            hint: 'ID of the hidden custom collection to publish',
            isRequired: true,
          ),
        ],
      };
}
