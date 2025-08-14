import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/products/product_variant/abstract/product_variant_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///*******************************************************************
///*********** 🗑️ DELETE PRODUCT VARIANT API HANDLER 🗑️ ************
///*******************************************************************

class DeleteProductVariantHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    // 🗑️ Only handle DELETE requests for deleting product variants
    if (method == 'DELETE') {
      try {
        // Extract required variant_id parameter
        final variantId = params['variant_id'];
        if (variantId == null || variantId.isEmpty) {
          return {
            "status": "error",
            "message": "variant_id parameter is required",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

        // 📞 Call the product variant service API to delete variant
        await GetIt.I.get<ProductVariantService>().deleteProductVariant(
              apiVersion: ApiNetwork.apiVersion,
              variantId: variantId,
            );

        // 📋 Return success response
        return {
          "status": "success",
          "message": "Product variant deleted successfully",
          "variant_id": variantId,
          "timestamp": DateTime.now().toIso8601String(),
        };
      } catch (e) {
        // ❌ Generic error handling
        return {
          "status": "error",
          "message": "Failed to delete product variant: ${e.toString()}",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }
    }

    // ⛔ Unsupported method error
    return {
      "status": "error",
      "message": "Method $method not supported for Delete Product Variant API",
      "timestamp": DateTime.now().toIso8601String(),
    };
  }

  @override
  List<String> get supportedMethods => ['DELETE'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'DELETE': [
          const ApiField(
            name: 'variant_id',
            label: 'Variant ID',
            hint: 'The ID of the product variant to delete',
            isRequired: true,
          ),
        ],
      };
}
