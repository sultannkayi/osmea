import 'package:apis/network/remote/woocommerce/products/product/abstract/products_service.dart';
import 'package:apis/network/remote/woocommerce/products/product/freezed_model/request/batch_update_products_request.dart';
import 'package:example/services/api_request_handler.dart';
import 'package:get_it/get_it.dart';
import 'package:example/services/api_service_registry.dart';

///*******************************************************************
//***************** 📦 BATCH UPDATE PRODUCTS HANDLER ***************
///*******************************************************************

class BatchUpdateProductsHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'PATCH') {
      return {
        "status": "error",
        "message": "Method $method not supported for Batch Update Products API",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      // Parse create operations
      List<Create>? createOperations;
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
      final batchData = BatchUpdateProductsRequest(
        create: createOperations,
        update: updateOperations,
        delete: deleteOperations,
      );

      final response = await GetIt.I<ProductsService>().batchUpdateProducts(
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
        "message": "Failed to batch update products: ${e.toString()}",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  List<Create> _parseCreateOperations(String createData) {
    // Expected format: "name1:type1:price1:description1,name2:type2:price2:description2"
    return createData
        .split(',')
        .map((operation) {
          final parts = operation.split(':');
          if (parts.isNotEmpty) {
            return Create(
              name: parts[0].trim(),
              type: parts.length > 1 ? parts[1].trim() : 'simple',
              regularPrice: parts.length > 2 ? parts[2].trim() : null,
              description: parts.length > 3 ? parts[3].trim() : null,
              shortDescription: parts.length > 4 ? parts[4].trim() : null,
            );
          }
          return null;
        })
        .where((item) => item != null)
        .cast<Create>()
        .toList();
  }

  List<Update> _parseUpdateOperations(String updateData) {
    // Expected format: "id1:name1:type1:description1,id2:name2:type2:description2"
    return updateData
        .split(',')
        .map((operation) {
          final parts = operation.split(':');
          if (parts.length >= 2) {
            return Update(
              id: int.tryParse(parts[0].trim()),
              name: parts[1].trim(),
              type: parts.length > 2 ? parts[2].trim() : null,
              description: parts.length > 3 ? parts[3].trim() : null,
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
        hint: 'Create operations in format: name:type:price:description,name2:type2:price2:description2',
        isRequired: false,
      ),
      const ApiField(
        name: 'update_operations',
        label: 'Update Operations',
        hint: 'Update operations in format: id:name:type:description,id2:name2:type2:description2',
        isRequired: false,
      ),
      const ApiField(
        name: 'delete_operations',
        label: 'Delete Operations',
        hint: 'Comma-separated list of product IDs to delete: 1,2,3',
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
