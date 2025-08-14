import 'dart:convert';

import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/smart_collections/abstract/smart_collection_service.dart';
import 'package:apis/network/remote/shopify/smart_collections/freezed_model/request/create_smart_collection_request.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///**************************************************************
///************* 🆕 CREATES SMART COLLECTION HANDLER *************
///**************************************************************

class CreatesSmartCollectionHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'POST') {
      return {
        'status': 'error',
        'message': 'Method $method not supported. Only POST is allowed.',
        'timestamp': DateTime.now().toIso8601String(),
      };
    }

    try {
      final rawBody = params['body'];
      if (rawBody == null) {
        return {
          'status': 'error',
          'message': 'Missing request body.',
          'timestamp': DateTime.now().toIso8601String(),
        };
      }

      final decodedJson = json.decode(rawBody) as Map<String, dynamic>;
      final request = CreateSmartCollectionRequest.fromJson(decodedJson);

      final response =
          await GetIt.I<SmartCollectionService>().createSmartCollection(
        apiVersion: ApiNetwork.apiVersion,
        model: request,
      );

      return {
        'status': 'success',
        'data': response.toJson(),
        'timestamp': DateTime.now().toIso8601String(),
      };
    } catch (e) {
      return {
        'status': 'error',
        'message': 'Failed to create smart collection: ${e.toString()}',
        'timestamp': DateTime.now().toIso8601String(),
      };
    }
  }

  @override
  List<String> get supportedMethods => ['POST'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'POST': [
          ApiField(
            name: 'body',
            type: ApiFieldType.text,
            isRequired: true,
            label: 'Request Body',
            hint:
                'The JSON body of the request containing smart collection details',
          ),
        ],
      };
}
