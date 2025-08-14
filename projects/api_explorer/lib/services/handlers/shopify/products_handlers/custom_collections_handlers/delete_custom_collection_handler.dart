import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/products/custom_collection/abstract/custom_collections_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///*******************************************************************
///************ 🗑️ DELETE CUSTOM COLLECTION HANDLER 🗑️ ************
///*******************************************************************

class DeleteCustomCollectionHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    // Only handle DELETE requests for deleting custom collections
    if (method != 'DELETE') {
      return {
        "status": "error",
        "message": "Method $method not supported. Only DELETE is allowed.",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    // Extract required parameters
    final customCollectionId = params['custom_collection_id'];

    // Validate required parameters
    if (customCollectionId == null || customCollectionId.isEmpty) {
      return {
        "status": "error",
        "message": "Custom Collection ID is required",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    // Convert to integer
    int customCollectionIdInt;
    try {
      customCollectionIdInt = int.parse(customCollectionId);
    } catch (_) {
      return {
        "status": "error",
        "message": "Custom Collection ID must be a valid number",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      // Call the API method to delete the custom collection
      await GetIt.I<CustomCollectionsService>().deleteCustomCollection(
        apiVersion: ApiNetwork.apiVersion,
        customCollectionId: customCollectionIdInt,
      );

      // Return success response
      return {
        "status": "success",
        "message": "Custom collection deleted successfully",
        "params": {
          "custom_collection_id": customCollectionId,
        },
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      // Handle errors
      return {
        "status": "error",
        "message": "Failed to delete custom collection: ${e.toString()}",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  @override
  List<String> get supportedMethods => ['DELETE'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'DELETE': [
          const ApiField(
            name: 'custom_collection_id',
            label: 'Custom Collection ID',
            hint: 'The ID of the custom collection to delete',
            isRequired: true,
          ),
        ],
      };
}
