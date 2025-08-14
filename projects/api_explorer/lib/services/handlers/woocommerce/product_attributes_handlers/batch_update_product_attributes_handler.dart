import 'package:apis/network/remote/woocommerce/products/attributes/abstract/product_attributes_service.dart';
import 'package:apis/network/remote/woocommerce/products/attributes/freezed_model/request/batch_update_product_attribute_request.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:get_it/get_it.dart';
import 'package:api_explorer/services/api_service_registry.dart';

///*******************************************************************
//************ 📦 BATCH UPDATE PRODUCT ATTRIBUTES HANDLER **********
///*******************************************************************

class BatchUpdateProductAttributesHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'PATCH') {
      return {
        "status": "error",
        "message":
            "Method $method not supported for Batch Update Product Attributes API",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      // Parse create operations
      List<Creat>? createOperations;
      if (params.containsKey('create_operations')) {
        createOperations = _parseCreateOperations(params['create_operations']!);
      }

      // Parse update operations
      List<Update>? updateOperations;
      if (params.containsKey('update_operations')) {
        updateOperations = _parseUpdateOperations(params['update_operations']!);
      }

      // Parse delete operations
      List<int>? deleteOperations;
      if (params.containsKey('delete_operations')) {
        deleteOperations = params['delete_operations']!
            .split(',')
            .map((e) => int.tryParse(e.trim()))
            .where((e) => e != null)
            .cast<int>()
            .toList();
      }

      // Create batch request
      final batchData = BatchUpdateProductAttributeRequest(
        creat: createOperations,
        update: updateOperations,
        delete: deleteOperations,
      );

      final response = await GetIt.I<ProductAttributesService>()
          .batchUpdateProductAttributes(
        apiVersion: params['api_version'] ?? 'v3',
        batchData: batchData,
      );

      return {
        "status": "success",
        "message": "Batch update completed successfully",
        "data": response,
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      return {
        "status": "error",
        "message": "Failed to batch update product attributes: ${e.toString()}",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  List<Creat> _parseCreateOperations(String createData) {
    // Expected format: "name1:slug1:type1:orderby1:hasarchives1,name2:slug2:type2:orderby2:hasarchives2"
    return createData
        .split(',')
        .map((operation) {
          final parts = operation.split(':');
          if (parts.length >= 2) {
            return Creat(
              name: parts[0].trim(),
              slug: parts.length > 1 ? parts[1].trim() : null,
              type: parts.length > 2 ? parts[2].trim() : 'select',
              orderBy: parts.length > 3 ? parts[3].trim() : 'menu_order',
              hasArchives: parts.length > 4 ? parts[4].trim() == 'true' : false,
            );
          }
          return null;
        })
        .where((item) => item != null)
        .cast<Creat>()
        .toList();
  }

  List<Update> _parseUpdateOperations(String updateData) {
    // Expected format: "id1:name1:slug1:type1:orderby1:hasarchives1,id2:name2:slug2:type2:orderby2:hasarchives2"
    return updateData
        .split(',')
        .map((operation) {
          final parts = operation.split(':');
          if (parts.length >= 2) {
            return Update(
              id: int.tryParse(parts[0].trim()),
              name: parts.length > 1 ? parts[1].trim() : null,
              slug: parts.length > 2 ? parts[2].trim() : null,
              type: parts.length > 3 ? parts[3].trim() : null,
              orderBy: parts.length > 4 ? parts[4].trim() : null,
              hasArchives: parts.length > 5 ? parts[5].trim() == 'true' : null,
            );
          }
          return null;
        })
        .where((item) => item != null)
        .cast<Update>()
        .toList();
  }

  @override
  List<String> get supportedMethods => ['PATCH'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'PATCH': [
          const ApiField(
            name: 'create_operations',
            label: 'Create Operations',
            hint:
                'Create operations in format: name:slug:type:orderby:hasarchives,name2:slug2:type2:orderby2:hasarchives2',
            isRequired: false,
          ),
          const ApiField(
            name: 'update_operations',
            label: 'Update Operations',
            hint:
                'Update operations in format: id:name:slug:type:orderby:hasarchives,id2:name2:slug2:type2:orderby2:hasarchives2',
            isRequired: false,
          ),
          const ApiField(
            name: 'delete_operations',
            label: 'Delete Operations',
            hint: 'Comma-separated list of attribute IDs to delete: 1,2,3',
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
}
