import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/products/product/abstract/products_service.dart';
import 'package:example/services/api_request_handler.dart';
import 'package:example/services/api_service_registry.dart';

class UpdateProductHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'PUT') {
      return {
        'success': false,
        'error': 'Method $method not supported for Update Product API',
        'message': 'Only PUT method is supported',
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
      final Map<String, dynamic> productData = {};

      // Only include non-empty values
      if (params['name']?.isNotEmpty == true) {
        productData['name'] = params['name'];
      }
      if (params['type']?.isNotEmpty == true) {
        productData['type'] = params['type'];
      }
      if (params['regular_price']?.isNotEmpty == true) {
        productData['regular_price'] = params['regular_price'];
      }
      if (params['sale_price']?.isNotEmpty == true) {
        productData['sale_price'] = params['sale_price'];
      }
      if (params['description']?.isNotEmpty == true) {
        productData['description'] = params['description'];
      }
      if (params['short_description']?.isNotEmpty == true) {
        productData['short_description'] = params['short_description'];
      }
      if (params['sku']?.isNotEmpty == true) {
        productData['sku'] = params['sku'];
      }
      if (params['manage_stock']?.isNotEmpty == true) {
        productData['manage_stock'] =
            params['manage_stock']?.toLowerCase() == 'true';
      }
      if (params['stock_status']?.isNotEmpty == true) {
        productData['stock_status'] = params['stock_status'];
      }
      if (params['status']?.isNotEmpty == true) {
        productData['status'] = params['status'];
      }
      if (params['featured']?.isNotEmpty == true) {
        productData['featured'] = params['featured']?.toLowerCase() == 'true';
      }

      final response = await service.updateProduct(productId, productData);

      return {
        'success': true,
        'data': response.toJson(),
        'message': 'Product updated successfully',
      };
    } catch (e) {
      return {
        'success': false,
        'error': e.toString(),
        'message': 'Failed to update product',
      };
    }
  }

  @override
  List<String> get supportedMethods => ['PUT'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'PUT': [
          const ApiField(
            name: 'product_id',
            label: 'Product ID',
            hint: 'Unique identifier for the product (required)',
            isRequired: true,
          ),
          const ApiField(
            name: 'name',
            label: 'Product Name',
            hint: 'Product name',
          ),
          const ApiField(
            name: 'type',
            label: 'Product Type',
            hint: 'Product type (simple, grouped, external, variable)',
          ),
          const ApiField(
            name: 'regular_price',
            label: 'Regular Price',
            hint: 'Product regular price',
          ),
          const ApiField(
            name: 'sale_price',
            label: 'Sale Price',
            hint: 'Product sale price',
          ),
          const ApiField(
            name: 'description',
            label: 'Description',
            hint: 'Product description',
          ),
          const ApiField(
            name: 'short_description',
            label: 'Short Description',
            hint: 'Product short description',
          ),
          const ApiField(
            name: 'sku',
            label: 'SKU',
            hint: 'Unique identifier',
          ),
          const ApiField(
            name: 'manage_stock',
            label: 'Manage Stock',
            hint: 'Enable stock management (true/false)',
          ),
          const ApiField(
            name: 'stock_status',
            label: 'Stock Status',
            hint: 'Controls stock status (instock, outofstock, onbackorder)',
          ),
          const ApiField(
            name: 'status',
            label: 'Status',
            hint: 'Product status (draft, pending, private, publish)',
          ),
          const ApiField(
            name: 'featured',
            label: 'Featured',
            hint: 'Set product as featured (true/false)',
          ),
        ],
      };
}
