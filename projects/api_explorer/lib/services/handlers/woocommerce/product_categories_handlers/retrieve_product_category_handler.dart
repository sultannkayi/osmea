import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/products/categories/abstract/product_categories_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';

class RetrieveProductCategoryHandler implements ApiRequestHandler {
  @override
  List<String> get supportedMethods => ['GET'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'GET': [
          ApiField(
            name: 'category_id',
            label: 'Category ID',
            hint: 'The ID of the category to retrieve',
            isRequired: true,
          ),
        ],
      };

  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'GET') {
      throw Exception('Only GET method is supported');
    }

    try {
      // Validate required parameters
      final categoryIdStr = params['category_id'];
      if (categoryIdStr == null || categoryIdStr.isEmpty) {
        throw Exception('category_id is required');
      }

      final categoryId = int.tryParse(categoryIdStr);
      if (categoryId == null) {
        throw Exception('category_id must be a valid integer');
      }

      // Get the service and make the API call
      final service = WooNetwork.getIt.get<ProductCategoriesService>();
      final response = await service.retrieveProductCategory(
        apiVersion: 'v3',
        categoryId: categoryId,
      );

      return {
        'success': true,
        'data': response.toJson(),
        'message': 'Product category retrieved successfully',
      };
    } catch (e) {
      return {
        'success': false,
        'error': e.toString(),
        'message': 'Failed to retrieve product category',
      };
    }
  }
}
