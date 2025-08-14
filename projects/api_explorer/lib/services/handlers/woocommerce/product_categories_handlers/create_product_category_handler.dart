import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/products/categories/abstract/product_categories_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';

class CreateProductCategoryHandler implements ApiRequestHandler {
  @override
  List<String> get supportedMethods => ['POST'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'POST': [
          ApiField(
            name: 'name',
            label: 'Category Name',
            hint: 'Enter the category name',
            isRequired: true,
          ),
          ApiField(
            name: 'slug',
            label: 'Category Slug',
            hint: 'URL slug for the category',
          ),
          ApiField(
            name: 'parent',
            label: 'Parent Category ID',
            hint: 'Parent category ID (0 for root category)',
          ),
          ApiField(
            name: 'description',
            label: 'Description',
            hint: 'Category description',
          ),
          ApiField(
            name: 'display',
            label: 'Display Type',
            hint:
                'How to display the category (default, products, subcategories, both)',
          ),
        ],
      };

  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'POST') {
      throw Exception('Only POST method is supported');
    }

    try {
      print('🐛 Create Product Category - Received params: $params');

      // Validate required parameters
      final name = params['name'];
      if (name == null || name.isEmpty) {
        throw Exception('name is required');
      }

      // Parse optional parameters
      final slug = params['slug'];
      final parentId =
          params['parent'] != null ? int.tryParse(params['parent']!) : null;
      final description = params['description'];
      final display = params['display'];

      // Create product data map
      final Map<String, dynamic> productData = {};

      productData['name'] = name;
      if (slug != null && slug.isNotEmpty) productData['slug'] = slug;
      if (parentId != null) productData['parent'] = parentId;
      if (description != null && description.isNotEmpty)
        productData['description'] = description;
      if (display != null && display.isNotEmpty)
        productData['display'] = display;

      print('🐛 Create Product Category - Request data: $productData');

      // Get the service and make the API call
      final service = WooNetwork.getIt.get<ProductCategoriesService>();
      final response = await service.createProductCategory(
        apiVersion: 'v3',
        categoryData: productData,
      );

      return {
        'success': true,
        'data': response.toJson(),
        'message': 'Product category created successfully',
      };
    } catch (e) {
      return {
        'success': false,
        'error': e.toString(),
        'message': 'Failed to create product category',
      };
    }
  }
}
