import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/products/custom_collection/abstract/custom_collections_service.dart';
import 'package:apis/network/remote/shopify/products/custom_collection/freezed_model/request/update_custom_collection_new_image_request.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///*******************************************************************
///*********** 🖼️ UPDATE CUSTOM COLLECTION NEW IMAGE HANDLER 🖼️ ****
///*******************************************************************

class UpdateCustomCollectionNewImageHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    // 🔒 Only handle PUT requests for updating custom collection with new image
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
      final requiredParams = ['attachment', 'alt'];

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

        // Extract required parameters from request
        final attachment = params['attachment']!;
        final alt = params['alt']!;

        // Create request to update collection with new image
        final updateRequest = UpdateCustomCollectionNewImageRequest(
          customCollection: CustomCollection(
            id: collectionIdInt,
            image: Image(
              attachment: attachment,
              alt: alt,
            ),
          ),
        );

        // 📞 Call the custom collections service API to update with new image
        final response = await GetIt.I
            .get<CustomCollectionsService>()
            .updateCustomCollectionNewImage(
              apiVersion: ApiNetwork.apiVersion,
              customCollectionId: collectionIdInt,
              model: updateRequest,
            );

        // 📋 Return the updated collection data
        return {
          "status": "success",
          "message": "Custom collection updated with new image successfully",
          "collection_id": collectionId,
          "custom_collection": response.customCollection?.toJson(),
          "timestamp": DateTime.now().toIso8601String(),
        };
      } catch (e) {
        // ❌ Generic error handling
        return {
          "status": "error",
          "message":
              "Failed to update custom collection with new image: ${e.toString()}",
          "collection_id": collectionId,
          "timestamp": DateTime.now().toIso8601String(),
        };
      }
    }

    // ⛔ Unsupported method error
    return {
      "status": "error",
      "message":
          "Method $method not supported for Update Custom Collection New Image API. Only PUT is allowed.",
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
            hint: 'ID of the custom collection to update with new image',
            isRequired: true,
          ),
          const ApiField(
            name: 'attachment',
            label: 'Image Attachment',
            hint: 'Base64 encoded image or image URL',
            isRequired: true,
          ),
          const ApiField(
            name: 'alt',
            label: 'Alt Text',
            hint: 'Alternative text for the image',
            isRequired: true,
          ),
        ],
      };
}
