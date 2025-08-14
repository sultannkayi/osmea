import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/products/product_image/abstract/product_image_service.dart';
import 'package:apis/network/remote/shopify/products/product_image/freezed_model/request/create_product_image_metafield_request.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///**************************************************************
///*********** 🧩 CREATE PRODUCT IMAGE METAFIELD ***************
///**************************************************************

class CreateProductImageMetafieldHandler implements ApiRequestHandler {
  @override
  List<String> get supportedMethods => ['POST'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'POST': [
          const ApiField(
            name: 'product_id',
            label: 'Product ID',
            hint: 'ID of the product',
            isRequired: true,
          ),
          const ApiField(
            name: 'namespace',
            label: 'Namespace',
            hint: 'Metafield namespace (e.g. global)',
            isRequired: true,
          ),
          const ApiField(
            name: 'key',
            label: 'Key',
            hint: 'Metafield key (e.g. image_label)',
            isRequired: true,
          ),
          const ApiField(
            name: 'value',
            label: 'Value',
            hint: 'Metafield value',
            isRequired: true,
          ),
          const ApiField(
            name: 'type',
            label: 'Type',
            hint: 'Metafield type (e.g. single_line_text_field)',
            isRequired: true,
          ),
        ],
      };

  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'POST') {
      return {
        'status': 'error',
        'message': 'Only POST method is supported.',
        'timestamp': DateTime.now().toIso8601String(),
      };
    }

    final productId = params['product_id'];
    final namespace = params['namespace'];
    final key = params['key'];
    final value = params['value'];
    final type = params['type'];

    if ([productId, namespace, key, value, type].any((e) => e == null)) {
      return {
        'status': 'error',
        'message': 'Missing required parameters.',
        'timestamp': DateTime.now().toIso8601String(),
      };
    }

    try {
      final request = CreateProductImageMetafieldRequest(
        metafield: Metafield(
          namespace: namespace!,
          key: key!,
          value: value!,
          type: type!,
        ),
      );

      final response =
          await GetIt.I<ProductImageService>().createProductImageMetafield(
        apiVersion: ApiNetwork.apiVersion,
        productId: productId!,
        model: request,
      );

      return {
        'status': 'success',
        'message': 'Metafield created successfully.',
        'data': response.toJson(),
        'timestamp': DateTime.now().toIso8601String(),
      };
    } catch (e) {
      return {
        'status': 'error',
        'message': 'Failed to create metafield: ${e.toString()}',
        'timestamp': DateTime.now().toIso8601String(),
      };
    }
  }
}
