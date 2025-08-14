import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/products/product_variant/abstract/product_variant_service.dart';
import 'package:apis/network/remote/shopify/products/product_variant/freezed_model/request/create_product_variant_request.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///*******************************************************************
///******* 🖼️ CREATE VARIANT WITH IMAGE HANDLER 🖼️ *******
///*******************************************************************

class CreateProductVariantWithImageHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    // 🔒 Only handle POST requests for creating variant with image
    if (method == 'POST') {
      try {
        // Extract required parameters
        final productId = params['product_id'];
        final option1 = params['option1'];
        final imageId = params['image_id'];

        if (productId == null || productId.isEmpty) {
          return {
            "status": "error",
            "message": "product_id parameter is required",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

        if (option1 == null || option1.isEmpty) {
          return {
            "status": "error",
            "message": "option1 parameter is required",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

        if (imageId == null || imageId.isEmpty) {
          return {
            "status": "error",
            "message": "image_id parameter is required",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

        // 📞 Call the product variant service API to create variant with image
        final createRequest = CreateProductVariantRequest(
          variant: ProductVariant(
            option1: option1,
            imageId: int.tryParse(imageId),
          ),
        );

        final response =
            await GetIt.I.get<ProductVariantService>().createProductVariant(
                  apiVersion: ApiNetwork.apiVersion,
                  productId: productId,
                  model: createRequest,
                );

        // ✅ Return successful response
        return {
          "status": "success",
          "message": "Product variant with image created successfully",
          "data": response.toJson(),
          "timestamp": DateTime.now().toIso8601String(),
        };
      } catch (e) {
        // ❌ Handle errors and return error response
        return {
          "status": "error",
          "message": "Failed to create variant with image: ${e.toString()}",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }
    }

    // 🚫 Return error for unsupported methods
    return {
      "status": "error",
      "message":
          "Only POST method is supported for creating variant with image",
      "timestamp": DateTime.now().toIso8601String(),
    };
  }

  @override
  List<String> get supportedMethods => ['POST'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'POST': [
          const ApiField(
            name: 'product_id',
            label: 'Product ID',
            hint: 'ID of the product to create variant for',
            isRequired: true,
          ),
          const ApiField(
            name: 'option1',
            label: 'Option1 (Title)',
            hint: 'Title for the new variant (e.g., "Small", "Red")',
            isRequired: true,
          ),
          const ApiField(
            name: 'image_id',
            label: 'Image ID',
            hint: 'ID of the existing image to attach to the variant',
            isRequired: true,
          ),
        ],
      };
}
