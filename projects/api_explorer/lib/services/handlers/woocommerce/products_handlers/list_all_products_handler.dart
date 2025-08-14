import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/products/product/abstract/products_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';

class ListAllProductsHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'GET') {
      return {
        'success': false,
        'error': 'Method $method not supported for List Products API',
        'message': 'Only GET method is supported',
      };
    }

    try {
      final service = WooNetwork.getIt.get<ProductsService>();

      // Parse optional parameters
      final context = params['context']?.toString();
      final page = int.tryParse(params['page']?.toString() ?? '');
      final perPage = int.tryParse(params['per_page']?.toString() ?? '');
      final search = params['search']?.toString();
      final after = params['after']?.toString();
      final before = params['before']?.toString();
      final exclude = params['exclude']?.toString();
      final include = params['include']?.toString();
      final offset = int.tryParse(params['offset']?.toString() ?? '');
      final order = params['order']?.toString();
      final orderBy = params['orderby']?.toString();
      final parent = params['parent']?.toString();
      final parentExclude = params['parent_exclude']?.toString();
      final slug = params['slug']?.toString();
      final status = params['status']?.toString();
      final type = params['type']?.toString();
      final sku = params['sku']?.toString();
      final featured =
          params['featured']?.toString().toLowerCase() == 'true' ? true : null;
      final category = params['category']?.toString();
      final tag = params['tag']?.toString();
      final shippingClass = params['shipping_class']?.toString();
      final attribute = params['attribute']?.toString();
      final attributeTerm = params['attribute_term']?.toString();
      final taxClass = params['tax_class']?.toString();
      final minPrice = params['min_price']?.toString();
      final maxPrice = params['max_price']?.toString();
      final stockStatus = params['stock_status']?.toString();
      final onSale =
          params['on_sale']?.toString().toLowerCase() == 'true' ? true : null;

      final response = await service.listAllProducts(
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
        orderBy: orderBy,
        parent: parent,
        parentExclude: parentExclude,
        slug: slug,
        status: status,
        type: type,
        sku: sku,
        featured: featured,
        category: category,
        tag: tag,
        shippingClass: shippingClass,
        attribute: attribute,
        attributeTerm: attributeTerm,
        taxClass: taxClass,
        minPrice: minPrice,
        maxPrice: maxPrice,
        stockStatus: stockStatus,
        onSale: onSale,
      );

      return {
        'success': true,
        'data': response.map((product) => product.toJson()).toList(),
        'message': 'Products retrieved successfully',
      };
    } catch (e) {
      return {
        'success': false,
        'error': e.toString(),
        'message': 'Failed to retrieve products',
      };
    }
  }

  @override
  List<String> get supportedMethods => ['GET'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'GET': [
          const ApiField(
            name: 'context',
            label: 'Context',
            hint: 'Scope under which the request is made (view/edit)',
          ),
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
            name: 'slug',
            label: 'Slug',
            hint: 'Limit result set to products with specific slug',
          ),
          const ApiField(
            name: 'status',
            label: 'Status',
            hint: 'Limit result set to products assigned a specific status',
          ),
          const ApiField(
            name: 'type',
            label: 'Type',
            hint: 'Limit result set to products assigned a specific type',
          ),
          const ApiField(
            name: 'sku',
            label: 'SKU',
            hint: 'Limit result set to products with specific SKU',
          ),
          const ApiField(
            name: 'featured',
            label: 'Featured',
            hint: 'Limit result set to featured products',
          ),
          const ApiField(
            name: 'category',
            label: 'Category',
            hint:
                'Limit result set to products assigned a specific category ID',
          ),
          const ApiField(
            name: 'tag',
            label: 'Tag',
            hint: 'Limit result set to products assigned a specific tag ID',
          ),
          const ApiField(
            name: 'min_price',
            label: 'Min Price',
            hint: 'Limit result set to products based on a minimum price',
          ),
          const ApiField(
            name: 'max_price',
            label: 'Max Price',
            hint: 'Limit result set to products based on a maximum price',
          ),
          const ApiField(
            name: 'stock_status',
            label: 'Stock Status',
            hint: 'Limit result set to products with specified stock status',
          ),
          const ApiField(
            name: 'on_sale',
            label: 'On Sale',
            hint: 'Limit result set to products on sale',
          ),
        ],
      };
}
