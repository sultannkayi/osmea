// filepath: /Users/yurtaslanmac/Documents/GitHub/osmea/packages/apis/example/lib/services/handlers/products_handlers/custom_collections_handlers/update_custom_collection_alt_text_handler.dart
import 'package:apis/apis.dart';
import 'package:apis/network/remote/products/custom_collection/abstract/custom_collections_service.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/request/update_custom_collection_alt_text_request.dart';
import 'package:example/services/api_request_handler.dart';
import 'package:example/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///*******************************************************************
///*********** 🏷️ UPDATE CUSTOM COLLECTION ALT TEXT HANDLER 🏷️ ****
///*******************************************************************

class UpdateCustomCollectionAltTextHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    // 🔒 Only handle PUT requests for updating custom collection alt text
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
      final requiredParams = ['alt'];

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
        final alt = params['alt']!;

        // Create request to update collection alt text
        final updateRequest = UpdateCustomCollectionAltTextRequest(
          customCollection: CustomCollection(
            id: collectionIdInt,
            image: Image(
              alt: alt,
            ),
          ),
        );

        // 📞 Call the custom collections service API to update alt text
        final response = await GetIt.I
            .get<CustomCollectionsService>()
            .updateCustomCollectionAltText(
              apiVersion: ApiNetwork.apiVersion,
              customCollectionId: collectionIdInt,
              model: updateRequest,
            );

        // 📋 Return the updated collection data
        return {
          "status": "success",
          "message": "Custom collection alt text updated successfully",
          "collection_id": collectionId,
          "custom_collection": response.customCollection?.toJson(),
          "timestamp": DateTime.now().toIso8601String(),
        };
      } catch (e) {
        // ❌ Generic error handling
        return {
          "status": "error",
          "message":
              "Failed to update custom collection alt text: ${e.toString()}",
          "collection_id": collectionId,
          "timestamp": DateTime.now().toIso8601String(),
        };
      }
    }

    // ⛔ Unsupported method error
    return {
      "status": "error",
      "message":
          "Method $method not supported for Update Custom Collection Alt Text API. Only PUT is allowed.",
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
            hint: 'ID of the custom collection to update alt text',
            isRequired: true,
          ),
          const ApiField(
            name: 'alt',
            label: 'Alt Text',
            hint: 'Alternative text for the collection image',
            isRequired: true,
          ),
        ],
      };
}
