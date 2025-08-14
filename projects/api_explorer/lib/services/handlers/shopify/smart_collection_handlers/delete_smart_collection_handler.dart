import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/smart_collections/abstract/smart_collection_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///**************************************************************
///************* ❌ DELETES SMART COLLECTION HANDLER *************
///**************************************************************

class DeletesSmartCollectionHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'DELETE') {
      return {
        'status': 'error',
        'message': 'Method $method not supported. Only DELETE is allowed.',
        'timestamp': DateTime.now().toIso8601String(),
      };
    }

    final id = params['id'];
    if (id == null || id.isEmpty) {
      return {
        'status': 'error',
        'message': 'Missing required parameter: id',
        'timestamp': DateTime.now().toIso8601String(),
      };
    }

    try {
      await GetIt.I<SmartCollectionService>().deleteSmartCollection(
        apiVersion: ApiNetwork.apiVersion,
        id: id,
      );

      return {
        'status': 'success',
        'message': 'Smart collection with ID $id deleted successfully.',
        'timestamp': DateTime.now().toIso8601String(),
      };
    } catch (e) {
      return {
        'status': 'error',
        'message': 'Failed to delete smart collection: ${e.toString()}',
        'timestamp': DateTime.now().toIso8601String(),
      };
    }
  }

  @override
  List<String> get supportedMethods => ['DELETE'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'DELETE': [
          ApiField(
            name: 'id',
            type: ApiFieldType.text,
            isRequired: true,
            label: 'Smart Collection ID',
            hint: 'The unique ID of the smart collection to delete',
          ),
        ],
      };
}
