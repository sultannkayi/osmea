import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/products/product_variant/abstract/product_variant_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///*******************************************************************
///************ 🔢 PRODUCT VARIANT COUNT API HANDLER 🔢 ************
///*******************************************************************

class RetrievesCountOfProductVariantsHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    // 🔒 Only handle GET requests for product variant count
    if (method == 'GET') {
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

        // 📞 Call the product variant service API to get count
        final variantsCount = await GetIt.I
            .get<ProductVariantService>()
            .retrievesCountOfProductVariants(
              apiVersion: ApiNetwork.apiVersion,
              productId: productId,
            );

        // 📋 Return the count value with product context
        return {
          "status": "success",
          "product_id": productId,
          "count": variantsCount.count,
          "timestamp": DateTime.now().toIso8601String(),
        };
      } catch (e) {
        // ❌ Generic error handling
        return {
          "status": "error",
          "message":
              "Failed to retrieve product variant count: ${e.toString()}",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }
    }

    // ⛔ Unsupported method error
    return {
      "status": "error",
      "message": "Method $method not supported for Product Variant Count API",
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
            hint: 'The ID of the product to count variants for',
            isRequired: true,
          ),
        ],
      };
}
