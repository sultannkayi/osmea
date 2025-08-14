import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/products/product_image/abstract/product_image_service.dart';
import 'package:apis/network/remote/shopify/products/product_image/freezed_model/request/modify_an_existing_product_image_request.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

/// ✏️ Modify an existing product image handler
class ModifyAnExistingProductImageHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    if (method != 'PUT') {
      return {
        "status": "error",
        "message": "Method $method not supported. Only PUT is allowed.",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    final productId = params['product_id'];
    final imageId = params['image_id'];
    final altText = params['alt_text'];
    final position = params['position'];
    final imageSrc = params['image'];

    if (productId == null ||
        productId.isEmpty ||
        imageId == null ||
        imageId.isEmpty) {
      return {
        "status": "error",
        "message": "Product ID and Image ID are required.",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      final image = Image(
        id: int.tryParse(imageId),
        productId: int.tryParse(productId),
        alt: altText,
        src: imageSrc,
        position: position != null ? int.tryParse(position) : null,
      );

      final request = ModifyAnExistingProductImageRequest(image: image);

      final service = GetIt.I<ProductImageService>();
      final response = await service.modifyProductImage(
        apiVersion: ApiNetwork.apiVersion,
        productId: productId,
        imageId: imageId,
        model: request,
      );

      return {
        "status": "success",
        "message": "Product image updated successfully",
        "data": response.toJson(),
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      return {
        "status": "error",
        "message": "Failed to update product image: ${e.toString()}",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

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
            hint: 'ID of the image to update',
            isRequired: true,
          ),
          const ApiField(
            name: 'image',
            label: 'Image Source',
            hint: 'New image source (URL or Base64)',
            isRequired: false,
          ),
          const ApiField(
            name: 'alt_text',
            label: 'Alt Text',
            hint: 'New alt text for the image',
            isRequired: false,
          ),
          const ApiField(
            name: 'position',
            label: 'Position',
            hint: 'New position of the image',
            isRequired: false,
            type: ApiFieldType.number,
          ),
        ],
      };
}
