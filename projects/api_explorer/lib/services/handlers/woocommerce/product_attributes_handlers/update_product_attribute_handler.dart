import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/products/attributes/abstract/product_attributes_service.dart';
import 'package:dio/dio.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';

class UpdateProductAttributeHandler implements ApiRequestHandler {
  @override
  List<String> get supportedMethods => ['PUT'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'PUT': [
          const ApiField(
            name: 'attribute_id',
            label: 'Attribute ID',
            hint: 'Attribute ID to update (required)',
            isRequired: true,
          ),
          const ApiField(
            name: 'name',
            label: 'Name',
            hint: 'Attribute name (optional)',
            isRequired: false,
          ),
          const ApiField(
            name: 'slug',
            label: 'Slug',
            hint: 'Attribute slug (optional)',
            isRequired: false,
          ),
          const ApiField(
            name: 'type',
            label: 'Type',
            hint: 'Attribute type (select, text, etc.)',
            isRequired: false,
          ),
          const ApiField(
            name: 'order_by',
            label: 'Order By',
            hint: 'Order by method (menu_order, name, name_num, id)',
            isRequired: false,
          ),
          const ApiField(
            name: 'has_archives',
            label: 'Has Archives',
            hint: 'Whether to create archives (true/false)',
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

      // Parse API version
      final apiVersion = params['api_version']?.toString() ?? 'v3';

      // Create attribute data map
      final Map<String, dynamic> attributeData = {};

      // Parse optional parameters
      final name = params['name']?.toString().trim();
      final slug = params['slug']?.toString().trim();
      final type = params['type']?.toString().trim();
      final orderBy = params['order_by']?.toString().trim();

      // Parse boolean parameter
      bool? hasArchives;
      if (params['has_archives'] != null) {
        final hasArchivesStr = params['has_archives'].toString().toLowerCase();
        if (hasArchivesStr == 'true' || hasArchivesStr == '1') {
          hasArchives = true;
        } else if (hasArchivesStr == 'false' || hasArchivesStr == '0') {
          hasArchives = false;
        }
      }

      // Build attribute data
      if (name?.isNotEmpty == true) {
        attributeData['name'] = name;
      }
      if (slug?.isNotEmpty == true) {
        attributeData['slug'] = slug;
      }
      if (type?.isNotEmpty == true) {
        attributeData['type'] = type;
      }
      if (orderBy?.isNotEmpty == true) {
        attributeData['order_by'] = orderBy;
      }
      if (hasArchives != null) {
        attributeData['has_archives'] = hasArchives;
      }

      print('✏️ Update Product Attribute Parameters:');
      print('  API Version: $apiVersion');
      print('  Attribute ID: $attributeId');
      print('  Name: $name');
      print('  Slug: $slug');
      print('  Type: $type');
      print('  Order By: $orderBy');
      print('  Has Archives: $hasArchives');
      print('  Request body: $attributeData');

      // Get service and call API
      final service = WooNetwork.getIt.get<ProductAttributesService>();
      final response = await service.updateProductAttribute(
        apiVersion: apiVersion,
        attributeId: attributeId,
        attributeData: attributeData,
      );

      print('✅ Update Product Attribute Success: ${response.toJson()}');

      return {
        'success': true,
        'message': 'Product attribute updated successfully',
        'data': response.toJson(),
      };
    } on DioException catch (e) {
      String errorMessage = 'Failed to update product attribute';

      if (e.response?.statusCode == 400) {
        errorMessage = 'Invalid attribute data provided';
      } else if (e.response?.statusCode == 404) {
        errorMessage = 'Product attribute not found';
      } else if (e.response?.statusCode == 409) {
        errorMessage = 'Attribute with this name or slug already exists';
      } else if (e.response?.data != null) {
        final responseData = e.response!.data;
        if (responseData is Map && responseData.containsKey('message')) {
          errorMessage = responseData['message']?.toString() ?? errorMessage;
        }
      }

      print('❌ Update Product Attribute Error: $errorMessage');
      print('🔍 Full error: ${e.toString()}');

      return {
        'success': false,
        'message': errorMessage,
        'error_details': e.toString(),
      };
    } catch (e) {
      print('❌ Update Product Attribute Unexpected Error: ${e.toString()}');
      return {
        'success': false,
        'message': 'Unexpected error occurred while updating product attribute',
        'error_details': e.toString(),
      };
    }
  }
}
