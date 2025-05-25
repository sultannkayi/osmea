import 'package:apis/apis.dart';
import 'package:apis/network/remote/products/collect/abstract/collect_service.dart';
import 'package:example/services/api_request_handler.dart';
import 'package:example/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///*******************************************************************
///***** 🔢 GET COLLECTS COUNT BY COLLECTION (Collection ID) *******
///*******************************************************************

class GetCollectsCountByCollectionHandler implements ApiRequestHandler {
  
  /// Helper method to clean and validate parameters
  String? _cleanParam(String? param) {
    if (param == null) return null;
    final trimmed = param.trim();
    return trimmed.isEmpty ? null : trimmed;
  }

  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'GET') {
      return {
        "status": "error",
        "message": "Method $method not supported. Only GET is allowed.",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    // Extract required collection_id parameter
    final collectionId = _cleanParam(params['collection_id']);
    if (collectionId == null) {
      return {
        "status": "error",
        "message": "Collection ID is required",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      // Call the API method with collection filter
      final response = await GetIt.I<CollectService>().getCollectsCountByCollection(
        apiVersion: ApiNetwork.apiVersion,
        collectionId: collectionId,
      );

      // Return success response
      return {
        "status": "success",
        "message": "Collects count by collection retrieved successfully",
        "count": response.count,
        "params": {
          "collection_id": collectionId,
        },
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      // Handle errors
      return {
        "status": "error",
        "message": "Failed to retrieve collects count by collection: ${e.toString()}",
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
        hint: 'The ID of the collection to count collects for',
        isRequired: true,
      ),
    ],
  };
}
