import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/products/categories/abstract/product_categories_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:flutter/foundation.dart';

class DeleteProductCategoryHandler implements ApiRequestHandler {
  @override
  List<String> get supportedMethods => ['DELETE'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'DELETE': [
          ApiField(
            name: 'category_id',
            label: 'Category ID',
            hint: 'The ID of the category to delete',
            isRequired: true,
          ),
          ApiField(
            name: 'force',
            label: 'Force Delete',
            hint: 'Whether to bypass trash and force deletion (true/false)',
          ),
        ],
      };

  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'DELETE') {
      throw Exception('Only DELETE method is supported');
    }

    try {
      debugPrint('🐛 Delete Product Category - Received params: $params');

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
      final forceStr = params['force'];
      final force = forceStr?.toLowerCase() == 'true' ? true : null;

      debugPrint(
          '🐛 Delete Product Category - Category ID: $categoryId, Force: $force');

      // Get the service and make the API call
      final service = WooNetwork.getIt.get<ProductCategoriesService>();
      final response = await service.deleteProductCategory(
        apiVersion: 'v3',
        categoryId: categoryId,
        force: force,
      );

      return {
        'success': true,
        'data': response.toJson(),
        'message': 'Product category deleted successfully',
      };
    } catch (e) {
      return {
        'success': false,
        'error': e.toString(),
        'message': 'Failed to delete product category',
      };
    }
  }
}
