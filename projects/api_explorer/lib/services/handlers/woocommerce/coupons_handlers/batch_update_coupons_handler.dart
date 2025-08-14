import 'package:apis/network/remote/woocommerce/coupons/abstract/coupons_service.dart';
import 'package:apis/network/remote/woocommerce/coupons/freezed_model/request/batch_update_coupons_request.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:get_it/get_it.dart';
import 'package:api_explorer/services/api_service_registry.dart';

///*******************************************************************
//**************** 📦 BATCH UPDATE COUPONS HANDLER *****************
///*******************************************************************

class BatchUpdateCouponsHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'PATCH') {
      return {
        "status": "error",
        "message": "Method $method not supported for Batch Update Coupons API",
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
      final batchData = BatchUpdateCouponsRequest(
        create: createOperations,
        update: updateOperations,
        delete: deleteOperations,
      );

      final response = await GetIt.I<CouponsService>().batchUpdateCoupons(
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
        "message": "Failed to batch update coupons: ${e.toString()}",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  List<Create> _parseCreateOperations(String createData) {
    // Expected format: "code1:amount1:type1,code2:amount2:type2"
    return createData
        .split(',')
        .map((operation) {
          final parts = operation.split(':');
          if (parts.length >= 3) {
            return Create(
              code: parts[0].trim(),
              amount: parts[1].trim(),
              discountType: parts[2].trim(),
              individualUse:
                  parts.length > 3 ? parts[3].trim() == 'true' : null,
              excludeSaleItems:
                  parts.length > 4 ? parts[4].trim() == 'true' : null,
              minimumAmount: parts.length > 5 ? parts[5].trim() : null,
            );
          }
          return null;
        })
        .where((item) => item != null)
        .cast<Create>()
        .toList();
  }

  List<Update> _parseUpdateOperations(String updateData) {
    // Expected format: "id1:code1:amount1:type1,id2:code2:amount2:type2"
    return updateData
        .split(',')
        .map((operation) {
          final parts = operation.split(':');
          if (parts.length >= 4) {
            return Update(
              id: int.tryParse(parts[0].trim()),
              code: parts[1].trim(),
              amount: parts[2].trim(),
              discountType: parts[3].trim(),
              individualUse:
                  parts.length > 4 ? parts[4].trim() == 'true' : null,
              excludeSaleItems:
                  parts.length > 5 ? parts[5].trim() == 'true' : null,
              minimumAmount: parts.length > 6 ? parts[6].trim() : null,
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
                'Create operations in format: code:amount:type,code2:amount2:type2',
            isRequired: false,
          ),
          const ApiField(
            name: 'update_operations',
            label: 'Update Operations',
            hint:
                'Update operations in format: id:code:amount:type,id2:code2:amount2:type2',
            isRequired: false,
          ),
          const ApiField(
            name: 'delete_operations',
            label: 'Delete Operations',
            hint: 'Comma-separated list of coupon IDs to delete: 1,2,3',
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
