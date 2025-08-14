import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/products/product_image/abstract/product_image_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///**************************************************************
///****** 🖼️ ATTACH VARIANTS TO PRODUCT IMAGE HANDLER *********
///**************************************************************

class ModifyProductImageAttachVariantsHandler implements ApiRequestHandler {
  @override
  List<String> get supportedMethods => ['PUT'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'PUT': [
          const ApiField(
            name: 'product_id',
            label: 'Product ID',
            hint: 'ID of the product that owns the image',
            isRequired: true,
          ),
          const ApiField(
            name: 'image_id',
            label: 'Image ID',
            hint: 'ID of the image to attach variants to',
            isRequired: true,
          ),
          const ApiField(
            name: 'variant_ids',
            label: 'Variant IDs',
            hint: 'Comma-separated list of variant IDs',
            isRequired: true,
          ),
        ],
      };

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

    final productId = params['product_id'];
    final imageId = params['image_id'];
    final variantIdsRaw = params['variant_ids'];

    if (productId == null || imageId == null || variantIdsRaw == null) {
      return {
        'status': 'error',
        'message':
            'Missing required parameters: product_id, image_id, or variant_ids.',
        'timestamp': DateTime.now().toIso8601String(),
      };
    }

    try {
      final variantIds = variantIdsRaw
          .split(',')
          .map((id) => int.tryParse(id.trim()))
          .where((id) => id != null)
          .toList();

      final body = {
        "image": {
          "variant_ids": variantIds,
        }
      };

      final response =
          await GetIt.I<ProductImageService>().attachVariantsToProductImage(
        apiVersion: ApiNetwork.apiVersion,
        productId: productId,
        imageId: imageId,
        model: body,
      );

      return {
        'status': 'success',
        'message': 'Variants attached to product image successfully.',
        'data': response.toJson(),
        'timestamp': DateTime.now().toIso8601String(),
      };
    } catch (e) {
      return {
        'status': 'error',
        'message': 'Failed to attach variants: ${e.toString()}',
        'timestamp': DateTime.now().toIso8601String(),
      };
    }
  }
}
