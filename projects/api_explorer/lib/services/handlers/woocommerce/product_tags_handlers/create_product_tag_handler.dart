import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/products/tags/abstract/product_tags_service.dart';
import 'package:apis/network/remote/woocommerce/products/tags/freezed_model/request/create_product_tag_request.dart';
import 'package:dio/dio.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';

class CreateProductTagHandler implements ApiRequestHandler {
  @override
  List<String> get supportedMethods => ['POST'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'POST': [
          const ApiField(
            name: 'name',
            label: 'Tag Name',
            hint: 'Tag name (required)',
            isRequired: true,
          ),
          const ApiField(
            name: 'slug',
            label: 'Slug',
            hint: 'Tag slug (optional)',
            isRequired: false,
          ),
          const ApiField(
            name: 'description',
            label: 'Description',
            hint: 'Tag description (optional)',
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
      // Validate required fields
      final name = params['name']?.toString().trim();
      if (name == null || name.isEmpty) {
        return {
          'success': false,
          'message': 'Tag name is required',
        };
      }

      // Parse API version
      final apiVersion = params['api_version']?.toString() ?? 'v3';

      // Parse optional fields
      final slug = params['slug']?.toString().trim();
      final description = params['description']?.toString().trim();

      // Create request object
      final createRequest = CreateProductTagRequest(
        name: name,
        slug: slug?.isNotEmpty == true ? slug : null,
        description: description?.isNotEmpty == true ? description : null,
      );

      print('🏷️ Create Product Tag Parameters:');
      print('  API Version: $apiVersion');
      print('  Name: $name');
      print('  Slug: $slug');
      print('  Description: $description');
      print('  Request body: ${createRequest.toJson()}');

      // Get service and call API
      final service = WooNetwork.getIt.get<ProductTagsService>();
      final response = await service.createProductTag(
        apiVersion: apiVersion,
        tagData: createRequest.toJson(),
      );

      print('✅ Create Product Tag Success: ${response.toJson()}');

      return {
        'success': true,
        'message': 'Product tag created successfully',
        'data': response.toJson(),
      };
    } on DioException catch (e) {
      String errorMessage = 'Failed to create product tag';

      if (e.response?.statusCode == 400) {
        errorMessage = 'Invalid tag data provided';
      } else if (e.response?.statusCode == 409) {
        errorMessage = 'Tag with this name or slug already exists';
      } else if (e.response?.data != null) {
        final responseData = e.response!.data;
        if (responseData is Map && responseData.containsKey('message')) {
          errorMessage = responseData['message']?.toString() ?? errorMessage;
        }
      }

      print('❌ Create Product Tag Error: $errorMessage');
      print('🔍 Full error: ${e.toString()}');

      return {
        'success': false,
        'message': errorMessage,
        'error_details': e.toString(),
      };
    } catch (e) {
      print('❌ Create Product Tag Unexpected Error: ${e.toString()}');
      return {
        'success': false,
        'message': 'Unexpected error occurred while creating product tag',
        'error_details': e.toString(),
      };
    }
  }
}
