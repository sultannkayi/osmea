import 'package:apis/network/remote/shopify/graphql/services/order_graphql_service.dart';
import 'package:apis/network/remote/shopify/graphql/helpers/graphql_helper.dart';
import 'package:example/services/api_request_handler.dart';
import 'package:example/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///*******************************************************************
///********** 📦 ORDER GRAPHQL HANDLER 📦 ****************************
///*******************************************************************

class OrderGraphQLHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    final orderService = GetIt.instance<OrderGraphQLService>();

    switch (method) {
      case 'QUERY':
        return await _handleQueryOrders(orderService, params);
      case 'MUTATION':
        return await _handleMutateOrder(orderService, params);
      default:
        return {
          "error": "Operation $method not supported for Order GraphQL API",
          "supportedMethods": supportedMethods,
        };
    }
  }

  Future<Map<String, dynamic>> _handleMutateOrder(
      OrderGraphQLService service, Map<String, String> params) async {
    final operation = params['operation'] ?? 'update';

    switch (operation.toLowerCase()) {
      case 'update':
        return await _handleUpdateOrder(service, params);
      default:
        return {
          "error": "Mutation operation '$operation' not supported",
          "supportedOperations": ["update"],
        };
    }
  }

  Future<Map<String, dynamic>> _handleQueryOrders(
      OrderGraphQLService service, Map<String, String> params) async {
    try {
      final id = params['id'] ?? params['order_id'];

      if (id != null && id.isNotEmpty) {
        // Get single order using orders query with specific ID filter
        final result = await service.getOrders(
          first: 1,
          query: 'id:${GraphQLHelper.formatId(id, 'Order')}',
        );

        if (GraphQLHelper.isSuccess(result)) {
          final data = GraphQLHelper.extractData(result);
          print('DEBUG - Single order raw data: $data'); // Debug log
          final orders = data?['orders'];
          final nodes = GraphQLHelper.extractNodes(orders ?? {});
          print('DEBUG - Single order nodes: $nodes'); // Debug log

          if (nodes.isNotEmpty) {
            return {
              "status": "success",
              "data": nodes.first,
              "timestamp": DateTime.now().toIso8601String(),
            };
          } else {
            return {
              "status": "error",
              "message": "Order not found",
              "timestamp": DateTime.now().toIso8601String(),
            };
          }
        } else {
          final errors = GraphQLHelper.extractErrors(result);
          return {
            "status": "error",
            "message": "Failed to fetch order",
            "errors": errors,
            "timestamp": DateTime.now().toIso8601String(),
          };
        }
      } else {
        // Get orders list
        final first = int.tryParse(params['first'] ?? '10') ?? 10;
        final after = params['after'];
        final query = params['query'];

        print(
            'DEBUG - Order parameters: first=$first, after=$after, query=$query'); // Debug log

        final result = await service.getOrders(
          first: first,
          after: after,
          query: query,
        );

        print(
            'DEBUG - Order GraphQL result hasException: ${result.hasException}'); // Debug log
        print('DEBUG - Order GraphQL result data: ${result.data}'); // Debug log

        if (GraphQLHelper.isSuccess(result)) {
          final data = GraphQLHelper.extractData(result);
          print('DEBUG - Order raw GraphQL data: $data'); // Debug log
          final orders = data?['orders'];
          print('DEBUG - Orders data: $orders'); // Debug log
          final nodes = GraphQLHelper.extractNodes(orders ?? {});
          final pageInfo = GraphQLHelper.extractPageInfo(orders ?? {});
          print('DEBUG - Order extracted nodes: $nodes'); // Debug log
          print('DEBUG - Order page info: $pageInfo'); // Debug log

          return {
            "status": "success",
            "data": {
              "orders": nodes,
              "pageInfo": pageInfo,
              "totalCount": nodes.length,
            },
            "timestamp": DateTime.now().toIso8601String(),
          };
        } else {
          final errors = GraphQLHelper.extractErrors(result);
          return {
            "status": "error",
            "message": "Failed to fetch orders",
            "errors": errors,
            "timestamp": DateTime.now().toIso8601String(),
          };
        }
      }
    } catch (e) {
      return {
        "status": "error",
        "message": "Exception occurred while fetching orders: $e",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  Future<Map<String, dynamic>> _handleUpdateOrder(
      OrderGraphQLService service, Map<String, String> params) async {
    try {
      final id = params['id'] ?? params['order_id'];

      if (id == null || id.isEmpty) {
        return {
          "status": "error",
          "message": "Order ID is required for update",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      final input = <String, dynamic>{};

      if (params['note'] != null) input['note'] = params['note'];

      if (input.isEmpty) {
        return {
          "status": "error",
          "message": "No update fields provided",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      final result = await service.updateOrder(
        GraphQLHelper.formatId(id, 'Order'),
        input,
      );

      if (GraphQLHelper.isSuccess(result)) {
        final data = GraphQLHelper.extractData(result);
        final userErrors = GraphQLHelper.extractUserErrors(data, 'orderUpdate');

        if (userErrors.isNotEmpty) {
          return {
            "status": "error",
            "message": "Order update failed with user errors",
            "userErrors": userErrors,
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

        return {
          "status": "success",
          "data": data?['orderUpdate']?['order'],
          "message": "Order updated successfully",
          "timestamp": DateTime.now().toIso8601String(),
        };
      } else {
        final errors = GraphQLHelper.extractErrors(result);
        return {
          "status": "error",
          "message": "Failed to update order",
          "errors": errors,
          "timestamp": DateTime.now().toIso8601String(),
        };
      }
    } catch (e) {
      return {
        "status": "error",
        "message": "Exception occurred while updating order: $e",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  @override
  List<String> get supportedMethods => ['QUERY', 'MUTATION'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'GET': [
          const ApiField(
            name: 'id',
            label: 'Order ID (optional)',
            hint: 'Leave empty to get all orders',
            isRequired: false,
          ),
          const ApiField(
            name: 'first',
            label: 'Limit (optional)',
            hint: 'Number of orders to return (default: 10)',
            isRequired: false,
          ),
          const ApiField(
            name: 'query',
            label: 'Search Query (optional)',
            hint: 'Search orders by name, email, etc.',
            isRequired: false,
          ),
        ],
        'PUT': [
          const ApiField(
            name: 'id',
            label: 'Order ID',
            hint: 'Enter order ID to update',
            isRequired: true,
          ),
          const ApiField(
            name: 'note',
            label: 'Order Note (optional)',
            hint: 'Enter order note',
            isRequired: false,
          ),
        ],
      };
}
