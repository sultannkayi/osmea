import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/products/attribute_terms/abstract/product_attribute_terms_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:flutter/foundation.dart';

class DeleteProductAttributeTermHandler implements ApiRequestHandler {
  @override
  List<String> get supportedMethods => ['DELETE'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'DELETE': [
          const ApiField(
            name: 'attribute_id',
            label: 'Attribute ID',
            hint: 'Attribute ID (required)',
            isRequired: true,
          ),
          const ApiField(
            name: 'term_id',
            label: 'Term ID',
            hint: 'Term ID to delete (required)',
            isRequired: true,
          ),
          const ApiField(
            name: 'force',
            label: 'Force Delete',
            hint: 'Whether to permanently delete (true/false/1/0)',
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
      // Validate required attribute_id parameter
      final attributeIdStr = params['attribute_id']?.toString() ?? '';
      final attributeId = int.tryParse(attributeIdStr);

      if (attributeId == null || attributeId <= 0) {
        return {
          'success': false,
          'message':
              'Valid attribute_id is required and must be a positive integer',
        };
      }

      // Validate required term_id parameter
      final termIdStr = params['term_id']?.toString() ?? '';
      final termId = int.tryParse(termIdStr);

      if (termId == null || termId <= 0) {
        return {
          'success': false,
          'message': 'Valid term_id is required and must be a positive integer',
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

      debugPrint('🗑️ Delete Product Attribute Term Parameters:');
      debugPrint('  API Version: $apiVersion');
      debugPrint('  Attribute ID: $attributeId');
      debugPrint('  Term ID: $termId');
      debugPrint('  Force Delete: $force');

      // Get service and call API
      final service = WooNetwork.getIt.get<ProductAttributeTermsService>();
      final response = await service.deleteProductAttributeTerm(
        apiVersion: apiVersion,
        attributeId: attributeId,
        termId: termId,
        force: force,
      );

      debugPrint('✅ Delete Product Attribute Term Success: ${response.toJson()}');

      // Provide appropriate message based on force parameter
      String successMessage = 'Product attribute term deleted successfully';
      if (force == true) {
        successMessage = 'Product attribute term permanently deleted';
      } else if (force == false) {
        successMessage = 'Product attribute term moved to trash';
      }

      return {
        'success': true,
        'message': successMessage,
        'data': response.toJson(),
      };
    } catch (e) {
      debugPrint('❌ Error: $e');

      return {
        'success': false,
        'message': 'Failed to delete product attribute term: $e',
        'error_details': e.toString(),
      };
    }
  }
}
