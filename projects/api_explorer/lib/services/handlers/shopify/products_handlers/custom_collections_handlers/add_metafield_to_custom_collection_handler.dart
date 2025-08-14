import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/products/custom_collection/abstract/custom_collections_service.dart';
import 'package:apis/network/remote/shopify/products/custom_collection/freezed_model/request/add_metafield_to_custom_collection_request.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///*******************************************************************
///************** 🏷️ ADD METAFIELD TO CUSTOM COLLECTION HANDLER 🏷️ ****************
///*******************************************************************

class AddMetafieldToCustomCollectionHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    // 🔒 Only handle PUT requests for adding metafields to collections
    if (method == 'PUT') {
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
        'metafield_key',
        'metafield_value',
        'metafield_type'
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

        // Extract required parameters from request
        final metafieldKey = params['metafield_key']!;
        final metafieldValue = params['metafield_value']!;
        final metafieldType = params['metafield_type']!;
        final metafieldNamespace = params['metafield_namespace'] ?? 'global';

        // Create metafield object
        final metafield = Metafield(
          key: metafieldKey,
          value: metafieldValue,
          type: metafieldType,
          namespace: metafieldNamespace,
        );

        // Create the custom collection object with ID and metafields
        final customCollection = CustomCollection(
          id: collectionIdInt,
          metafields: [metafield],
        );

        // Create the request model with the custom collection object
        final metafieldRequest = AddMetafieldToCustomCollectionRequest(
          customCollection: customCollection,
        );

        // 📞 Call the custom collections service API
        final response = await GetIt.I
            .get<CustomCollectionsService>()
            .addMetafieldToCustomCollection(
              apiVersion: ApiNetwork.apiVersion,
              customCollectionId: collectionIdInt,
              model: metafieldRequest,
            );

        // 📋 Return success response
        return {
          "status": "success",
          "message": "Metafield added to custom collection successfully",
          "custom_collection": response.customCollection?.toJson(),
          "timestamp": DateTime.now().toIso8601String(),
        };
      } catch (e) {
        // Handle errors
        return {
          "status": "error",
          "message":
              "Failed to add metafield to custom collection: ${e.toString()}",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }
    }

    return {
      "status": "error",
      "message": "Method $method not supported",
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
            hint: 'ID of the custom collection to add metafield to',
            isRequired: true,
          ),
          const ApiField(
            name: 'metafield_key',
            label: 'Metafield Key',
            hint: 'The key for the metafield',
            isRequired: true,
          ),
          const ApiField(
            name: 'metafield_value',
            label: 'Metafield Value',
            hint: 'The value for the metafield',
            isRequired: true,
          ),
          const ApiField(
            name: 'metafield_type',
            label: 'Metafield Type',
            hint: 'The type of the metafield (e.g., single_line_text_field)',
            isRequired: true,
          ),
          const ApiField(
            name: 'metafield_namespace',
            label: 'Metafield Namespace',
            hint: 'The namespace for the metafield (default: global)',
          ),
        ],
      };
}
