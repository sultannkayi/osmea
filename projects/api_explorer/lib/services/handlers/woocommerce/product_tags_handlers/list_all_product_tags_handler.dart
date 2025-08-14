import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/products/tags/abstract/product_tags_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';

class ListAllProductTagsHandler implements ApiRequestHandler {
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
            hint: 'Whether to hide tags not assigned to any products',
            isRequired: false,
          ),
          ApiField(
            name: 'product',
            label: 'Product ID',
            hint: 'Limit result set to tags assigned to a specific product',
            isRequired: false,
          ),
          ApiField(
            name: 'slug',
            label: 'Slug',
            hint: 'Limit result set to tags with a specific slug',
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

      print('🔍 List All Product Tags Parameters:');
      print('  API Version: $apiVersion');
      print('  Context: $context');
      print('  Page: $page');
      print('  Per Page: $perPage');
      print('  Search: $search');
      print('  Exclude: $exclude');
      print('  Include: $include');
      print('  Offset: $offset');
      print('  Order: $order');
      print('  Order By: $orderby');
      print('  Hide Empty: $hideEmpty');
      print('  Product: $product');
      print('  Slug: $slug');

      // Get service and call API
      final service = WooNetwork.getIt.get<ProductTagsService>();
      final response = await service.listAllProductTags(
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

      print('✅ List All Product Tags Success: Found ${response.length} tags');

      return {
        'success': true,
        'data': response.map((tag) => tag.toJson()).toList(),
        'message': 'Product tags retrieved successfully',
        'count': response.length,
      };
    } catch (e) {
      print('❌ List All Product Tags Error: ${e.toString()}');
      return {
        'success': false,
        'error': e.toString(),
        'message': 'Failed to retrieve product tags',
      };
    }
  }
}
