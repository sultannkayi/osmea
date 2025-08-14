import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/customers/abstract/customers_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:get_it/get_it.dart';
import 'package:api_explorer/services/api_service_registry.dart';

///*******************************************************************
///******************* 👥 LIST ALL CUSTOMERS HANDLER ***************
///*******************************************************************

class ListAllCustomersHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'GET') {
      return {
        "status": "error",
        "message": "Method $method not supported for List Customers API",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      // Parse query parameters
      final context = params['context'];
      final page =
          params['page'] != null ? int.tryParse(params['page']!) : null;
      final perPage =
          params['per_page'] != null ? int.tryParse(params['per_page']!) : null;
      final search = params['search'];
      final exclude =
          params['exclude']?.split(',').where((s) => s.isNotEmpty).toList();
      final include =
          params['include']?.split(',').where((s) => s.isNotEmpty).toList();
      final offset =
          params['offset'] != null ? int.tryParse(params['offset']!) : null;
      final order = params['order'];
      final orderBy = params['orderby'];
      final email = params['email'];
      final role = params['role'];

      final response = await GetIt.I<CustomersService>().listAllCustomers(
        apiVersion: WooNetwork.apiVersion,
        context: context,
        page: page,
        perPage: perPage,
        search: search,
        exclude: exclude,
        include: include,
        offset: offset,
        order: order,
        orderBy: orderBy,
        email: email,
        role: role,
      );

      return {
        "status": "success",
        "customers": response.map((e) => e.toJson()).toList(),
        "total": response.length,
        "params": params,
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      return {
        "status": "error",
        "message": "Failed to fetch customers: ${e.toString()}",
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
            hint: 'Scope under which the request is made (view/edit)',
          ),
          const ApiField(
            name: 'page',
            label: 'Page',
            hint: 'Current page of the collection',
            type: ApiFieldType.number,
          ),
          const ApiField(
            name: 'per_page',
            label: 'Per Page',
            hint: 'Maximum number of items to be returned in result set',
            type: ApiFieldType.number,
          ),
          const ApiField(
            name: 'search',
            label: 'Search',
            hint: 'Limit results to those matching a string',
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
            type: ApiFieldType.number,
          ),
          const ApiField(
            name: 'order',
            label: 'Order',
            hint: 'Order sort attribute ascending or descending (asc/desc)',
          ),
          const ApiField(
            name: 'orderby',
            label: 'Order By',
            hint:
                'Sort collection by object attribute (id/include/name/registered_date)',
          ),
          const ApiField(
            name: 'email',
            label: 'Email',
            hint: 'Limit result set to resources with a specific email',
          ),
          const ApiField(
            name: 'role',
            label: 'Role',
            hint: 'Limit result set to resources with a specific role',
          ),
        ],
      };
}
