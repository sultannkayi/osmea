import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/products/tags/abstract/product_tags_service.dart';
import 'package:dio/dio.dart';
import 'package:example/services/api_request_handler.dart';
import 'package:example/services/api_service_registry.dart';

class UpdateProductTagHandler implements ApiRequestHandler {
  @override
  List<String> get supportedMethods => ['PUT'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'PUT': [
          const ApiField(
            name: 'tag_id',
            label: 'Tag ID',
            hint: 'Product tag ID (required)',
            isRequired: true,
          ),
          const ApiField(
            name: 'name',
            label: 'Tag Name',
            hint: 'Tag name (optional)',
            isRequired: false,
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
      // Validate required tag_id parameter
      final tagIdStr = params['tag_id']?.toString() ?? '';
      final tagId = int.tryParse(tagIdStr);

      if (tagId == null || tagId <= 0) {
        return {
          'success': false,
          'message': 'Valid tag_id is required and must be a positive integer',
        };
      }

      // Parse API version
      final apiVersion = params['api_version']?.toString() ?? 'v3';

      // Parse optional update fields
      final name = params['name']?.toString()?.trim();
      final slug = params['slug']?.toString()?.trim();
      final description = params['description']?.toString()?.trim();

      // Create update request map
      final Map<String, dynamic> updateData = {};

      if (name?.isNotEmpty == true) {
        updateData['name'] = name;
      }
      if (slug?.isNotEmpty == true) {
        updateData['slug'] = slug;
      }
      if (description?.isNotEmpty == true) {
        updateData['description'] = description;
      }

      print('✏️ Update Product Tag Parameters:');
      print('  API Version: $apiVersion');
      print('  Tag ID: $tagId');
      print('  Name: $name');
      print('  Slug: $slug');
      print('  Description: $description');
      print('  Request body: $updateData');

      // Get service and call API
      final service = WooNetwork.getIt.get<ProductTagsService>();
      final response = await service.updateProductTag(
        apiVersion: apiVersion,
        tagId: tagId,
        tagData: updateData,
      );

      print('✅ Update Product Tag Success: ${response.toJson()}');

      return {
        'success': true,
        'message': 'Product tag updated successfully',
        'data': response.toJson(),
      };
    } on DioException catch (e) {
      String errorMessage = 'Failed to update product tag';

      if (e.response?.statusCode == 404) {
        errorMessage = 'Product tag not found';
      } else if (e.response?.statusCode == 400) {
        errorMessage = 'Invalid tag data provided';
      } else if (e.response?.statusCode == 409) {
        errorMessage = 'Tag with this name or slug already exists';
      } else if (e.response?.data != null) {
        final responseData = e.response!.data;
        if (responseData is Map && responseData.containsKey('message')) {
          errorMessage = responseData['message']?.toString() ?? errorMessage;
        }
      }

      print('❌ Update Product Tag Error: $errorMessage');
      print('🔍 Full error: ${e.toString()}');

      return {
        'success': false,
        'message': errorMessage,
        'error_details': e.toString(),
      };
    } catch (e) {
      print('❌ Update Product Tag Unexpected Error: ${e.toString()}');
      return {
        'success': false,
        'message': 'Unexpected error occurred while updating product tag',
        'error_details': e.toString(),
      };
    }
  }
}
