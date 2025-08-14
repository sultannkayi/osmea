import 'package:apis/network/remote/woocommerce/orders/abstract/orders_service.dart';
import 'package:apis/network/remote/woocommerce/orders/freezed_model/request/batch_update_orders_request.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:get_it/get_it.dart';
import 'package:api_explorer/services/api_service_registry.dart';

///*******************************************************************
//**************** 📦 BATCH UPDATE ORDERS HANDLER ******************
///*******************************************************************

class BatchUpdateOrdersHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'PATCH') {
      return {
        "status": "error",
        "message": "Method $method not supported for Batch Update Orders API",
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
      final batchData = BatchUpdateOrdersRequest(
        create: createOperations,
        update: updateOperations,
        delete: deleteOperations,
      );

      final response = await GetIt.I<OrdersService>().batchUpdateOrders(
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
        "message": "Failed to batch update orders: ${e.toString()}",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  List<Create> _parseCreateOperations(String createData) {
    // Expected format: "status1:currency1,status2:currency2"
    return createData
        .split(',')
        .map((operation) {
          final parts = operation.split(':');
          if (parts.length >= 2) {
            return Create(
              status: parts[0].trim(),
              currency: parts[1].trim(),
              billing: parts.length > 2 ? _parseBilling(parts[2]) : null,
              shipping: parts.length > 3 ? _parseShipping(parts[3]) : null,
              lineItems: parts.length > 4 ? _parseLineItems(parts[4]) : null,
              shippingLines:
                  parts.length > 5 ? _parseShippingLines(parts[5]) : null,
            );
          }
          return null;
        })
        .where((item) => item != null)
        .cast<Create>()
        .toList();
  }

  List<Update> _parseUpdateOperations(String updateData) {
    // Expected format: "id1:status1,id2:status2"
    return updateData
        .split(',')
        .map((operation) {
          final parts = operation.split(':');
          if (parts.length >= 2) {
            return Update(
              id: int.tryParse(parts[0].trim()),
              status: parts[1].trim(),
              billing: parts.length > 2 ? _parseBilling(parts[2]) : null,
              shipping: parts.length > 3 ? _parseShipping(parts[3]) : null,
              lineItems: parts.length > 4 ? _parseLineItems(parts[4]) : null,
            );
          }
          return null;
        })
        .where((item) => item != null)
        .cast<Update>()
        .toList();
  }

  Billing? _parseBilling(String billingData) {
    // Simple billing parsing - can be extended for more complex scenarios
    if (billingData.isEmpty) return null;

    final parts = billingData.split('|');
    return Billing(
      firstName: parts.isNotEmpty ? parts[0] : null,
      lastName: parts.length > 1 ? parts[1] : null,
      email: parts.length > 2 ? parts[2] : null,
      phone: parts.length > 3 ? parts[3] : null,
      address1: parts.length > 4 ? parts[4] : null,
      city: parts.length > 5 ? parts[5] : null,
      state: parts.length > 6 ? parts[6] : null,
      postcode: parts.length > 7 ? parts[7] : null,
      country: parts.length > 8 ? parts[8] : null,
    );
  }

  Shipping? _parseShipping(String shippingData) {
    // Simple shipping parsing - can be extended for more complex scenarios
    if (shippingData.isEmpty) return null;

    final parts = shippingData.split('|');
    return Shipping(
      firstName: parts.isNotEmpty ? parts[0] : null,
      lastName: parts.length > 1 ? parts[1] : null,
      address1: parts.length > 2 ? parts[2] : null,
      city: parts.length > 3 ? parts[3] : null,
      state: parts.length > 4 ? parts[4] : null,
      postcode: parts.length > 5 ? parts[5] : null,
      country: parts.length > 6 ? parts[6] : null,
    );
  }

  List<LineItem>? _parseLineItems(String lineItemsData) {
    // Expected format: "productId1;quantity1,productId2;quantity2"
    if (lineItemsData.isEmpty) return null;

    return lineItemsData
        .split(',')
        .map((item) {
          final parts = item.split(';');
          if (parts.length >= 2) {
            return LineItem(
              productId: int.tryParse(parts[0].trim()),
              quantity: int.tryParse(parts[1].trim()),
              variationId:
                  parts.length > 2 ? int.tryParse(parts[2].trim()) : null,
            );
          }
          return null;
        })
        .where((item) => item != null)
        .cast<LineItem>()
        .toList();
  }

  List<ShippingLine>? _parseShippingLines(String shippingLinesData) {
    // Expected format: "methodId1;title1;total1,methodId2;title2;total2"
    if (shippingLinesData.isEmpty) return null;

    return shippingLinesData
        .split(',')
        .map((line) {
          final parts = line.split(';');
          if (parts.length >= 3) {
            return ShippingLine(
              methodId: parts[0].trim(),
              methodTitle: parts[1].trim(),
              total: parts[2].trim(),
            );
          }
          return null;
        })
        .where((line) => line != null)
        .cast<ShippingLine>()
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
                'Create operations in format: status:currency,status2:currency2',
            isRequired: false,
          ),
          const ApiField(
            name: 'update_operations',
            label: 'Update Operations',
            hint: 'Update operations in format: id:status,id2:status2',
            isRequired: false,
          ),
          const ApiField(
            name: 'delete_operations',
            label: 'Delete Operations',
            hint: 'Comma-separated list of order IDs to delete: 1,2,3',
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
