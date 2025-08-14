import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/products/product_variant/abstract/product_variant_service.dart';
import 'package:apis/network/remote/shopify/products/product_variant/freezed_model/request/update_product_variant_request.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///*******************************************************************
///******** 🖼️ ADD IMAGE TO PRODUCT VARIANT HANDLER 🖼️ ********
///*******************************************************************

class AddImageToProductVariantHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    // 🔒 Only handle PUT requests for adding image to variant
    if (method == 'PUT') {
      try {
        // Extract required parameters
        final variantId = params['variant_id'];
        final imageId = params['image_id'];

        if (variantId == null || variantId.isEmpty) {
          return {
            "status": "error",
            "message": "variant_id parameter is required",
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

        // 📞 Call the product variant service API to add image
        final updateRequest = UpdateProductVariantRequest(
          variant: UpdateProductVariant(
            imageId: int.tryParse(imageId),
          ),
        );

        final response =
            await GetIt.I.get<ProductVariantService>().updateProductVariant(
                  apiVersion: ApiNetwork.apiVersion,
                  variantId: variantId,
                  model: updateRequest,
                );

        // ✅ Return successful response
        return {
          "status": "success",
          "message": "Image added to product variant successfully",
          "data": response.toJson(),
          "timestamp": DateTime.now().toIso8601String(),
        };
      } catch (e) {
        // ❌ Handle errors and return error response
        return {
          "status": "error",
          "message": "Failed to add image to product variant: ${e.toString()}",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }
    }

    // 🚫 Return error for unsupported methods
    return {
      "status": "error",
      "message": "Only PUT method is supported for adding image to variant",
      "timestamp": DateTime.now().toIso8601String(),
    };
  }

  @override
  List<String> get supportedMethods => ['PUT'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'PUT': [
          const ApiField(
            name: 'variant_id',
            label: 'Variant ID',
            hint: 'ID of the product variant to add image to',
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
