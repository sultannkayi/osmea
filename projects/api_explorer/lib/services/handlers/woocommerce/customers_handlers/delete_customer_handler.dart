import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/customers/abstract/customers_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:get_it/get_it.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:dio/dio.dart';

///*******************************************************************
///******************* 🗑️ DELETE CUSTOMER HANDLER ******************
///*******************************************************************

class DeleteCustomerHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'DELETE') {
      return {
        "status": "error",
        "message": "Method $method not supported for Delete Customer API",
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
          "message": "Invalid customer ID format",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      // Parse optional parameters
      final force = params['force'] == 'true' ? true : null;
      final reassign =
          params['reassign']?.isNotEmpty == true ? params['reassign'] : null;

      final response = await GetIt.I<CustomersService>().deleteCustomer(
        apiVersion: WooNetwork.apiVersion,
        customerId: customerId,
        force: force,
        reassign: reassign,
      );

      return {
        "status": "success",
        "customer": response.toJson(),
        "params": params,
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      print("🚨 Delete Customer Error Details: $e");

      String errorMessage = "Failed to delete customer: ${e.toString()}";
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
  List<String> get supportedMethods => ['DELETE'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'DELETE': [
          const ApiField(
            name: 'customer_id',
            label: 'Customer ID',
            hint: 'ID of the customer to delete',
            isRequired: true,
          ),
          const ApiField(
            name: 'force',
            label: 'Force Delete',
            hint: 'Whether to bypass trash and force deletion (true/false)',
          ),
          const ApiField(
            name: 'reassign',
            label: 'Reassign Posts',
            hint: 'User ID to reassign posts to (if customer has posts)',
          ),
        ],
      };
}
