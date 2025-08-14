import 'package:apis/network/remote/woocommerce/customers/abstract/customers_service.dart';
import 'package:apis/network/remote/woocommerce/customers/freezed_model/request/batch_update_customers_request.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:get_it/get_it.dart';
import 'package:api_explorer/services/api_service_registry.dart';

///*******************************************************************
//************** 📦 BATCH UPDATE CUSTOMERS HANDLER *****************
///*******************************************************************

class BatchUpdateCustomersHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'PATCH') {
      return {
        "status": "error",
        "message":
            "Method $method not supported for Batch Update Customers API",
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
      final batchData = BatchUpdateCustomersRequest(
        create: createOperations,
        update: updateOperations,
        delete: deleteOperations,
      );

      final response = await GetIt.I<CustomersService>().batchUpdateCustomers(
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
        "message": "Failed to batch update customers: ${e.toString()}",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  List<Create> _parseCreateOperations(String createData) {
    // Expected format: "email1:firstName1:lastName1,email2:firstName2:lastName2"
    return createData
        .split(',')
        .map((operation) {
          final parts = operation.split(':');
          if (parts.length >= 3) {
            return Create(
              email: parts[0].trim(),
              firstName: parts[1].trim(),
              lastName: parts[2].trim(),
              role: parts.length > 3 ? parts[3].trim() : null,
              username: parts.length > 4 ? parts[4].trim() : null,
            );
          }
          return null;
        })
        .where((item) => item != null)
        .cast<Create>()
        .toList();
  }

  List<Update> _parseUpdateOperations(String updateData) {
    // Expected format: "id1:email1:firstName1:lastName1,id2:email2:firstName2:lastName2"
    return updateData
        .split(',')
        .map((operation) {
          final parts = operation.split(':');
          if (parts.length >= 4) {
            return Update(
              id: int.tryParse(parts[0].trim()),
              email: parts[1].trim(),
              firstName: parts[2].trim(),
              lastName: parts[3].trim(),
              role: parts.length > 4 ? parts[4].trim() : null,
              username: parts.length > 5 ? parts[5].trim() : null,
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
                'Create operations in format: email:firstName:lastName:role:username',
            isRequired: false,
          ),
          const ApiField(
            name: 'update_operations',
            label: 'Update Operations',
            hint:
                'Update operations in format: id:email:firstName:lastName:role:username',
            isRequired: false,
          ),
          const ApiField(
            name: 'delete_operations',
            label: 'Delete Operations',
            hint: 'Comma-separated list of customer IDs to delete: 1,2,3',
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
