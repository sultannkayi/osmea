import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/products/custom_collection/abstract/custom_collections_service.dart';
import 'package:apis/network/remote/shopify/products/custom_collection/freezed_model/request/update_remove_image_request.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///*******************************************************************
///*********** 🗑️ UPDATE REMOVE IMAGE HANDLER 🗑️ ****************
///*******************************************************************

class UpdateRemoveImageHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    // 🔒 Only handle PUT requests for removing image from custom collection
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
      final requiredParams = [
        'handle',
        'title',
        'updated_at',
        'body_html',
        'published_at',
        'sort_order',
        'template_suffix',
        'published_scope',
        'admin_graphql_api_id'
      ];

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

        // Extract optional parameters from request
        final handle = params['handle'];
        final title = params['title'];
        final updatedAt = params['updated_at'];
        final bodyHtml = params['body_html'];
        final publishedAt = params['published_at'];
        final sortOrder = params['sort_order'];
        final templateSuffix = params['template_suffix'];
        final publishedScope = params['published_scope'];
        final adminGraphqlApiId = params['admin_graphql_api_id'];

        // Create request to remove image (set image to null)
        final updateRequest = UpdateRemoveImageRequest(
          customCollection: CustomCollection(
            id: collectionIdInt,
            image: null, // Setting image to null removes it
            handle: handle,
            title: title,
            updatedAt: updatedAt,
            bodyHtml: bodyHtml,
            publishedAt: publishedAt,
            sortOrder: sortOrder,
            templateSuffix: templateSuffix,
            publishedScope: publishedScope,
            adminGraphqlApiId: adminGraphqlApiId,
          ),
        );

        // 📞 Call the custom collections service API to remove the image
        final response =
            await GetIt.I.get<CustomCollectionsService>().updateRemoveImage(
                  apiVersion: ApiNetwork.apiVersion,
                  customCollectionId: collectionIdInt,
                  model: updateRequest,
                );

        // 📋 Return the updated collection data
        return {
          "status": "success",
          "message": "Image removed from custom collection successfully",
          "collection_id": collectionId,
          "custom_collection": response.customCollection?.toJson(),
          "timestamp": DateTime.now().toIso8601String(),
        };
      } catch (e) {
        // ❌ Generic error handling
        return {
          "status": "error",
          "message":
              "Failed to remove image from custom collection: ${e.toString()}",
          "collection_id": collectionId,
          "timestamp": DateTime.now().toIso8601String(),
        };
      }
    }

    // ⛔ Unsupported method error
    return {
      "status": "error",
      "message":
          "Method $method not supported for Update Remove Image API. Only PUT is allowed.",
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
            hint: 'ID of the custom collection to remove image from',
            isRequired: true,
          ),
          const ApiField(
            name: 'handle',
            label: 'Handle',
            hint: 'Handle of the custom collection',
            isRequired: true,
          ),
          const ApiField(
            name: 'title',
            label: 'Title',
            hint: 'Title of the custom collection',
            isRequired: true,
          ),
          const ApiField(
            name: 'updated_at',
            label: 'Updated At',
            hint: 'Update timestamp',
            isRequired: true,
          ),
          const ApiField(
            name: 'body_html',
            label: 'Body HTML',
            hint: 'HTML body content',
            isRequired: true,
          ),
          const ApiField(
            name: 'published_at',
            label: 'Published At',
            hint: 'Publication timestamp',
            isRequired: true,
          ),
          const ApiField(
            name: 'sort_order',
            label: 'Sort Order',
            hint: 'Sort order',
            isRequired: true,
          ),
          const ApiField(
            name: 'template_suffix',
            label: 'Template Suffix',
            hint: 'Template suffix',
            isRequired: true,
          ),
          const ApiField(
            name: 'published_scope',
            label: 'Published Scope',
            hint: 'Published scope',
            isRequired: true,
          ),
          const ApiField(
            name: 'admin_graphql_api_id',
            label: 'Admin GraphQL API ID',
            hint: 'Admin GraphQL API ID',
            isRequired: true,
          ),
        ],
      };
}
