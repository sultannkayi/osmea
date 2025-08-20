import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/products/attribute_terms/abstract/product_attribute_terms_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:flutter/foundation.dart';

class ListAllProductAttributeTermsHandler implements ApiRequestHandler {
  @override
  List<String> get supportedMethods => ['GET'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'GET': [
          const ApiField(
            name: 'attribute_id',
            label: 'Attribute ID',
            hint: 'Attribute ID to list terms for (required)',
            isRequired: true,
          ),
          const ApiField(
            name: 'context',
            label: 'Context',
            hint: 'Scope under which the request is made (view, edit)',
            isRequired: false,
          ),
          const ApiField(
            name: 'page',
            label: 'Page',
            hint: 'Current page of the collection (default: 1)',
            isRequired: false,
          ),
          const ApiField(
            name: 'per_page',
            label: 'Per Page',
            hint: 'Maximum number of items to be returned (default: 10)',
            isRequired: false,
          ),
          const ApiField(
            name: 'search',
            label: 'Search',
            hint: 'Limit results to those matching a string',
            isRequired: false,
          ),
          const ApiField(
            name: 'exclude',
            label: 'Exclude',
            hint: 'Ensure result set excludes specific IDs (comma-separated)',
            isRequired: false,
          ),
          const ApiField(
            name: 'include',
            label: 'Include',
            hint: 'Limit result set to specific IDs (comma-separated)',
            isRequired: false,
          ),
          const ApiField(
            name: 'offset',
            label: 'Offset',
            hint: 'Offset the result set by a specific number of items',
            isRequired: false,
          ),
          const ApiField(
            name: 'order',
            label: 'Order',
            hint: 'Order sort attribute ascending or descending (asc, desc)',
            isRequired: false,
          ),
          const ApiField(
            name: 'orderby',
            label: 'Order By',
            hint:
                'Sort collection by object attribute (id, include, name, slug)',
            isRequired: false,
          ),
          const ApiField(
            name: 'hide_empty',
            label: 'Hide Empty',
            hint:
                'Whether to hide terms not assigned to any posts (true/false)',
            isRequired: false,
          ),
          const ApiField(
            name: 'parent',
            label: 'Parent',
            hint: 'Limit result set to terms assigned to a specific parent',
            isRequired: false,
          ),
          const ApiField(
            name: 'product',
            label: 'Product',
            hint: 'Limit result set to terms assigned to a specific product',
            isRequired: false,
          ),
          const ApiField(
            name: 'slug',
            label: 'Slug',
            hint: 'Limit result set to terms with a specific slug',
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

      // Parse API version
      final apiVersion = params['api_version']?.toString() ?? 'v3';

      // Parse optional parameters
      final context = params['context']?.toString();
      final search = params['search']?.toString();
      final slug = params['slug']?.toString();
      final order = params['order']?.toString();
      final orderby = params['orderby']?.toString();
      final parent = params['parent']?.toString();
      final product = params['product']?.toString();

      // Parse integer parameters
      int? page;
      if (params['page'] != null) {
        page = int.tryParse(params['page'].toString());
      }

      int? perPage;
      if (params['per_page'] != null) {
        perPage = int.tryParse(params['per_page'].toString());
      }

      int? offset;
      if (params['offset'] != null) {
        offset = int.tryParse(params['offset'].toString());
      }

      // Parse boolean parameter
      bool? hideEmpty;
      if (params['hide_empty'] != null) {
        final hideEmptyStr = params['hide_empty'].toString().toLowerCase();
        if (hideEmptyStr == 'true' || hideEmptyStr == '1') {
          hideEmpty = true;
        } else if (hideEmptyStr == 'false' || hideEmptyStr == '0') {
          hideEmpty = false;
        }
      }

      // Parse comma-separated lists
      List<int>? exclude;
      if (params['exclude']?.toString().isNotEmpty == true) {
        exclude = params['exclude']
            .toString()
            .split(',')
            .map((e) => int.tryParse(e.trim()))
            .where((e) => e != null)
            .cast<int>()
            .toList();
      }

      List<int>? include;
      if (params['include']?.toString().isNotEmpty == true) {
        include = params['include']
            .toString()
            .split(',')
            .map((e) => int.tryParse(e.trim()))
            .where((e) => e != null)
            .cast<int>()
            .toList();
      }

      debugPrint('📋 List All Product Attribute Terms Parameters:');
      debugPrint('  API Version: $apiVersion');
      debugPrint('  Attribute ID: $attributeId');
      debugPrint('  Context: $context');
      debugPrint('  Page: $page');
      debugPrint('  Per Page: $perPage');
      debugPrint('  Search: $search');
      debugPrint('  Exclude: $exclude');
      debugPrint('  Include: $include');
      debugPrint('  Offset: $offset');
      debugPrint('  Order: $order');
      debugPrint('  Order By: $orderby');
      debugPrint('  Hide Empty: $hideEmpty');
      debugPrint('  Parent: $parent');
      debugPrint('  Product: $product');
      debugPrint('  Slug: $slug');

      // Get service and call API
      final service = WooNetwork.getIt.get<ProductAttributeTermsService>();
      final response = await service.listAllProductAttributeTerms(
        apiVersion: apiVersion,
        attributeId: attributeId,
        context: context,
        page: page,
        perPage: perPage,
        search: search,
        exclude: exclude,
        include: include,
        offset: offset,
        order: order,
        orderby: orderby,
        hideEmpty: hideEmpty,
        parent: parent,
        product: product,
        slug: slug,
      );

      debugPrint(
          '✅ List All Product Attribute Terms Success: Found ${response.length} terms');

      return {
        'success': true,
        'data': response.map((term) => term.toJson()).toList(),
        'message': 'Product attribute terms retrieved successfully',
        'count': response.length,
      };
    } catch (e) {
      debugPrint('❌ Error: $e');

      return {
        'success': false,
        'message': 'Failed to retrieve product attribute terms: $e',
        'error_details': e.toString(),
      };
    }
  }
}
