import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/products/tags/abstract/product_tags_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:flutter/foundation.dart';

class RetrieveProductTagHandler implements ApiRequestHandler {
  @override
  List<String> get supportedMethods => ['GET'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'GET': [
          const ApiField(
            name: 'tag_id',
            label: 'Tag ID',
            hint: 'Product tag ID (required)',
            isRequired: true,
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

      debugPrint('🔍 Retrieve Product Tag Parameters:');
      debugPrint('  API Version: $apiVersion');
      debugPrint('  Tag ID: $tagId');

      // Get service and call API
      final service = WooNetwork.getIt.get<ProductTagsService>();
      final response = await service.retrieveProductTag(
        apiVersion: apiVersion,
        tagId: tagId,
      );

      debugPrint('✅ Retrieve Product Tag Success: ${response.toJson()}');

      return {
        'success': true,
        'message': 'Product tag retrieved successfully',
        'data': response.toJson(),
      };
    } catch (e) {
      String errorMessage = 'Failed to retrieve product tag';
      Map<String, dynamic> errorDetails = {};

      // Check if it's a network/HTTP related error
      if (e.toString().contains('DioException') || e.toString().contains('DioError')) {
        errorDetails['type'] = 'network_error';
        
        // Try to extract status code information from error string
        if (e.toString().contains('404')) {
          errorMessage = 'Product tag not found';
          errorDetails['status_code'] = 404;
        } else if (e.toString().contains('400')) {
          errorMessage = 'Bad request - invalid parameters';
          errorDetails['status_code'] = 400;
        } else if (e.toString().contains('401')) {
          errorMessage = 'Unauthorized - check your credentials';
          errorDetails['status_code'] = 401;
        } else if (e.toString().contains('500')) {
          errorMessage = 'Server error occurred';
          errorDetails['status_code'] = 500;
        } else {
          errorMessage = 'Network error occurred while retrieving product tag';
        }
      } else {
        errorDetails['type'] = 'unknown_error';
      }

      debugPrint('❌ Retrieve Product Tag Error: $errorMessage');
      debugPrint('🔍 Full error: ${e.toString()}');

      return {
        'success': false,
        'message': errorMessage,
        'error_details': errorDetails,
        'raw_error': e.toString(),
      };
    }
  }
}
