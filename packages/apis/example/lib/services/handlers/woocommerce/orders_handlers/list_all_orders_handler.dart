import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/orders/abstract/orders_service.dart';
import 'package:example/services/api_request_handler.dart';
import 'package:get_it/get_it.dart';
import 'package:example/services/api_service_registry.dart';
import 'package:dio/dio.dart';

///*******************************************************************
///******************* 📋 LIST ALL ORDERS HANDLER ******************
///*******************************************************************

class ListAllOrdersHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'GET') {
      return {
        "status": "error",
        "message": "Method $method not supported for List All Orders API",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      // Parse optional parameters
      final context =
          params['context']?.isNotEmpty == true ? params['context'] : null;
      final page = params['page']?.isNotEmpty == true
          ? int.tryParse(params['page']!)
          : null;
      final perPage = params['per_page']?.isNotEmpty == true
          ? int.tryParse(params['per_page']!)
          : null;
      final search =
          params['search']?.isNotEmpty == true ? params['search'] : null;
      final after =
          params['after']?.isNotEmpty == true ? params['after'] : null;
      final before =
          params['before']?.isNotEmpty == true ? params['before'] : null;
      final exclude = params['exclude']?.isNotEmpty == true
          ? params['exclude']!.split(',')
          : null;
      final include = params['include']?.isNotEmpty == true
          ? params['include']!.split(',')
          : null;
      final offset = params['offset']?.isNotEmpty == true
          ? int.tryParse(params['offset']!)
          : null;
      final order =
          params['order']?.isNotEmpty == true ? params['order'] : null;
      final orderBy =
          params['orderby']?.isNotEmpty == true ? params['orderby'] : null;
      final parent = params['parent']?.isNotEmpty == true
          ? int.tryParse(params['parent']!)
          : null;
      final parentExclude = params['parent_exclude']?.isNotEmpty == true
          ? params['parent_exclude']!.split(',')
          : null;
      final status =
          params['status']?.isNotEmpty == true ? params['status'] : null;
      final customer = params['customer']?.isNotEmpty == true
          ? int.tryParse(params['customer']!)
          : null;
      final product = params['product']?.isNotEmpty == true
          ? int.tryParse(params['product']!)
          : null;
      final dp = params['dp']?.isNotEmpty == true ? params['dp'] : null;

      final response = await GetIt.I<OrdersService>().listAllOrders(
        apiVersion: WooNetwork.apiVersion,
        context: context,
        page: page,
        perPage: perPage,
        search: search,
        after: after,
        before: before,
        exclude: exclude,
        include: include,
        offset: offset,
        order: order,
        orderBy: orderBy,
        parent: parent,
        parentExclude: parentExclude,
        status: status,
        customer: customer,
        product: product,
        dp: dp,
      );

      return {
        "status": "success",
        "orders": response.map((e) => e.toJson()).toList(),
        "count": response.length,
        "params": params,
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      print("🚨 List All Orders Error Details: $e");

      String errorMessage = "Failed to fetch orders: ${e.toString()}";
      Map<String, dynamic> errorDetails = {};

      if (e is DioException) {
        print("🔍 DioException Type: ${e.type}");
        print("🔍 Status Code: ${e.response?.statusCode}");
        print("🔍 Response Data: ${e.response?.data}");

        if (e.response?.data != null) {
          errorDetails['response_data'] = e.response?.data;
          errorDetails['status_code'] = e.response?.statusCode;

          // WooCommerce error message'ını al
          if (e.response?.data is Map && e.response?.data['message'] != null) {
            errorMessage = "WooCommerce Error: ${e.response?.data['message']}";
          }
        }
      }

      return {
        "status": "error",
        "message": errorMessage,
        "error_details": errorDetails,
        "full_error": e.toString(),
        "params": params,
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  @override
  List<String> get supportedMethods => ['GET'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'GET': [
          const ApiField(
            name: 'context',
            label: 'Context',
            hint: 'Scope under which the request is made (view, edit)',
          ),
          const ApiField(
            name: 'page',
            label: 'Page',
            hint: 'Current page of the collection',
          ),
          const ApiField(
            name: 'per_page',
            label: 'Per Page',
            hint: 'Maximum number of items to return (1-100)',
          ),
          const ApiField(
            name: 'search',
            label: 'Search',
            hint: 'Limit results to those matching a string',
          ),
          const ApiField(
            name: 'after',
            label: 'After',
            hint: 'Limit response to orders created after a given ISO8601 date',
          ),
          const ApiField(
            name: 'before',
            label: 'Before',
            hint:
                'Limit response to orders created before a given ISO8601 date',
          ),
          const ApiField(
            name: 'exclude',
            label: 'Exclude',
            hint: 'Ensure result set excludes specific IDs (comma-separated)',
          ),
          const ApiField(
            name: 'include',
            label: 'Include',
            hint: 'Limit result set to specific IDs (comma-separated)',
          ),
          const ApiField(
            name: 'offset',
            label: 'Offset',
            hint: 'Offset the result set by a specific number of items',
          ),
          const ApiField(
            name: 'order',
            label: 'Order',
            hint: 'Order sort attribute ascending or descending (asc, desc)',
          ),
          const ApiField(
            name: 'orderby',
            label: 'Order By',
            hint:
                'Sort collection by object attribute (date, id, include, title, slug)',
          ),
          const ApiField(
            name: 'parent',
            label: 'Parent',
            hint: 'Limit result set to those of particular parent IDs',
          ),
          const ApiField(
            name: 'parent_exclude',
            label: 'Parent Exclude',
            hint:
                'Limit result set to all items except those of particular parent IDs (comma-separated)',
          ),
          const ApiField(
            name: 'status',
            label: 'Status',
            hint: 'Limit result set to orders with specific status',
          ),
          const ApiField(
            name: 'customer',
            label: 'Customer',
            hint: 'Limit result set to orders assigned to a specific customer',
          ),
          const ApiField(
            name: 'product',
            label: 'Product',
            hint: 'Limit result set to orders assigned to a specific product',
          ),
          const ApiField(
            name: 'dp',
            label: 'Decimal Places',
            hint: 'Number of decimal places to use in each resource',
          ),
        ],
      };
}
