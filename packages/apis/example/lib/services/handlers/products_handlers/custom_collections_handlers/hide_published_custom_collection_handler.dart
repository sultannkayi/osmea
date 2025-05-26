import 'package:apis/apis.dart';
import 'package:apis/network/remote/products/custom_collection/abstract/custom_collections_service.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/request/hide_published_custom_collection_request.dart';
import 'package:example/services/api_request_handler.dart';
import 'package:example/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///*******************************************************************
///************ 🫥 HIDE PUBLISHED CUSTOM COLLECTION HANDLER 🫥 ****
///*******************************************************************

class HidePublishedCustomCollectionHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    // 🔒 Only handle PUT requests for hiding published custom collection
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

        // Create request to hide published collection
        final hideRequest = HidePublishedCustomCollectionRequest(
          customCollection: CustomCollection(
            id: collectionIdInt,
            published: false, // Set to false to hide the collection
          ),
        );

        // 📞 Call the custom collections service API to hide collection
        final response = await GetIt.I
            .get<CustomCollectionsService>()
            .hidePublishedCustomCollection(
              apiVersion: ApiNetwork.apiVersion,
              customCollectionId: collectionIdInt,
              model: hideRequest,
            );

        // 📋 Return the hidden collection data
        return {
          "status": "success",
          "message": "Published custom collection hidden successfully",
          "collection_id": collectionId,
          "custom_collection": response.customCollection?.toJson(),
          "timestamp": DateTime.now().toIso8601String(),
        };
      } catch (e) {
        // ❌ Generic error handling
        return {
          "status": "error",
          "message":
              "Failed to hide published custom collection: ${e.toString()}",
          "collection_id": collectionId,
          "timestamp": DateTime.now().toIso8601String(),
        };
      }
    }

    // ⛔ Unsupported method error
    return {
      "status": "error",
      "message":
          "Method $method not supported for Hide Published Custom Collection API. Only PUT is allowed.",
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
            hint: 'ID of the published custom collection to hide',
            isRequired: true,
          ),
        ],
      };
}
