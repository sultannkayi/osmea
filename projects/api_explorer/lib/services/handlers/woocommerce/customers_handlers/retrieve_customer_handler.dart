import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/customers/abstract/customers_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:get_it/get_it.dart';
import 'package:api_explorer/services/api_service_registry.dart';

///*******************************************************************
///******************* 🎯 RETRIEVE CUSTOMER HANDLER ****************
///*******************************************************************

class RetrieveCustomerHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'GET') {
      return {
        "status": "error",
        "message": "Method $method not supported for Retrieve Customer API",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    // Validate required parameter
    if (!params.containsKey('customer_id') || params['customer_id']!.isEmpty) {
      return {
        "status": "error",
        "message": "Customer ID is required",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      // Parse customer ID
      final customerId = int.tryParse(params['customer_id']!);
      if (customerId == null) {
        return {
          "status": "error",
          "message": "Customer ID must be a valid integer",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      // Parse context parameter
      final context = params['context'];

      final response = await GetIt.I<CustomersService>().retrieveCustomer(
        apiVersion: WooNetwork.apiVersion,
        customerId: customerId,
        context: context,
      );

      return {
        "status": "success",
        "customer": response.toJson(),
        "params": params,
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      return {
        "status": "error",
        "message": "Failed to retrieve customer: ${e.toString()}",
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
            name: 'customer_id',
            label: 'Customer ID',
            hint: 'The ID of the customer to retrieve',
            isRequired: true,
            type: ApiFieldType.number,
          ),
          const ApiField(
            name: 'context',
            label: 'Context',
            hint: 'Scope under which the request is made (view/edit)',
          ),
        ],
      };
}
