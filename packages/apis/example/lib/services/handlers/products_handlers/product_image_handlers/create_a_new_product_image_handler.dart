import 'package:apis/apis.dart';
import 'package:apis/network/remote/products/product_image/abstract/product_image_service.dart';
import 'package:apis/network/remote/products/product_image/freezed_model/request/create_a_new_product_image_request.dart';
import 'package:example/services/api_request_handler.dart';
import 'package:example/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

/// Handler for creating a new product image
class CreateANewProductImageHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    if (method != 'POST') {
      return {
        "status": "error",
        "message": "Method $method not supported. Only POST is allowed.",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      final productId = params['product_id'];
      final imageSrc = params['image'];
      final altText = params['alt_text'];
      final position = params['position'];

      if (productId == null || productId.isEmpty) {
        return {
          "status": "error",
          "message": "Product ID is required",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      if (imageSrc == null || imageSrc.isEmpty) {
        return {
          "status": "error",
          "message": "Image source is required",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      // Create image object
      final image = Image(
        productId: int.tryParse(productId),
        src: imageSrc,
        alt: altText,
        position: position != null ? int.tryParse(position) : null,
      );

      // Create request
      final request = CreateANewProductImageRequest(image: image);

      // Get service instance from dependency injection
      final productImageService = GetIt.I<ProductImageService>();

      // Make the API call
      final response = await productImageService.createProductImage(
        apiVersion: ApiNetwork.apiVersion,
        productId: productId,
        request: request,
      );

      return {
        "status": "success",
        "message": "Product image created successfully",
        "data": response.toJson(),
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      return {
        "status": "error",
        "message": "Failed to create product image: ${e.toString()}",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  @override
  List<String> get supportedMethods => ['POST'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'POST': [
          const ApiField(
            name: 'product_id',
            label: 'Product ID',
            hint: 'ID of the product to which the image belongs',
            isRequired: true,
          ),
          const ApiField(
            name: 'image',
            label: 'Image Source',
            hint: 'URL or Base64 encoded image data',
            isRequired: true,
          ),
          const ApiField(
            name: 'alt_text',
            label: 'Alt Text',
            hint: 'Alternative text for the image',
            isRequired: false,
          ),
          const ApiField(
            name: 'position',
            label: 'Position',
            hint: 'Position of the image in the product images list',
            isRequired: false,
            type: ApiFieldType.number,
          ),
        ],
      };
}