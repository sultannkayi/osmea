import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/products/product_image/abstract/product_image_service.dart';
import 'package:apis/network/remote/shopify/products/product_image/freezed_model/request/modify_product_image_position_alt_request.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///**************************************************************
///*********** 🖼 MODIFY PRODUCT IMAGE ALT + POSITION **********
///**************************************************************

class ModifyProductImagePositionAltHandler implements ApiRequestHandler {
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
            hint: 'ID of the image to update',
            isRequired: true,
          ),
          const ApiField(
            name: 'alt',
            label: 'Alt Text',
            hint: 'New alt text for the image',
            isRequired: false,
          ),
          const ApiField(
            name: 'position',
            label: 'Position',
            hint: 'New image position',
            isRequired: false,
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
    final alt = params['alt'];
    final position = int.tryParse(params['position'] ?? '');

    if (productId == null || imageId == null) {
      return {
        'status': 'error',
        'message': 'Missing required parameters: product_id or image_id',
        'timestamp': DateTime.now().toIso8601String(),
      };
    }

    try {
      final request = ModifyProductImagePositionAltRequest(
        image: Image(
          alt: alt,
          position: position,
        ),
      );

      final response =
          await GetIt.I<ProductImageService>().modifyProductImagePositionAlt(
        apiVersion: ApiNetwork.apiVersion,
        productId: productId,
        imageId: imageId,
        model: request,
      );

      return {
        'status': 'success',
        'message': 'Image metadata updated successfully',
        'data': response.toJson(),
        'timestamp': DateTime.now().toIso8601String(),
      };
    } catch (e) {
      return {
        'status': 'error',
        'message': 'Failed to update image: ${e.toString()}',
        'timestamp': DateTime.now().toIso8601String(),
      };
    }
  }
}
