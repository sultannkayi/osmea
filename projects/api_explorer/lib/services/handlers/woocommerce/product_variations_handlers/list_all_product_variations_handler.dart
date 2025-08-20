import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/products/variations/abstract/product_variations_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:flutter/foundation.dart';

class ListAllProductVariationsHandler implements ApiRequestHandler {
  @override
  List<String> get supportedMethods => ['GET'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'GET': [
          const ApiField(
            name: 'product_id',
            label: 'Product ID',
            hint: 'Product ID to get variations for (required)',
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
            name: 'after',
            label: 'After',
            hint:
                'Limit response to resources published after a given ISO8601 date',
            isRequired: false,
          ),
          const ApiField(
            name: 'before',
            label: 'Before',
            hint:
                'Limit response to resources published before a given ISO8601 date',
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
                'Sort collection by object attribute (date, id, include, title, slug)',
            isRequired: false,
          ),
          const ApiField(
            name: 'parent',
            label: 'Parent',
            hint:
                'Limit result set to those of particular parent IDs (comma-separated)',
            isRequired: false,
          ),
          const ApiField(
            name: 'parent_exclude',
            label: 'Parent Exclude',
            hint:
                'Limit result set to all items except those of a particular parent ID (comma-separated)',
            isRequired: false,
          ),
          const ApiField(
            name: 'slug',
            label: 'Slug',
            hint: 'Limit result set to products with a specific slug',
            isRequired: false,
          ),
          const ApiField(
            name: 'status',
            label: 'Status',
            hint: 'Limit result set to products assigned a specific status',
            isRequired: false,
          ),
          const ApiField(
            name: 'sku',
            label: 'SKU',
            hint: 'Limit result set to products with a specific SKU',
            isRequired: false,
          ),
          const ApiField(
            name: 'featured',
            label: 'Featured',
            hint: 'Limit result set to featured products',
            isRequired: false,
          ),
          const ApiField(
            name: 'category',
            label: 'Category',
            hint:
                'Limit result set to products assigned a specific category ID',
            isRequired: false,
          ),
          const ApiField(
            name: 'tag',
            label: 'Tag',
            hint: 'Limit result set to products assigned a specific tag ID',
            isRequired: false,
          ),
          const ApiField(
            name: 'shipping_class',
            label: 'Shipping Class',
            hint:
                'Limit result set to products assigned a specific shipping class ID',
            isRequired: false,
          ),
          const ApiField(
            name: 'attribute',
            label: 'Attribute',
            hint: 'Limit result set to products with a specific attribute',
            isRequired: false,
          ),
          const ApiField(
            name: 'attribute_term',
            label: 'Attribute Term',
            hint:
                'Limit result set to products with a specific attribute term ID',
            isRequired: false,
          ),
          const ApiField(
            name: 'tax_class',
            label: 'Tax Class',
            hint: 'Limit result set to products with a specific tax class',
            isRequired: false,
          ),
          const ApiField(
            name: 'on_sale',
            label: 'On Sale',
            hint: 'Limit result set to products on sale',
            isRequired: false,
          ),
          const ApiField(
            name: 'min_price',
            label: 'Min Price',
            hint: 'Limit result set to products based on a minimum price',
            isRequired: false,
          ),
          const ApiField(
            name: 'max_price',
            label: 'Max Price',
            hint: 'Limit result set to products based on a maximum price',
            isRequired: false,
          ),
          const ApiField(
            name: 'stock_status',
            label: 'Stock Status',
            hint: 'Limit result set to products with specified stock status',
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
      // Validate required product_id parameter
      final productIdStr = params['product_id']?.toString() ?? '';
      final productId = int.tryParse(productIdStr);

      if (productId == null || productId <= 0) {
        return {
          'success': false,
          'message':
              'Valid product_id is required and must be a positive integer',
        };
      }

      // Parse API version
      final apiVersion = params['api_version']?.toString() ?? 'v3';

      // Parse optional parameters
      final context = params['context']?.toString();
      final search = params['search']?.toString();
      final after = params['after']?.toString();
      final before = params['before']?.toString();
      final slug = params['slug']?.toString();
      final status = params['status']?.toString();
      final sku = params['sku']?.toString();
      final featured = params['featured']?.toString();
      final category = params['category']?.toString();
      final tag = params['tag']?.toString();
      final shippingClass = params['shipping_class']?.toString();
      final attribute = params['attribute']?.toString();
      final attributeTerm = params['attribute_term']?.toString();
      final taxClass = params['tax_class']?.toString();
      final onSale = params['on_sale']?.toString();
      final minPrice = params['min_price']?.toString();
      final maxPrice = params['max_price']?.toString();
      final stockStatus = params['stock_status']?.toString();
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

      List<int>? parent;
      if (params['parent']?.toString().isNotEmpty == true) {
        parent = params['parent']
            .toString()
            .split(',')
            .map((e) => int.tryParse(e.trim()))
            .where((e) => e != null)
            .cast<int>()
            .toList();
      }

      List<int>? parentExclude;
      if (params['parent_exclude']?.toString().isNotEmpty == true) {
        parentExclude = params['parent_exclude']
            .toString()
            .split(',')
            .map((e) => int.tryParse(e.trim()))
            .where((e) => e != null)
            .cast<int>()
            .toList();
      }

      debugPrint('🔄 List All Product Variations Parameters:');
      debugPrint('  API Version: $apiVersion');
      debugPrint('  Product ID: $productId');
      debugPrint('  Context: $context');
      debugPrint('  Page: $page');
      debugPrint('  Per Page: $perPage');
      debugPrint('  Search: $search');
      debugPrint('  After: $after');
      debugPrint('  Before: $before');
      debugPrint('  Exclude: $exclude');
      debugPrint('  Include: $include');
      debugPrint('  Offset: $offset');
      debugPrint('  Order: $order');
      debugPrint('  Order By: $orderby');
      debugPrint('  Parent: $parent');
      debugPrint('  Parent Exclude: $parentExclude');
      debugPrint('  Slug: $slug');
      debugPrint('  Status: $status');
      debugPrint('  SKU: $sku');
      debugPrint('  Featured: $featured');
      debugPrint('  Category: $category');
      debugPrint('  Tag: $tag');
      debugPrint('  Shipping Class: $shippingClass');
      debugPrint('  Attribute: $attribute');
      debugPrint('  Attribute Term: $attributeTerm');
      debugPrint('  Tax Class: $taxClass');
      debugPrint('  On Sale: $onSale');
      debugPrint('  Min Price: $minPrice');
      debugPrint('  Max Price: $maxPrice');
      debugPrint('  Stock Status: $stockStatus');

      // Get service and call API
      final service = WooNetwork.getIt.get<ProductVariationsService>();
      final response = await service.listAllProductVariations(
        apiVersion: apiVersion,
        productId: productId,
        context: context,
        page: page,
        perPage: perPage,
        search: search,
        after: after,
        before: before,
        exclude: exclude,
        include: include,
        offset: offset,
        order: order,
        orderby: orderby,
        parent: parent,
        parentExclude: parentExclude,
        slug: slug,
        status: status,
        sku: sku,
        featured: featured,
        category: category,
        tag: tag,
        shippingClass: shippingClass,
        attribute: attribute,
        attributeTerm: attributeTerm,
        taxClass: taxClass,
        onSale: onSale,
        minPrice: minPrice,
        maxPrice: maxPrice,
        stockStatus: stockStatus,
      );

      debugPrint(
          '✅ List All Product Variations Success: Found ${response.length} variations for product $productId');

      return {
        'success': true,
        'data': response.map((variation) => variation.toJson()).toList(),
        'message': 'Product variations retrieved successfully',
        'count': response.length,
        'product_id': productId,
      };
    } catch (e) {
      debugPrint('❌ Error: $e');

      return {
        'success': false,
        'message': 'Failed to retrieve product variations: $e',
        'error_details': e.toString(),
      };
    }
  }
}
