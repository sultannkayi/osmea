import 'package:apis/apis.dart';
import 'package:apis/network/remote/smart_collections/abstract/smart_collection_service.dart';
import 'package:example/services/api_request_handler.dart';
import 'package:example/services/api_service_registry.dart';

import 'package:get_it/get_it.dart';

///**************************************************************
///********** 🧠 RETRIEVE LIST OF SMART COLLECTIONS *************
///**************************************************************

class RetrievesAllSmartCollectionsHandler implements ApiRequestHandler {
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
          await GetIt.I<SmartCollectionService>().listSmartCollections(
        apiVersion: ApiNetwork.apiVersion,
        limit: params['limit'] != null ? int.tryParse(params['limit']!) : null,
        sinceId: params['since_id'],
        fields: params['fields'],
      );

      return {
        'status': 'success',
        'data': response.toJson(),
        'timestamp': DateTime.now().toIso8601String(),
      };
    } catch (e) {
      return {
        'status': 'error',
        'message': 'Failed to retrieve smart collections: ${e.toString()}',
        'timestamp': DateTime.now().toIso8601String(),
      };
    }
  }

  @override
  List<String> get supportedMethods => ['GET'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'GET': [], 
      };
}
