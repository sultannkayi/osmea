import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/products/product_image/abstract/product_image_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///**************************************************************
///************* 🔢 GET COUNT OF PRODUCT IMAGES HANDLER *********
////**************************************************************

class ReceiveCountOfProductImagesHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    if (method == 'GET') {
      final productId = params['product_id'] ?? '';

      if (productId.isEmpty) {
        return {
          "status": "error",
          "message": "product_id is required",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      try {
        final service = GetIt.I<ProductImageService>();
        final response = await service.getProductImageCount(
          apiVersion: ApiNetwork.apiVersion,
          productId: productId,
        );

        return {
          "status": "success",
          "product_id": productId,
          "count": response.count,
          "timestamp": DateTime.now().toIso8601String(),
        };
      } catch (e) {
        return {
          "status": "error",
          "message": "Failed to fetch product image count: ${e.toString()}",
          "product_id": productId,
          "timestamp": DateTime.now().toIso8601String(),
        };
      }
    }

    return {
      "status": "error",
      "message":
          "Method $method not supported. Only GET is allowed for this endpoint.",
      "timestamp": DateTime.now().toIso8601String(),
    };
  }

  @override
  List<String> get supportedMethods => ['GET'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'GET': [
          const ApiField(
            name: 'product_id',
            label: 'Product ID',
            hint: 'ID of the product whose images will be counted',
            isRequired: true,
          ),
        ],
      };
}
