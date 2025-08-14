import 'package:apis/apis.dart';
import 'package:dio/dio.dart';
import 'package:apis/network/remote/woocommerce/products/shipping_classes/abstract/product_shipping_classes_service.dart';
import 'package:apis/network/remote/woocommerce/products/shipping_classes/freezed_model/request/create_product_shipping_class_request.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';

class CreateProductShippingClassHandler implements ApiRequestHandler {
  @override
  List<String> get supportedMethods => ['POST'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'POST': [
          const ApiField(
            name: 'name',
            label: 'Name',
            hint: 'Shipping class name (required)',
            isRequired: true,
          ),
          const ApiField(
            name: 'slug',
            label: 'Slug',
            hint: 'Unique slug for the shipping class',
            isRequired: false,
          ),
          const ApiField(
            name: 'description',
            label: 'Description',
            hint: 'Description of the shipping class',
            isRequired: false,
          ),
          const ApiField(
            name: 'api_version',
            label: 'API Version',
            hint: 'WooCommerce API version (default: v3)',
            isRequired: false,
          ),
        ],
      };

  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, dynamic> params,
  ) async {
    try {
      // Parse name (required)
      final name = params['name']?.toString();
      if (name == null || name.trim().isEmpty) {
        return {
          'success': false,
          'message': 'Name is required and cannot be empty',
        };
      }

      // Parse API version
      final apiVersion = params['api_version']?.toString() ?? 'v3';

      // Parse optional fields
      final slug = params['slug']?.toString();
      final description = params['description']?.toString();

      print('🔍 Create Product Shipping Class Parameters:');
      print('  Name: $name');
      print('  Slug: $slug');
      print('  Description: $description');
      print('  API Version: $apiVersion');

      // Create request object
      final createRequest = CreateProductShippingClassRequest(
        name: name.trim(),
        slug: slug?.trim(),
        description: description?.trim(),
      );

      print('📋 Request Body: ${createRequest.toJson()}');

      // Get service and call API
      final service = WooNetwork.getIt.get<ProductShippingClassesService>();
      final response = await service.createProductShippingClass(
        apiVersion: apiVersion,
        shippingClassData: createRequest.toJson(),
      );

      print('✅ Create Product Shipping Class Success: ${response.toJson()}');

      return {
        'success': true,
        'message': 'Product shipping class created successfully',
        'data': response.toJson(),
      };
    } on DioException catch (e) {
      print('❌ Create Product Shipping Class DioException: ${e.toString()}');
      print('🔍 Status Code: ${e.response?.statusCode}');
      print('🔍 Response Data: ${e.response?.data}');
      print('🔍 Response Headers: ${e.response?.headers}');

      String errorMessage = 'Failed to create product shipping class';
      if (e.response?.statusCode == 400) {
        errorMessage = 'Invalid shipping class data provided';
      } else if (e.response?.statusCode == 409) {
        errorMessage = 'Shipping class with this name or slug already exists';
      } else if (e.response?.data != null) {
        final responseData = e.response!.data;
        if (responseData is Map && responseData.containsKey('message')) {
          errorMessage = responseData['message']?.toString() ?? errorMessage;
        }
      }

      return {
        'success': false,
        'message': errorMessage,
        'error_details': e.toString(),
      };
    } catch (e) {
      print('❌ Create Product Shipping Class Error: ${e.toString()}');
      return {
        'success': false,
        'message':
            'Unexpected error occurred while creating product shipping class',
        'error_details': e.toString(),
      };
    }
  }
}
