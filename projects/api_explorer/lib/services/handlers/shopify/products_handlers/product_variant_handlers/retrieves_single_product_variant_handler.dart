import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/products/product_variant/abstract/product_variant_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///*******************************************************************
///*********** 📦 SINGLE PRODUCT VARIANT API HANDLER 📦 ***********
///*******************************************************************

class RetrievesSingleProductVariantHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    // 🔒 Only handle GET requests for single product variant
    if (method == 'GET') {
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

        // 📞 Call the product variant service API to get single variant
        final response = await GetIt.I
            .get<ProductVariantService>()
            .retrievesSingleProductVariant(
              apiVersion: ApiNetwork.apiVersion,
              variantId: variantId,
              fields: params['fields']?.isNotEmpty == true
                  ? params['fields']
                  : null,
            );

        // 🔧 Extract fields parameter for filtering
        final fieldsParam =
            params['fields']?.isNotEmpty == true ? params['fields'] : null;

        // 🔧 Apply field filtering to variant data (same as collect handler)
        var variantData = response.variant?.toJson();
        if (variantData != null &&
            fieldsParam != null &&
            fieldsParam.isNotEmpty) {
          final fieldsList =
              fieldsParam.split(',').map((f) => f.trim()).toList();
          final filteredJson = <String, dynamic>{};

          for (final field in fieldsList) {
            if (variantData.containsKey(field)) {
              filteredJson[field] = variantData[field];
            }
          }
          variantData = filteredJson;
        }

        // 📋 Return the variant data
        return {
          "status": "success",
          "variant_id": variantId,
          "variant": variantData,
          "filtered_by_fields": fieldsParam != null && fieldsParam.isNotEmpty,
          "timestamp": DateTime.now().toIso8601String(),
        };
      } catch (e) {
        // ❌ Generic error handling
        return {
          "status": "error",
          "message": "Failed to retrieve product variant: ${e.toString()}",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }
    }

    // ⛔ Unsupported method error
    return {
      "status": "error",
      "message": "Method $method not supported for Single Product Variant API",
      "timestamp": DateTime.now().toIso8601String(),
    };
  }

  @override
  List<String> get supportedMethods => ['GET'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'GET': [
          const ApiField(
            name: 'variant_id',
            label: 'Variant ID',
            hint: 'The ID of the product variant to retrieve',
            isRequired: true,
          ),
          const ApiField(
            name: 'fields',
            label: 'Fields',
            hint: 'Comma-separated list of fields to include in the response',
            isRequired: false,
          ),
        ],
      };
}
