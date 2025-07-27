import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/products/product/abstract/products_service.dart';
import 'package:apis/network/remote/woocommerce/products/product/freezed_model/request/create_product_request.dart';
import 'package:example/services/api_request_handler.dart';
import 'package:example/services/api_service_registry.dart';

class CreateProductHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'POST') {
      return {
        'success': false,
        'error': 'Method $method not supported for Create Product API',
        'message': 'Only POST method is supported',
      };
    }

    try {
      final service = WooNetwork.getIt.get<ProductsService>();

      // Validate required parameters
      final name = params['name'];
      if (name == null || name.isEmpty) {
        return {
          'success': false,
          'error': 'Product name is required',
          'message': 'Please provide a valid product name',
        };
      }

      // Parse optional parameters
      final type = params['type']?.toString();
      final regularPrice = params['regular_price']?.toString();
      final description = params['description']?.toString();
      final shortDescription = params['short_description']?.toString();
      final sku = params['sku']?.toString();
      final manageStock =
          params['manage_stock']?.toString().toLowerCase() == 'true'
              ? true
              : null;
      final stockStatus = params['stock_status']?.toString();
      final status = params['status']?.toString();

      // Create the request object
      final createRequest = CreateProductRequest(
        name: name,
        type: type,
        regularPrice: regularPrice,
        description: description,
        shortDescription: shortDescription,
        sku: sku,
        manageStock: manageStock,
        stockStatus: stockStatus,
        status: status,
      );

      final response = await service.createProduct(
        apiVersion: 'v3',
        productData: createRequest.toJson(),
      );

      return {
        'success': true,
        'data': response.toJson(),
        'message': 'Product created successfully',
      };
    } catch (e) {
      return {
        'success': false,
        'error': e.toString(),
        'message': 'Failed to create product',
      };
    }
  }

  @override
  List<String> get supportedMethods => ['POST'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'POST': [
          const ApiField(
            name: 'name',
            label: 'Product Name',
            hint: 'Product name (required)',
            isRequired: true,
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
        ],
      };
}
