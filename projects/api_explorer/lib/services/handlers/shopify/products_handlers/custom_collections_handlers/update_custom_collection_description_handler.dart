import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/products/custom_collection/abstract/custom_collections_service.dart';
import 'package:apis/network/remote/shopify/products/custom_collection/freezed_model/request/update_custom_collection_description_request.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///*******************************************************************
///****** 📝 UPDATE CUSTOM COLLECTION DESCRIPTION HANDLER 📝 ******
///*******************************************************************

class UpdateCustomCollectionDescriptionHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    // 🔒 Only handle PUT requests for updating custom collection description
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

      // 🔍 Check if body_html is provided - required parameter
      final bodyHtml = params['body_html'] ?? '';
      if (bodyHtml.isEmpty) {
        return {
          "status": "error",
          "message": "Body HTML (description) is required",
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

        // Create request that matches the expected JSON structure
        final updateRequest = UpdateCustomCollectionDescriptionRequest(
          customCollection: CustomCollection(
            id: collectionIdInt,
            bodyHtml: bodyHtml,
          ),
        );

        // 📞 Call the custom collections service API to update the description
        final response = await GetIt.I
            .get<CustomCollectionsService>()
            .updateCustomCollectionDescription(
              apiVersion: ApiNetwork.apiVersion,
              customCollectionId: collectionIdInt,
              model: updateRequest,
            );

        // 📋 Return the updated collection data
        return {
          "status": "success",
          "message": "Custom collection description updated successfully",
          "collection_id": collectionId,
          "custom_collection": response.customCollection?.toJson(),
          "timestamp": DateTime.now().toIso8601String(),
        };
      } catch (e) {
        // ❌ Generic error handling
        return {
          "status": "error",
          "message":
              "Failed to update custom collection description: ${e.toString()}",
          "collection_id": collectionId,
          "timestamp": DateTime.now().toIso8601String(),
        };
      }
    }

    // ⛔ Unsupported method error
    return {
      "status": "error",
      "message":
          "Method $method not supported for Update Custom Collection Description API. Only PUT is allowed.",
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
            hint: 'ID of the custom collection to update',
            isRequired: true,
          ),
          const ApiField(
            name: 'body_html',
            label: 'Description (HTML)',
            hint: 'The HTML description/content for the custom collection',
            isRequired: true,
          ),
        ],
      };
}
