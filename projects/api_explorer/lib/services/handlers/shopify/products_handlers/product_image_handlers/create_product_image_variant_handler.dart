import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/products/product_image/abstract/product_image_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///**************************************************************
///************ 🧬 CREATE PRODUCT IMAGE WITH VARIANTS **********
///**************************************************************

class CreateProductImageVariantHandler implements ApiRequestHandler {
  @override
  List<String> get supportedMethods => ['POST'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'POST': [
          const ApiField(
            name: 'product_id',
            label: 'Product ID',
            hint: 'ID of the product to which the image will be added',
            isRequired: true,
          ),
          const ApiField(
            name: 'src',
            label: 'Image URL',
            hint: 'The source URL of the image',
            isRequired: true,
          ),
          const ApiField(
            name: 'variant_ids',
            label: 'Variant IDs',
            hint: 'Comma-separated list of variant IDs the image applies to',
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
    final src = params['src'];
    final variantIdsStr = params['variant_ids'];

    if (productId == null || src == null || variantIdsStr == null) {
      return {
        'status': 'error',
        'message': 'Required fields: product_id, src, variant_ids',
        'timestamp': DateTime.now().toIso8601String(),
      };
    }

    final variantIds = variantIdsStr
        .split(',')
        .map((id) => int.tryParse(id.trim()))
        .where((id) => id != null)
        .toList();

    try {
      final service = GetIt.I<ProductImageService>();
      final response = await service.createProductImageVariant(
        apiVersion: ApiNetwork.apiVersion,
        productId: productId,
        model: {
          "image": {
            "src": src,
            "variant_ids": variantIds,
          }
        },
      );

      return {
        'status': 'success',
        'message': 'Image with variants created successfully',
        'data': response.toJson(),
        'timestamp': DateTime.now().toIso8601String(),
      };
    } catch (e) {
      return {
        'status': 'error',
        'message': 'Failed to create image with variants: ${e.toString()}',
        'timestamp': DateTime.now().toIso8601String(),
      };
    }
  }
}
