import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/products/categories/abstract/product_categories_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';

class ListAllProductCategoriesHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'GET') {
      return {
        'success': false,
        'error': 'Method $method not supported for List Product Categories API',
        'message': 'Only GET method is supported',
      };
    }

    try {
      final service = WooNetwork.getIt.get<ProductCategoriesService>();

      // Parse optional parameters
      final page = int.tryParse(params['page']?.toString() ?? '');
      final perPage = int.tryParse(params['per_page']?.toString() ?? '');
      final search = params['search']?.toString();

      // Parse exclude and include as List<int>
      final excludeStr = params['exclude']?.toString();
      final excludeList = excludeStr?.isNotEmpty == true
          ? excludeStr!
              .split(',')
              .map((e) => int.tryParse(e.trim()))
              .where((e) => e != null)
              .cast<int>()
              .toList()
          : null;

      final includeStr = params['include']?.toString();
      final includeList = includeStr?.isNotEmpty == true
          ? includeStr!
              .split(',')
              .map((e) => int.tryParse(e.trim()))
              .where((e) => e != null)
              .cast<int>()
              .toList()
          : null;

      final order = params['order']?.toString();
      final orderby = params['orderby']?.toString();
      final hideEmpty = params['hide_empty']?.toString().toLowerCase() == 'true'
          ? true
          : null;
      final parent = int.tryParse(params['parent']?.toString() ?? '');
      final product = int.tryParse(params['product']?.toString() ?? '');
      final slug = params['slug']?.toString();

      final response = await service.listAllProductCategories(
        apiVersion: 'v3',
        page: page,
        perPage: perPage,
        search: search,
        exclude: excludeList,
        include: includeList,
        order: order,
        orderby: orderby,
        hideEmpty: hideEmpty,
        parent: parent,
        product: product,
        slug: slug,
      );

      return {
        'success': true,
        'data': response.toJson(),
        'message': 'Product categories retrieved successfully',
      };
    } catch (e) {
      return {
        'success': false,
        'error': e.toString(),
        'message': 'Failed to retrieve product categories',
      };
    }
  }

  @override
  List<String> get supportedMethods => ['GET'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'GET': [
          const ApiField(
            name: 'page',
            label: 'Page',
            hint: 'Current page of the collection',
          ),
          const ApiField(
            name: 'per_page',
            label: 'Per Page',
            hint: 'Maximum number of items to return',
          ),
          const ApiField(
            name: 'search',
            label: 'Search',
            hint: 'Limit results to those matching a string',
          ),
          const ApiField(
            name: 'exclude',
            label: 'Exclude',
            hint: 'Ensure result set excludes specific IDs (comma-separated)',
          ),
          const ApiField(
            name: 'include',
            label: 'Include',
            hint: 'Limit result set to specific IDs (comma-separated)',
          ),
          const ApiField(
            name: 'order',
            label: 'Order',
            hint: 'Order sort attribute ascending or descending (asc/desc)',
          ),
          const ApiField(
            name: 'orderby',
            label: 'Order By',
            hint:
                'Sort collection by term attribute (id/include/name/slug/count)',
          ),
          const ApiField(
            name: 'hide_empty',
            label: 'Hide Empty',
            hint:
                'Whether to hide terms not assigned to any products (true/false)',
          ),
          const ApiField(
            name: 'parent',
            label: 'Parent',
            hint: 'Limit result set to terms assigned to a specific parent',
          ),
          const ApiField(
            name: 'product',
            label: 'Product',
            hint: 'Limit result set to terms assigned to a specific product',
          ),
          const ApiField(
            name: 'slug',
            label: 'Slug',
            hint: 'Limit result set to terms with a specific slug',
          ),
        ],
      };
}
