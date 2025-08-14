import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/products/product_variant/abstract/product_variant_service.dart';
import 'package:apis/network/remote/shopify/products/product_variant/freezed_model/request/create_product_variant_request.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///*******************************************************************
///*********** 🆕 CREATE PRODUCT VARIANT API HANDLER 🆕 ************
///*******************************************************************

class CreateProductVariantHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    // 📤 Only handle POST requests for creating product variants
    if (method == 'POST') {
      try {
        // Extract required product_id parameter
        final productId = params['product_id'];
        if (productId == null || productId.isEmpty) {
          return {
            "status": "error",
            "message": "product_id parameter is required",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

        // 📝 Extract variant fields from params
        final option1 = params['option1'];
        final option2 = params['option2'];
        final option3 = params['option3'];
        final price = params['price'];
        final compareAtPrice = params['compare_at_price'];
        final sku = params['sku'];
        final position = int.tryParse(params['position'] ?? '');
        final inventoryPolicy = params['inventory_policy'];
        final fulfillmentService = params['fulfillment_service'];
        final inventoryManagement = params['inventory_management'];
        final taxable = params['taxable']?.toLowerCase() == 'true';
        final barcode = params['barcode'];
        final grams = int.tryParse(params['grams'] ?? '');
        final imageId = int.tryParse(params['image_id'] ?? '');
        final weight = double.tryParse(params['weight'] ?? '');
        final weightUnit = params['weight_unit'];
        final requiresShipping =
            params['requires_shipping']?.toLowerCase() == 'true';

        // 🏗️ Build the product variant request
        final variant = ProductVariant(
          option1: option1,
          option2: option2,
          option3: option3,
          price: price,
          compareAtPrice: compareAtPrice,
          sku: sku,
          position: position,
          inventoryPolicy: inventoryPolicy,
          fulfillmentService: fulfillmentService,
          inventoryManagement: inventoryManagement,
          taxable: taxable,
          barcode: barcode,
          grams: grams,
          imageId: imageId,
          weight: weight,
          weightUnit: weightUnit,
          requiresShipping: requiresShipping,
        );

        final request = CreateProductVariantRequest(variant: variant);

        // 📞 Call the product variant service API to create variant
        final response =
            await GetIt.I.get<ProductVariantService>().createProductVariant(
                  apiVersion: ApiNetwork.apiVersion,
                  productId: productId,
                  model: request,
                );

        // 📋 Return success response
        return {
          "status": "success",
          "message": "Product variant created successfully",
          "product_id": productId,
          "variant": response.variant?.toJson(),
          "timestamp": DateTime.now().toIso8601String(),
        };
      } catch (e) {
        // ❌ Generic error handling
        return {
          "status": "error",
          "message": "Failed to create product variant: ${e.toString()}",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }
    }

    // ⛔ Unsupported method error
    return {
      "status": "error",
      "message": "Method $method not supported for Create Product Variant API",
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
            hint: 'The ID of the product to create a variant for',
            isRequired: true,
          ),
          const ApiField(
            name: 'option1',
            label: 'Option 1',
            hint: 'The first option value for the variant',
            isRequired: false,
          ),
          const ApiField(
            name: 'price',
            label: 'Price',
            hint: 'The price of the variant',
            isRequired: false,
          ),
        ],
      };
}
