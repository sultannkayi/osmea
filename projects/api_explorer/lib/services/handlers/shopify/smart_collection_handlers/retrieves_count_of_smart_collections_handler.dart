import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/smart_collections/abstract/smart_collection_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///**************************************************************
///*********** 🔢 COUNT OF SMART COLLECTIONS HANDLER ************
///**************************************************************

class RetrieveCountOfSmartCollectionsHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'GET') {
      return {
        'status': 'error',
        'message': 'Method $method not supported. Only GET is allowed.',
        'timestamp': DateTime.now().toIso8601String(),
      };
    }

    try {
      final response =
          await GetIt.I<SmartCollectionService>().countSmartCollections(
        apiVersion: ApiNetwork.apiVersion,
        title: params['title'],
        productId: params['product_id'],
        updatedAtMin: params['updated_at_min'],
        updatedAtMax: params['updated_at_max'],
        publishedAtMin: params['published_at_min'],
        publishedAtMax: params['published_at_max'],
        publishedStatus: params['published_status'],
      );

      return {
        'status': 'success',
        'data': response.toJson(),
        'timestamp': DateTime.now().toIso8601String(),
      };
    } catch (e) {
      return {
        'status': 'error',
        'message':
            'Failed to retrieve smart collections count: ${e.toString()}',
        'timestamp': DateTime.now().toIso8601String(),
      };
    }
  }

  @override
  List<String> get supportedMethods => ['GET'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'GET': [
          ApiField(
            name: 'title',
            type: ApiFieldType.text,
            isRequired: false,
            label: 'Title',
            hint: 'Filter by collection title',
          ),
          ApiField(
            name: 'product_id',
            type: ApiFieldType.text,
            isRequired: false,
            label: 'Product ID',
            hint: 'Filter by product ID',
          ),
          ApiField(
            name: 'updated_at_min',
            type: ApiFieldType.text,
            isRequired: false,
            label: 'Updated At Min',
            hint: 'Show collections updated after this date',
          ),
          ApiField(
            name: 'updated_at_max',
            type: ApiFieldType.text,
            isRequired: false,
            label: 'Updated At Max',
            hint: 'Show collections updated before this date',
          ),
          ApiField(
            name: 'published_at_min',
            type: ApiFieldType.text,
            isRequired: false,
            label: 'Published At Min',
            hint: 'Show collections published after this date',
          ),
          ApiField(
            name: 'published_at_max',
            type: ApiFieldType.text,
            isRequired: false,
            label: 'Published At Max',
            hint: 'Show collections published before this date',
          ),
          ApiField(
            name: 'published_status',
            type: ApiFieldType.text,
            isRequired: false,
            label: 'Published Status',
            hint: 'Filter by published status (published, unpublished, any)',
          ),
        ],
      };
}
