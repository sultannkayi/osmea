import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/orders/order/abstract/order_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

class GetOrdersWithPropertiesHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    if (method != 'GET') {
      return {
        "status": "error",
        "message": "Method $method not supported. Only GET is allowed.",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    final String apiVersion = params['api_version'] ?? ApiNetwork.apiVersion;
    final String? createdAtMin = params['created_at_min'];
    final String? createdAtMax = params['created_at_max'];
    final String? updatedAtMin = params['updated_at_min'];
    final String? updatedAtMax = params['updated_at_max'];
    final String? processedAtMin = params['processed_at_min'];
    final String? processedAtMax = params['processed_at_max'];
    final String? attributionAppId = params['attribution_app_id'];
    final String? status = params['status'];
    final String? financialStatus = params['financial_status'];
    final String? fulfillmentStatus = params['fulfillment_status'];
    final String? fields = params['fields'];

    try {
      final response = await GetIt.I<OrderService>().getOrdersWithProperties(
        apiVersion: apiVersion,
        createdAtMin: createdAtMin,
        createdAtMax: createdAtMax,
        updatedAtMin: updatedAtMin,
        updatedAtMax: updatedAtMax,
        processedAtMin: processedAtMin,
        processedAtMax: processedAtMax,
        attributionAppId: attributionAppId,
        status: status,
        financialStatus: financialStatus,
        fulfillmentStatus: fulfillmentStatus,
        fields: fields,
      );

      return {
        "status": "success",
        "message": "Orders fetched successfully",
        "orders": response.orders?.map((order) => order.toJson()).toList(),
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      return {
        "status": "error",
        "message": "Failed to fetch orders: ${e.toString()}",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  @override
  List<String> get supportedMethods => ['GET'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'GET': [],
      };

  Map<String, List<ApiField>> get optionalFields => {
        'GET': [
          const ApiField(
            name: 'api_version',
            label: 'API Version',
            hint: 'Enter the Shopify API version (e.g., 2024-04)',
          ),
          const ApiField(
            name: 'created_at_min',
            label: 'Created At Min',
            hint: 'Filter orders created after this timestamp (ISO 8601)',
          ),
          const ApiField(
            name: 'created_at_max',
            label: 'Created At Max',
            hint: 'Filter orders created before this timestamp (ISO 8601)',
          ),
          const ApiField(
            name: 'updated_at_min',
            label: 'Updated At Min',
            hint: 'Filter orders updated after this timestamp (ISO 8601)',
          ),
          const ApiField(
            name: 'updated_at_max',
            label: 'Updated At Max',
            hint: 'Filter orders updated before this timestamp (ISO 8601)',
          ),
          const ApiField(
            name: 'processed_at_min',
            label: 'Processed At Min',
            hint: 'Filter orders processed after this timestamp (ISO 8601)',
          ),
          const ApiField(
            name: 'processed_at_max',
            label: 'Processed At Max',
            hint: 'Filter orders processed before this timestamp (ISO 8601)',
          ),
          const ApiField(
            name: 'attribution_app_id',
            label: 'Attribution App ID',
            hint: 'Filter orders by the app that created them',
          ),
          const ApiField(
            name: 'status',
            label: 'Status',
            hint: 'Filter by order status',
          ),
          const ApiField(
            name: 'financial_status',
            label: 'Financial Status',
            hint: 'Filter by financial status',
          ),
          const ApiField(
            name: 'fulfillment_status',
            label: 'Fulfillment Status',
            hint: 'Filter by fulfillment status',
          ),
          const ApiField(
            name: 'fields',
            label: 'Fields',
            hint: 'Comma-separated list of fields to include in the response',
          ),
        ],
      };
}
