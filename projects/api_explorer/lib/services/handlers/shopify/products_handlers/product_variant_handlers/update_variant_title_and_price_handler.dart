import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/products/product_variant/abstract/product_variant_service.dart';
import 'package:apis/network/remote/shopify/products/product_variant/freezed_model/request/update_product_variant_request.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///*******************************************************************
///****** 💰 UPDATE VARIANT TITLE AND PRICE HANDLER 💰 ******
///*******************************************************************

class UpdateVariantTitleAndPriceHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    // 🔒 Only handle PUT requests for updating title and price
    if (method == 'PUT') {
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

        // Extract optional parameters
        final option1 = params['option1'];
        final price = params['price'];

        // Validate at least one parameter is provided
        if ((option1 == null || option1.isEmpty) &&
            (price == null || price.isEmpty)) {
          return {
            "status": "error",
            "message":
                "At least one of option1 (title) or price must be provided",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

        // 📞 Call the product variant service API to update title and price using standard API versioned method
        final updateRequest = UpdateProductVariantRequest(
          variant: UpdateProductVariant(
            id: int.tryParse(variantId),
            option1: option1?.isNotEmpty == true ? option1 : null,
            price: price?.isNotEmpty == true ? price : null,
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
          "message": "Product variant title and price updated successfully",
          "data": response.toJson(),
          "timestamp": DateTime.now().toIso8601String(),
        };
      } catch (e) {
        // ❌ Handle errors and return error response
        return {
          "status": "error",
          "message":
              "Failed to update variant title and price: ${e.toString()}",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }
    }

    // 🚫 Return error for unsupported methods
    return {
      "status": "error",
      "message":
          "Only PUT method is supported for updating variant title and price",
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
            hint: 'ID of the product variant to update',
            isRequired: true,
          ),
          const ApiField(
            name: 'option1',
            label: 'Title/Option1',
            hint: 'New title for the variant (e.g., "Small", "Red")',
            isRequired: false,
          ),
          const ApiField(
            name: 'price',
            label: 'Price',
            hint: 'New price for the variant (e.g., "19.99")',
            isRequired: false,
          ),
        ],
      };
}
