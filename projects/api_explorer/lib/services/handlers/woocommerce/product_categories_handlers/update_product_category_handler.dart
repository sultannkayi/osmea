import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/products/categories/abstract/product_categories_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:flutter/foundation.dart';

class UpdateProductCategoryHandler implements ApiRequestHandler {
  @override
  List<String> get supportedMethods => ['PUT'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'PUT': [
          ApiField(
            name: 'category_id',
            label: 'Category ID',
            hint: 'The ID of the category to update',
            isRequired: true,
          ),
          ApiField(
            name: 'name',
            label: 'Category Name',
            hint: 'Enter the category name',
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
    if (method != 'PUT') {
      throw Exception('Only PUT method is supported');
    }

    try {
      debugPrint('🐛 Update Product Category - Received params: $params');

      // Validate required parameters
      final categoryIdStr = params['category_id'];
      if (categoryIdStr == null || categoryIdStr.isEmpty) {
        throw Exception('category_id is required');
      }

      final categoryId = int.tryParse(categoryIdStr);
      if (categoryId == null) {
        throw Exception('category_id must be a valid integer');
      }

      // Parse optional parameters
      final name = params['name'];
      final slug = params['slug'];
      final parentId =
          params['parent'] != null ? int.tryParse(params['parent']!) : null;
      final description = params['description'];
      final display = params['display'];

      // Create category data map (only include non-empty values)
      final Map<String, dynamic> categoryData = {};

      if (name != null && name.isNotEmpty) categoryData['name'] = name;
      if (slug != null && slug.isNotEmpty) categoryData['slug'] = slug;
      if (parentId != null) categoryData['parent'] = parentId;
      if (description != null && description.isNotEmpty) {
        categoryData['description'] = description;
      }
      if (display != null && display.isNotEmpty) {
        categoryData['display'] = display;
      }

      debugPrint('🐛 Update Product Category - Request data: $categoryData');

      // Get the service and make the API call
      final service = WooNetwork.getIt.get<ProductCategoriesService>();
      final response = await service.updateProductCategory(
        apiVersion: 'v3',
        categoryId: categoryId,
        categoryData: categoryData,
      );

      return {
        'success': true,
        'data': response.toJson(),
        'message': 'Product category updated successfully',
      };
    } catch (e) {
      return {
        'success': false,
        'error': e.toString(),
        'message': 'Failed to update product category',
      };
    }
  }
}
