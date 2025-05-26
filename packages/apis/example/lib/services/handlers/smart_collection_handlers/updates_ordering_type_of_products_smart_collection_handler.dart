import 'dart:convert';

import 'package:apis/apis.dart';
import 'package:apis/network/remote/smart_collections/abstract/smart_collection_service.dart';
import 'package:apis/network/remote/smart_collections/freezed_model/request/updates_ordering_type_of_products_smart_collection_request.dart';
import 'package:example/services/api_request_handler.dart';
import 'package:example/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///**************************************************************
///************ 🔀 UPDATE PRODUCT ORDER HANDLER *****************
///**************************************************************

class UpdateProductOrderHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'PUT') {
      return {
        'status': 'error',
        'message': 'Method $method not supported. Only PUT is allowed.',
        'timestamp': DateTime.now().toIso8601String(),
      };
    }

    final id = params['id'];
    final rawBody = params['body'];

    if (id == null || id.isEmpty) {
      return {
        'status': 'error',
        'message': 'Missing required parameter: id',
        'timestamp': DateTime.now().toIso8601String(),
      };
    }

    if (rawBody == null || rawBody.isEmpty) {
      return {
        'status': 'error',
        'message': 'Missing request body.',
        'timestamp': DateTime.now().toIso8601String(),
      };
    }

    try {
      final decodedJson = json.decode(rawBody) as Map<String, dynamic>;
      final request = UpdateOrderingTypeOfProductsRequest.fromJson(decodedJson);

      final response =
          await GetIt.I<SmartCollectionService>().updateProductOrder(
        apiVersion: ApiNetwork.apiVersion,
        id: id,
        request: request,
      );

      return {
        'status': 'success',
        'data': response.toJson(), // büyük ihtimalle boş {}
        'timestamp': DateTime.now().toIso8601String(),
      };
    } catch (e) {
      return {
        'status': 'error',
        'message': 'Failed to update product order: ${e.toString()}',
        'timestamp': DateTime.now().toIso8601String(),
      };
    }
  }

  @override
  List<String> get supportedMethods => ['PUT'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'PUT': [
          ApiField(
            name: 'id',
            type: ApiFieldType.text,
            isRequired: true,
            label: 'Smart Collection ID',
            hint:
                'The ID of the smart collection you want to update product order for',
          ),
          ApiField(
            name: 'body',
            type: ApiFieldType.text,
            isRequired: true,
            label: 'Request Body',
            hint: 'The JSON body containing sort_order and product IDs',
          ),
        ],
      };
}