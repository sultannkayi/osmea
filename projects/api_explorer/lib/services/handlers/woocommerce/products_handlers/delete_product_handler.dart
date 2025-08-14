import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/products/product/abstract/products_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';

class WooDeleteProductHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'DELETE') {
      return {
        'success': false,
        'error': 'Method $method not supported for Delete Product API',
        'message': 'Only DELETE method is supported',
      };
    }

    try {
      final service = WooNetwork.getIt.get<ProductsService>();

      // Validate required parameters
      final productIdStr = params['product_id'];
      if (productIdStr == null || productIdStr.isEmpty) {
        return {
          'success': false,
          'error': 'Product ID is required',
          'message': 'Please provide a valid product_id',
        };
      }

      final productId = int.tryParse(productIdStr);
      if (productId == null) {
        return {
          'success': false,
          'error': 'Invalid product ID format',
          'message': 'Product ID must be a valid integer',
        };
      }

      // Parse optional parameters
      final force = params['force']?.toString().toLowerCase() == 'true';

      final response = await service.deleteProduct(
        productId,
        force: force,
      );

      return {
        'success': true,
        'data': response.toJson(),
        'message': 'Product deleted successfully',
      };
    } catch (e) {
      return {
        'success': false,
        'error': e.toString(),
        'message': 'Failed to delete product',
      };
    }
  }

  @override
  List<String> get supportedMethods => ['DELETE'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'DELETE': [
          const ApiField(
            name: 'product_id',
            label: 'Product ID',
            hint: 'Unique identifier for the product (required)',
            isRequired: true,
          ),
          const ApiField(
            name: 'force',
            label: 'Force Delete',
            hint: 'Whether to bypass trash and force deletion (true/false)',
          ),
        ],
      };
}
