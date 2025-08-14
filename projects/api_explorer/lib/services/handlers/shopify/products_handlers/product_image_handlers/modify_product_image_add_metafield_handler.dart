import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/products/product_image/abstract/product_image_service.dart';
import 'package:apis/network/remote/shopify/products/product_image/freezed_model/request/modify_product_image_add_metafield_request.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';

import 'package:get_it/get_it.dart';

class ModifyProductImageAddMetafieldHandler implements ApiRequestHandler {
  @override
  List<String> get supportedMethods => ['PUT'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'PUT': [
          const ApiField(
            name: 'product_id',
            label: 'Product ID',
            hint: 'ID of the product',
            isRequired: true,
          ),
          const ApiField(
            name: 'image_id',
            label: 'Image ID',
            hint: 'ID of the product image',
            isRequired: true,
          ),
          const ApiField(
            name: 'namespace',
            label: 'Namespace',
            hint: 'Metafield namespace',
            isRequired: true,
          ),
          const ApiField(
            name: 'key',
            label: 'Key',
            hint: 'Metafield key',
            isRequired: true,
          ),
          const ApiField(
            name: 'value',
            label: 'Value',
            hint: 'Metafield value',
            isRequired: true,
          ),
          const ApiField(
            name: 'value_type',
            label: 'Value Type',
            hint: 'Metafield value type (e.g., string)',
            isRequired: true,
          ),
        ],
      };

  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    if (method != 'PUT') {
      return {
        'status': 'error',
        'message': 'Only PUT method is supported.',
        'timestamp': DateTime.now().toIso8601String(),
      };
    }

    final productId = params['product_id'];
    final imageId = params['image_id'];
    final namespace = params['namespace'];
    final key = params['key'];
    final value = params['value'];
    final valueType = params['value_type'];

    if ([productId, imageId, namespace, key, value, valueType]
        .any((e) => e == null || e.isEmpty)) {
      return {
        'status': 'error',
        'message': 'Missing required parameters.',
        'timestamp': DateTime.now().toIso8601String(),
      };
    }

    final request = ModifyProductImageAddMetafieldRequest(
      image: Image(
        id: int.tryParse(imageId!),
        metafields: [
          Metafield(
            namespace: namespace!,
            key: key!,
            value: value!,
            valueType: valueType!,
          ),
        ],
      ),
    );

    try {
      final response =
          await GetIt.I<ProductImageService>().modifyProductImageAddMetafield(
        apiVersion: ApiNetwork.apiVersion,
        productId: productId!,
        imageId: imageId,
        model: request,
      );

      return {
        'status': 'success',
        'message': 'Metafield added to product image.',
        'data': response.toJson(),
        'timestamp': DateTime.now().toIso8601String(),
      };
    } catch (e) {
      return {
        'status': 'error',
        'message': 'Failed to add metafield: ${e.toString()}',
        'timestamp': DateTime.now().toIso8601String(),
      };
    }
  }
}
