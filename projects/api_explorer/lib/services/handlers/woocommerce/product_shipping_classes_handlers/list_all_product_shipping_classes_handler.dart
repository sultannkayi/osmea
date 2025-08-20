import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/products/shipping_classes/abstract/product_shipping_classes_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:flutter/foundation.dart';

class ListAllProductShippingClassesHandler implements ApiRequestHandler {
  @override
  List<String> get supportedMethods => ['GET'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'GET': [
          ApiField(
            name: 'context',
            label: 'Context',
            hint: 'Scope under which the request is made (view, edit)',
            isRequired: false,
          ),
          ApiField(
            name: 'page',
            label: 'Page',
            hint: 'Current page of the collection (default: 1)',
            isRequired: false,
          ),
          ApiField(
            name: 'per_page',
            label: 'Per Page',
            hint: 'Maximum number of items to be returned (default: 10)',
            isRequired: false,
          ),
          ApiField(
            name: 'search',
            label: 'Search',
            hint: 'Limit results to those matching a string',
            isRequired: false,
          ),
          ApiField(
            name: 'exclude',
            label: 'Exclude',
            hint: 'Ensure result set excludes specific IDs (comma-separated)',
            isRequired: false,
          ),
          ApiField(
            name: 'include',
            label: 'Include',
            hint: 'Limit result set to specific IDs (comma-separated)',
            isRequired: false,
          ),
          ApiField(
            name: 'offset',
            label: 'Offset',
            hint: 'Offset the result set by a specific number of items',
            isRequired: false,
          ),
          ApiField(
            name: 'order',
            label: 'Order',
            hint: 'Order sort attribute ascending or descending (asc, desc)',
            isRequired: false,
          ),
          ApiField(
            name: 'orderby',
            label: 'Order By',
            hint:
                'Sort collection by term attribute (id, include, name, slug, count)',
            isRequired: false,
          ),
          ApiField(
            name: 'hide_empty',
            label: 'Hide Empty',
            hint:
                'Whether to hide shipping classes not assigned to any products',
            isRequired: false,
          ),
          ApiField(
            name: 'product',
            label: 'Product ID',
            hint:
                'Limit result set to shipping classes assigned to a specific product',
            isRequired: false,
          ),
          ApiField(
            name: 'slug',
            label: 'Slug',
            hint: 'Limit result set to shipping classes with a specific slug',
            isRequired: false,
          ),
          ApiField(
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
      // Parse API version
      final apiVersion = params['api_version']?.toString() ?? 'v3';

      // Parse optional parameters
      final context = params['context']?.toString();
      final search = params['search']?.toString();
      final slug = params['slug']?.toString();
      final order = params['order']?.toString();
      final orderby = params['orderby']?.toString();

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

      int? product;
      if (params['product'] != null) {
        product = int.tryParse(params['product'].toString());
      }

      // Parse boolean parameters
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

      debugPrint('🔍 List All Product Shipping Classes Parameters:');
      debugPrint('  API Version: $apiVersion');
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
      debugPrint('  Product: $product');
      debugPrint('  Slug: $slug');

      // Get service and call API
      final service = WooNetwork.getIt.get<ProductShippingClassesService>();
      final response = await service.listAllProductShippingClasses(
        apiVersion: apiVersion,
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
        product: product,
        slug: slug,
      );

      debugPrint(
          '✅ List All Product Shipping Classes Success: Found ${response.length} shipping classes');

      return {
        'success': true,
        'data':
            response.map((shippingClass) => shippingClass.toJson()).toList(),
        'message': 'Product shipping classes retrieved successfully',
        'count': response.length,
      };
    } catch (e) {
      debugPrint('❌ List All Product Shipping Classes Error: ${e.toString()}');
      return {
        'success': false,
        'error': e.toString(),
        'message': 'Failed to retrieve product shipping classes',
      };
    }
  }
}
