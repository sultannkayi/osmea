import 'package:apis/network/remote/woocommerce/webhooks/abstract/webhooks_service.dart';
import 'package:apis/network/remote/woocommerce/webhooks/freezed_model/request/batch_update_webhooks_request.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:get_it/get_it.dart';
import 'package:api_explorer/services/api_service_registry.dart';

///*******************************************************************
//**************** 📦 BATCH UPDATE WEBHOOKS HANDLER ****************
///*******************************************************************

class BatchUpdateWebhooksHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'PATCH') {
      return {
        "status": "error",
        "message": "Method $method not supported for Batch Update Webhooks API",
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
      final batchData = BatchUpdateWebhooksRequest(
        creat: createOperations,
        update: updateOperations,
        delete: deleteOperations,
      );

      final response = await GetIt.I<WebhooksService>().batchUpdateWebhooks(
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
        "message": "Failed to batch update webhooks: ${e.toString()}",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  List<Creat> _parseCreateOperations(String createData) {
    // Expected format: "name1:topic1:url1:status1,name2:topic2:url2:status2"
    return createData
        .split(',')
        .map((operation) {
          final parts = operation.split(':');
          if (parts.length >= 3) {
            return Creat(
              name: parts[0].trim(),
              topic: parts[1].trim(),
              deliveryUrl: parts[2].trim(),
              status: parts.length > 3 ? parts[3].trim() : 'active',
              resource: parts.length > 4 ? parts[4].trim() : null,
              event: parts.length > 5 ? parts[5].trim() : null,
              hooks: parts.length > 6
                  ? parts[6].trim().split('|').map((e) => e.trim()).toList()
                  : null,
            );
          }
          return null;
        })
        .where((item) => item != null)
        .cast<Creat>()
        .toList();
  }

  List<Update> _parseUpdateOperations(String updateData) {
    // Expected format: "id1:status1:url1,id2:status2:url2"
    return updateData
        .split(',')
        .map((operation) {
          final parts = operation.split(':');
          if (parts.length >= 2) {
            return Update(
              id: int.tryParse(parts[0].trim()),
              status: parts.length > 1 ? parts[1].trim() : null,
              deliveryUrl: parts.length > 2 ? parts[2].trim() : null,
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
                'Create operations in format: name:topic:delivery_url:status,name2:topic2:url2:status2',
            isRequired: false,
          ),
          const ApiField(
            name: 'update_operations',
            label: 'Update Operations',
            hint:
                'Update operations in format: id:status:delivery_url,id2:status2:url2',
            isRequired: false,
          ),
          const ApiField(
            name: 'delete_operations',
            label: 'Delete Operations',
            hint: 'Comma-separated list of webhook IDs to delete: 1,2,3',
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
