import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/products/tags/abstract/product_tags_service.dart';
import 'package:dio/dio.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';

class DeleteProductTagHandler implements ApiRequestHandler {
  @override
  List<String> get supportedMethods => ['DELETE'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'DELETE': [
          const ApiField(
            name: 'tag_id',
            label: 'Tag ID',
            hint: 'Product tag ID (required)',
            isRequired: true,
          ),
          const ApiField(
            name: 'force',
            label: 'Force Delete',
            hint: 'Whether to bypass trash and force deletion (true/false)',
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

      // Parse force parameter
      bool? force;
      if (params['force'] != null) {
        final forceStr = params['force'].toString().toLowerCase();
        if (forceStr == 'true' || forceStr == '1') {
          force = true;
        } else if (forceStr == 'false' || forceStr == '0') {
          force = false;
        }
      }

      print('🗑️ Delete Product Tag Parameters:');
      print('  API Version: $apiVersion');
      print('  Tag ID: $tagId');
      print('  Force Delete: $force');

      // Get service and call API
      final service = WooNetwork.getIt.get<ProductTagsService>();
      final response = await service.deleteProductTag(
        apiVersion: apiVersion,
        tagId: tagId,
        force: force,
      );

      print('✅ Delete Product Tag Success: ${response.toJson()}');

      // Provide different messages based on force parameter
      final deletionType =
          force == true ? 'permanently deleted' : 'moved to trash';

      return {
        'success': true,
        'message': 'Product tag $deletionType successfully',
        'data': response.toJson(),
      };
    } on DioException catch (e) {
      String errorMessage = 'Failed to delete product tag';

      if (e.response?.statusCode == 404) {
        errorMessage = 'Product tag not found';
      } else if (e.response?.statusCode == 410) {
        errorMessage = 'Product tag already deleted';
      } else if (e.response?.statusCode == 409) {
        errorMessage = 'Cannot delete product tag that is assigned to products';
      } else if (e.response?.data != null) {
        final responseData = e.response!.data;
        if (responseData is Map && responseData.containsKey('message')) {
          errorMessage = responseData['message']?.toString() ?? errorMessage;
        }
      }

      print('❌ Delete Product Tag Error: $errorMessage');
      print('🔍 Full error: ${e.toString()}');

      return {
        'success': false,
        'message': errorMessage,
        'error_details': e.toString(),
      };
    } catch (e) {
      print('❌ Delete Product Tag Unexpected Error: ${e.toString()}');
      return {
        'success': false,
        'message': 'Unexpected error occurred while deleting product tag',
        'error_details': e.toString(),
      };
    }
  }
}
