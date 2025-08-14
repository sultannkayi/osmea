import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/products/product_variant/abstract/product_variant_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///*******************************************************************
///************ 📦 PRODUCT VARIANT LIST API HANDLER 📦 *************
///*******************************************************************

class RetrievesListOfProductVariantsHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    switch (method) {
      case 'GET':
        // 📌 GET request with optional query parameters
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

          // 📞 Call the product variant service API
          final response = await GetIt.I
              .get<ProductVariantService>()
              .retrievesListOfProductVariants(
                apiVersion: ApiNetwork.apiVersion,
                productId: productId,
                fields: params['fields']?.isNotEmpty == true
                    ? params['fields']
                    : null,
                limit: params['limit']?.isNotEmpty == true
                    ? int.tryParse(params['limit']!)
                    : null,
                presentmentCurrencies:
                    params['presentment_currencies']?.isNotEmpty == true
                        ? params['presentment_currencies']
                        : null,
                sinceId: params['since_id']?.isNotEmpty == true
                    ? params['since_id']
                    : null,
              );

          // 🔧 Extract fields parameter for filtering
          final fieldsParam =
              params['fields']?.isNotEmpty == true ? params['fields'] : null;

          // 📊 Organize variants by position or other criteria
          try {
            final Map<String, List<dynamic>> variantsByPosition = {};
            final variants = response.variants;

            // 🧮 Process each variant in the response
            for (final variant in variants!) {
              // 🔢 Use position as category, default to "Other" if not available
              String category = "Position ${variant.position ?? 'Unknown'}";

              // ➕ Add variant to category with field filtering applied
              if (!variantsByPosition.containsKey(category)) {
                variantsByPosition[category] = [];
              }

              // 🔧 Apply field filtering to variant data (same as collect handler)
              var variantJson = variant.toJson();
              if (fieldsParam != null && fieldsParam.isNotEmpty) {
                final fieldsList =
                    fieldsParam.split(',').map((f) => f.trim()).toList();
                final filteredJson = <String, dynamic>{};

                for (final field in fieldsList) {
                  if (variantJson.containsKey(field)) {
                    filteredJson[field] = variantJson[field];
                  }
                }
                variantJson = filteredJson;
              }

              variantsByPosition[category]!.add(variantJson);
            }

            // 🔄 Convert to categories list
            final List<Map<String, dynamic>> categories =
                variantsByPosition.entries.map((entry) {
              return {
                "category": entry.key,
                "variants": entry.value,
              };
            }).toList();

            return {
              "status": "success",
              "product_id": productId,
              "categories": categories,
              "filtered_by_fields":
                  fieldsParam != null && fieldsParam.isNotEmpty,
              "timestamp": DateTime.now().toIso8601String(),
            };
          } catch (e) {
            // 🚨 Fall back to simpler format if categorization fails
            var variantsData =
                response.variants?.map((v) => v.toJson()).toList() ?? [];

            // Apply field filtering to fallback response too
            if (fieldsParam != null && fieldsParam.isNotEmpty) {
              final fieldsList =
                  fieldsParam.split(',').map((f) => f.trim()).toList();

              variantsData = response.variants?.map((variant) {
                    final json = variant.toJson();
                    final filteredJson = <String, dynamic>{};

                    for (final field in fieldsList) {
                      if (json.containsKey(field)) {
                        filteredJson[field] = json[field];
                      }
                    }

                    return filteredJson;
                  }).toList() ??
                  [];
            }

            return {
              "status": "success",
              "product_id": productId,
              "variants": variantsData,
              "filtered_by_fields":
                  fieldsParam != null && fieldsParam.isNotEmpty,
              "timestamp": DateTime.now().toIso8601String(),
            };
          }
        } catch (e) {
          // ❌ Error handling
          return {
            "status": "error",
            "message": "Failed to fetch product variants: ${e.toString()}",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

      default:
        // ⛔ Unsupported method error
        return {
          "status": "error",
          "message":
              "Method $method not supported for Product Variants List API",
          "timestamp": DateTime.now().toIso8601String(),
        };
    }
  }

  @override
  List<String> get supportedMethods => ['GET'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'GET': [
          const ApiField(
            name: 'product_id',
            label: 'Product ID',
            hint: 'The ID of the product to get variants for',
            isRequired: true,
          ),
          const ApiField(
            name: 'fields',
            label: 'Fields',
            hint: 'Comma-separated list of fields to include in the response',
            isRequired: false,
          ),
          const ApiField(
            name: 'since_id',
            label: 'Since ID',
            hint: 'Show variants created after the specified ID',
            isRequired: false,
          ),
          const ApiField(
            name: 'limit',
            label: 'Limit',
            hint: 'Amount of results (default: 50, maximum: 250)',
            isRequired: false,
          ),
          const ApiField(
            name: 'presentment_currencies',
            label: 'Presentment Currencies',
            hint:
                'Comma-separated list of currency codes for presentment prices',
            isRequired: false,
          ),
        ],
      };
}
