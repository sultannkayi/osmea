import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/products/attributes/abstract/product_attributes_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:flutter/foundation.dart';

class CreateProductAttributeHandler implements ApiRequestHandler {
  @override
  List<String> get supportedMethods => ['POST'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'POST': [
          const ApiField(
            name: 'name',
            label: 'Name',
            hint: 'Attribute name (required)',
            isRequired: true,
          ),
          const ApiField(
            name: 'slug',
            label: 'Slug',
            hint: 'Attribute slug (optional)',
            isRequired: false,
          ),
          const ApiField(
            name: 'type',
            label: 'Type',
            hint: 'Attribute type (select, text, etc.)',
            isRequired: false,
          ),
          const ApiField(
            name: 'order_by',
            label: 'Order By',
            hint: 'Order by method (menu_order, name, name_num, id)',
            isRequired: false,
          ),
          const ApiField(
            name: 'has_archives',
            label: 'Has Archives',
            hint: 'Whether to create archives (true/false)',
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
      // Validate required name parameter
      final name = params['name']?.toString().trim();
      if (name == null || name.isEmpty) {
        return {
          'success': false,
          'message': 'Name is required and cannot be empty',
        };
      }

      // Parse API version
      final apiVersion = params['api_version']?.toString() ?? 'v3';

      // Create attribute data map
      final Map<String, dynamic> attributeData = {};

      // Add required name
      attributeData['name'] = name;

      // Parse optional parameters
      final slug = params['slug']?.toString().trim();
      final type = params['type']?.toString().trim();
      final orderBy = params['order_by']?.toString().trim();

      // Parse boolean parameter
      bool? hasArchives;
      if (params['has_archives'] != null) {
        final hasArchivesStr = params['has_archives'].toString().toLowerCase();
        if (hasArchivesStr == 'true' || hasArchivesStr == '1') {
          hasArchives = true;
        } else if (hasArchivesStr == 'false' || hasArchivesStr == '0') {
          hasArchives = false;
        }
      }

      // Build attribute data
      if (slug?.isNotEmpty == true) {
        attributeData['slug'] = slug;
      }
      if (type?.isNotEmpty == true) {
        attributeData['type'] = type;
      }
      if (orderBy?.isNotEmpty == true) {
        attributeData['order_by'] = orderBy;
      }
      if (hasArchives != null) {
        attributeData['has_archives'] = hasArchives;
      }

      debugPrint('➕ Create Product Attribute Parameters:');
      debugPrint('  API Version: $apiVersion');
      debugPrint('  Name: $name');
      debugPrint('  Slug: $slug');
      debugPrint('  Type: $type');
      debugPrint('  Order By: $orderBy');
      debugPrint('  Has Archives: $hasArchives');
      debugPrint('  Request body: $attributeData');

      // Get service and call API
      final service = WooNetwork.getIt.get<ProductAttributesService>();
      final response = await service.createProductAttribute(
        apiVersion: apiVersion,
        attributeData: attributeData,
      );

      debugPrint('✅ Create Product Attribute Success: ${response.toJson()}');

      return {
        'success': true,
        'message': 'Product attribute created successfully',
        'data': response.toJson(),
      };
    } catch (e) {
      debugPrint('❌ Error: $e');

      return {
        'success': false,
        'message': 'Failed to create product attribute: $e',
        'error_details': e.toString(),
      };
    }
  }
}
