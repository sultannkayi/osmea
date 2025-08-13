import 'package:apis/network/remote/shopify/graphql/services/customer_graphql_service.dart';
import 'package:apis/network/remote/shopify/graphql/helpers/graphql_helper.dart';
import 'package:example/services/api_request_handler.dart';
import 'package:example/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///*******************************************************************
///********** 👥 CUSTOMER GRAPHQL HANDLER 👥 *************************
///*******************************************************************

class CustomerGraphQLHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    final customerService = GetIt.instance<CustomerGraphQLService>();

    switch (method) {
      case 'QUERY':
        return await _handleQueryCustomers(customerService, params);
      case 'MUTATION':
        return await _handleMutateCustomer(customerService, params);
      default:
        return {
          "error": "Operation $method not supported for Customer GraphQL API",
          "supportedMethods": supportedMethods,
        };
    }
  }

  Future<Map<String, dynamic>> _handleQueryCustomers(
      CustomerGraphQLService service, Map<String, String> params) async {
    try {
      final id = params['id'] ?? params['customer_id'];

      print('DEBUG - Customer Handler - ID parameter: $id'); // Debug log

      if (id != null && id.isNotEmpty) {
        // Get single customer using customers query with specific ID filter
        final formattedId = GraphQLHelper.formatId(id, 'Customer');
        print(
            'DEBUG - Customer Handler - Formatted ID: $formattedId'); // Debug log

        final result = await service.getCustomers(
          first: 1,
          query: 'id:$formattedId',
        );

        if (GraphQLHelper.isSuccess(result)) {
          final data = GraphQLHelper.extractData(result);
          print('DEBUG - Single customer raw data: $data'); // Debug log
          final customers = data?['customers'];
          final nodes = GraphQLHelper.extractNodes(customers ?? {});
          print('DEBUG - Single customer nodes: $nodes'); // Debug log

          if (nodes.isNotEmpty) {
            return {
              "status": "success",
              "data": nodes.first,
              "timestamp": DateTime.now().toIso8601String(),
            };
          } else {
            return {
              "status": "error",
              "message": "Customer not found",
              "timestamp": DateTime.now().toIso8601String(),
            };
          }
        } else {
          final errors = GraphQLHelper.extractErrors(result);
          return {
            "status": "error",
            "message": "Failed to fetch customer",
            "errors": errors,
            "timestamp": DateTime.now().toIso8601String(),
          };
        }
      } else {
        // Get customers list
        final first = int.tryParse(params['first'] ?? '10') ?? 10;
        final after = params['after'];
        final query = params['query'];

        print(
            'DEBUG - Parameters: first=$first, after=$after, query=$query'); // Debug log

        final result = await service.getCustomers(
          first: first,
          after: after,
          query: query,
        );

        print(
            'DEBUG - GraphQL result hasException: ${result.hasException}'); // Debug log
        print('DEBUG - GraphQL result data: ${result.data}'); // Debug log

        if (GraphQLHelper.isSuccess(result)) {
          final data = GraphQLHelper.extractData(result);
          print('DEBUG - Raw GraphQL data: $data'); // Debug log
          final customers = data?['customers'];
          print('DEBUG - Customers data: $customers'); // Debug log
          final nodes = GraphQLHelper.extractNodes(customers ?? {});
          final pageInfo = GraphQLHelper.extractPageInfo(customers ?? {});
          print('DEBUG - Extracted nodes: $nodes'); // Debug log
          print('DEBUG - Page info: $pageInfo'); // Debug log

          return {
            "status": "success",
            "data": {
              "customers": nodes,
              "pageInfo": pageInfo,
              "totalCount": nodes.length,
            },
            "timestamp": DateTime.now().toIso8601String(),
          };
        } else {
          final errors = GraphQLHelper.extractErrors(result);
          return {
            "status": "error",
            "message": "Failed to fetch customers",
            "errors": errors,
            "timestamp": DateTime.now().toIso8601String(),
          };
        }
      }
    } catch (e) {
      return {
        "status": "error",
        "message": "Exception occurred while fetching customers: $e",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  Future<Map<String, dynamic>> _handleMutateCustomer(
      CustomerGraphQLService service, Map<String, String> params) async {
    final operation = params['operation'] ?? 'create';

    switch (operation.toLowerCase()) {
      case 'create':
        return await _handleCreateCustomer(service, params);
      case 'update':
        return await _handleUpdateCustomer(service, params);
      default:
        return {
          "error": "Mutation operation '$operation' not supported",
          "supportedOperations": ["create", "update"],
        };
    }
  }

  Future<Map<String, dynamic>> _handleCreateCustomer(
      CustomerGraphQLService service, Map<String, String> params) async {
    try {
      final firstName = params['firstName'] ?? params['first_name'];
      final lastName = params['lastName'] ?? params['last_name'];
      final email = params['email'];
      final phone = params['phone'];

      final input = <String, dynamic>{};

      if (firstName != null && firstName.isNotEmpty)
        input['firstName'] = firstName;
      if (lastName != null && lastName.isNotEmpty) input['lastName'] = lastName;
      if (email != null && email.isNotEmpty) input['email'] = email;
      if (phone != null && phone.isNotEmpty) input['phone'] = phone;

      if (input.isEmpty) {
        return {
          "status": "error",
          "message": "At least one customer field is required",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      final result = await service.createCustomer(input);

      if (GraphQLHelper.isSuccess(result)) {
        final data = GraphQLHelper.extractData(result);
        final userErrors =
            GraphQLHelper.extractUserErrors(data, 'customerCreate');

        if (userErrors.isNotEmpty) {
          return {
            "status": "error",
            "message": "Customer creation failed with user errors",
            "userErrors": userErrors,
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

        return {
          "status": "success",
          "data": data?['customerCreate']?['customer'],
          "message": "Customer created successfully",
          "timestamp": DateTime.now().toIso8601String(),
        };
      } else {
        final errors = GraphQLHelper.extractErrors(result);
        return {
          "status": "error",
          "message": "Failed to create customer",
          "errors": errors,
          "timestamp": DateTime.now().toIso8601String(),
        };
      }
    } catch (e) {
      return {
        "status": "error",
        "message": "Exception occurred while creating customer: $e",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  Future<Map<String, dynamic>> _handleUpdateCustomer(
      CustomerGraphQLService service, Map<String, String> params) async {
    try {
      final id = params['id'] ?? params['customer_id'];

      if (id == null || id.isEmpty) {
        return {
          "status": "error",
          "message": "Customer ID is required for update",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      final input = <String, dynamic>{};

      if (params['firstName'] != null || params['first_name'] != null) {
        input['firstName'] = params['firstName'] ?? params['first_name'];
      }
      if (params['lastName'] != null || params['last_name'] != null) {
        input['lastName'] = params['lastName'] ?? params['last_name'];
      }
      if (params['email'] != null) input['email'] = params['email'];
      if (params['phone'] != null) input['phone'] = params['phone'];

      if (input.isEmpty) {
        return {
          "status": "error",
          "message": "No update fields provided",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      final result = await service.updateCustomer(
        GraphQLHelper.formatId(id, 'Customer'),
        input,
      );

      if (GraphQLHelper.isSuccess(result)) {
        final data = GraphQLHelper.extractData(result);
        final userErrors =
            GraphQLHelper.extractUserErrors(data, 'customerUpdate');

        if (userErrors.isNotEmpty) {
          return {
            "status": "error",
            "message": "Customer update failed with user errors",
            "userErrors": userErrors,
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

        return {
          "status": "success",
          "data": data?['customerUpdate']?['customer'],
          "message": "Customer updated successfully",
          "timestamp": DateTime.now().toIso8601String(),
        };
      } else {
        final errors = GraphQLHelper.extractErrors(result);
        return {
          "status": "error",
          "message": "Failed to update customer",
          "errors": errors,
          "timestamp": DateTime.now().toIso8601String(),
        };
      }
    } catch (e) {
      return {
        "status": "error",
        "message": "Exception occurred while updating customer: $e",
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
            label: 'Customer ID (optional)',
            hint: 'Leave empty to get all customers',
            isRequired: false,
          ),
          const ApiField(
            name: 'first',
            label: 'Limit (optional)',
            hint: 'Number of customers to return (default: 10)',
            isRequired: false,
          ),
          const ApiField(
            name: 'query',
            label: 'Search Query (optional)',
            hint: 'Search customers by name, email, etc.',
            isRequired: false,
          ),
        ],
        'POST': [
          const ApiField(
            name: 'first_name',
            label: 'First Name (optional)',
            hint: 'Enter customer first name',
            isRequired: false,
          ),
          const ApiField(
            name: 'last_name',
            label: 'Last Name (optional)',
            hint: 'Enter customer last name',
            isRequired: false,
          ),
          const ApiField(
            name: 'email',
            label: 'Email (optional)',
            hint: 'Enter customer email',
            isRequired: false,
          ),
          const ApiField(
            name: 'phone',
            label: 'Phone (optional)',
            hint: 'Enter customer phone',
            isRequired: false,
          ),
        ],
        'PUT': [
          const ApiField(
            name: 'id',
            label: 'Customer ID',
            hint: 'Enter customer ID to update',
            isRequired: true,
          ),
          const ApiField(
            name: 'first_name',
            label: 'First Name (optional)',
            hint: 'Enter new first name',
            isRequired: false,
          ),
          const ApiField(
            name: 'last_name',
            label: 'Last Name (optional)',
            hint: 'Enter new last name',
            isRequired: false,
          ),
          const ApiField(
            name: 'email',
            label: 'Email (optional)',
            hint: 'Enter new email',
            isRequired: false,
          ),
          const ApiField(
            name: 'phone',
            label: 'Phone (optional)',
            hint: 'Enter new phone',
            isRequired: false,
          ),
        ],
      };
}
