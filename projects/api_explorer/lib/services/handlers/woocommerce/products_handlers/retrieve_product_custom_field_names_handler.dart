import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/products/product/abstract/products_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';

class RetrieveProductCustomFieldNamesHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'GET') {
      return {
        'success': false,
        'error':
            'Method $method not supported for Retrieve Product Custom Field Names API',
        'message': 'Only GET method is supported',
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

      final response = await service.retrieveProductCustomFieldNames(productId);

      return {
        'success': true,
        'data': response,
        'message': 'Product custom field names retrieved successfully',
      };
    } catch (e) {
      return {
        'success': false,
        'error': e.toString(),
        'message': 'Failed to retrieve product custom field names',
      };
    }
  }

  @override
  List<String> get supportedMethods => ['GET'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'GET': [
          const ApiField(
            name: 'product_id',
            label: 'Product ID',
            hint: 'Unique identifier for the product (required)',
            isRequired: true,
          ),
        ],
      };
}
