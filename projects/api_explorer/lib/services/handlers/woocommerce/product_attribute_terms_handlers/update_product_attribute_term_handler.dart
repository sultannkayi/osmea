import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/products/attribute_terms/abstract/product_attribute_terms_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:flutter/foundation.dart';

class UpdateProductAttributeTermHandler implements ApiRequestHandler {
  @override
  List<String> get supportedMethods => ['PUT'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'PUT': [
          const ApiField(
            name: 'attribute_id',
            label: 'Attribute ID',
            hint: 'Attribute ID (required)',
            isRequired: true,
          ),
          const ApiField(
            name: 'term_id',
            label: 'Term ID',
            hint: 'Term ID to update (required)',
            isRequired: true,
          ),
          const ApiField(
            name: 'name',
            label: 'Name',
            hint: 'Term name (optional)',
            isRequired: false,
          ),
          const ApiField(
            name: 'slug',
            label: 'Slug',
            hint: 'Term slug (optional)',
            isRequired: false,
          ),
          const ApiField(
            name: 'description',
            label: 'Description',
            hint: 'Term description (optional)',
            isRequired: false,
          ),
          const ApiField(
            name: 'menu_order',
            label: 'Menu Order',
            hint: 'Menu order for the term (optional)',
            isRequired: false,
          ),
          const ApiField(
            name: 'api_version',
            label: 'API Version',
            hint: 'WooCommerce API version (default: v3)',
            isRequired: false,
          ),
        ],
      };

  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, dynamic> params,
  ) async {
    try {
      // Validate required attribute_id parameter
      final attributeIdStr = params['attribute_id']?.toString() ?? '';
      final attributeId = int.tryParse(attributeIdStr);

      if (attributeId == null || attributeId <= 0) {
        return {
          'success': false,
          'message':
              'Valid attribute_id is required and must be a positive integer',
        };
      }

      // Validate required term_id parameter
      final termIdStr = params['term_id']?.toString() ?? '';
      final termId = int.tryParse(termIdStr);

      if (termId == null || termId <= 0) {
        return {
          'success': false,
          'message': 'Valid term_id is required and must be a positive integer',
        };
      }

      // Parse API version
      final apiVersion = params['api_version']?.toString() ?? 'v3';

      // Create term data map
      final Map<String, dynamic> termData = {};

      // Parse optional parameters
      final name = params['name']?.toString().trim();
      final slug = params['slug']?.toString().trim();
      final description = params['description']?.toString().trim();

      // Parse integer parameter
      int? menuOrder;
      if (params['menu_order'] != null) {
        menuOrder = int.tryParse(params['menu_order'].toString());
      }

      // Build term data
      if (name?.isNotEmpty == true) {
        termData['name'] = name;
      }
      if (slug?.isNotEmpty == true) {
        termData['slug'] = slug;
      }
      if (description?.isNotEmpty == true) {
        termData['description'] = description;
      }
      if (menuOrder != null) {
        termData['menu_order'] = menuOrder;
      }

      debugPrint('✏️ Update Product Attribute Term Parameters:');
      debugPrint('  API Version: $apiVersion');
      debugPrint('  Attribute ID: $attributeId');
      debugPrint('  Term ID: $termId');
      debugPrint('  Name: $name');
      debugPrint('  Slug: $slug');
      debugPrint('  Description: $description');
      debugPrint('  Menu Order: $menuOrder');
      debugPrint('  Request body: $termData');

      // Get service and call API
      final service = WooNetwork.getIt.get<ProductAttributeTermsService>();
      final response = await service.updateProductAttributeTerm(
        apiVersion: apiVersion,
        attributeId: attributeId,
        termId: termId,
        termData: termData,
      );

      debugPrint('✅ Update Product Attribute Term Success: ${response.toJson()}');

      return {
        'success': true,
        'message': 'Product attribute term updated successfully',
        'data': response.toJson(),
      };
    } catch (e) {
      debugPrint('❌ Error: $e');

      return {
        'success': false,
        'message': 'Failed to update product attribute term: $e',
        'error_details': e.toString(),
      };
    }
  }
}
