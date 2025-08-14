import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/customers/abstract/customers_service.dart';
import 'package:apis/network/remote/woocommerce/customers/freezed_model/request/update_customer_request.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:get_it/get_it.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:dio/dio.dart';

///*******************************************************************
///******************* 🔄 UPDATE CUSTOMER HANDLER ******************
///*******************************************************************

class UpdateCustomerHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'PUT') {
      return {
        "status": "error",
        "message": "Method $method not supported for Update Customer API",
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

      // Parse optional customer parameters
      final email =
          params['email']?.isNotEmpty == true ? params['email'] : null;
      final firstName = params['first_name']?.isNotEmpty == true
          ? params['first_name']
          : null;
      final lastName =
          params['last_name']?.isNotEmpty == true ? params['last_name'] : null;
      final username =
          params['username']?.isNotEmpty == true ? params['username'] : null;
      final password =
          params['password']?.isNotEmpty == true ? params['password'] : null;

      // Parse billing address - Only include non-empty fields
      Billing? billingData;
      final billingFields = <String, String>{};

      // Add only non-empty billing fields
      if (params['billing_first_name']?.isNotEmpty == true)
        billingFields['first_name'] = params['billing_first_name']!;
      if (params['billing_last_name']?.isNotEmpty == true)
        billingFields['last_name'] = params['billing_last_name']!;
      if (params['billing_company']?.isNotEmpty == true)
        billingFields['company'] = params['billing_company']!;
      if (params['billing_address_1']?.isNotEmpty == true)
        billingFields['address_1'] = params['billing_address_1']!;
      if (params['billing_address_2']?.isNotEmpty == true)
        billingFields['address_2'] = params['billing_address_2']!;
      if (params['billing_city']?.isNotEmpty == true)
        billingFields['city'] = params['billing_city']!;
      if (params['billing_state']?.isNotEmpty == true)
        billingFields['state'] = params['billing_state']!;
      if (params['billing_postcode']?.isNotEmpty == true)
        billingFields['postcode'] = params['billing_postcode']!;
      if (params['billing_country']?.isNotEmpty == true)
        billingFields['country'] = params['billing_country']!;
      if (params['billing_email']?.isNotEmpty == true)
        billingFields['email'] = params['billing_email']!;
      if (params['billing_phone']?.isNotEmpty == true)
        billingFields['phone'] = params['billing_phone']!;

      if (billingFields.isNotEmpty) {
        billingData = Billing.fromJson(billingFields);
      }

      // Parse shipping address - Only include non-empty fields
      Shipping? shippingData;
      final shippingFields = <String, String>{};

      // Add only non-empty shipping fields
      if (params['shipping_first_name']?.isNotEmpty == true)
        shippingFields['first_name'] = params['shipping_first_name']!;
      if (params['shipping_last_name']?.isNotEmpty == true)
        shippingFields['last_name'] = params['shipping_last_name']!;
      if (params['shipping_company']?.isNotEmpty == true)
        shippingFields['company'] = params['shipping_company']!;
      if (params['shipping_address_1']?.isNotEmpty == true)
        shippingFields['address_1'] = params['shipping_address_1']!;
      if (params['shipping_address_2']?.isNotEmpty == true)
        shippingFields['address_2'] = params['shipping_address_2']!;
      if (params['shipping_city']?.isNotEmpty == true)
        shippingFields['city'] = params['shipping_city']!;
      if (params['shipping_state']?.isNotEmpty == true)
        shippingFields['state'] = params['shipping_state']!;
      if (params['shipping_postcode']?.isNotEmpty == true)
        shippingFields['postcode'] = params['shipping_postcode']!;
      if (params['shipping_country']?.isNotEmpty == true)
        shippingFields['country'] = params['shipping_country']!;

      if (shippingFields.isNotEmpty) {
        shippingData = Shipping.fromJson(shippingFields);
      }

      // Create customer update request with only non-null values
      final customerData = UpdateCustomerRequest(
        email: email,
        firstName: firstName,
        lastName: lastName,
        username: username,
        password: password,
        billing: billingData,
        shipping: shippingData,
      );

      // Remove null values from the request
      final jsonData = customerData.toJson();
      jsonData.removeWhere((key, value) => value == null);

      final response = await GetIt.I<CustomersService>().updateCustomer(
        apiVersion: WooNetwork.apiVersion,
        customerId: customerId,
        customerData: jsonData,
      );

      return {
        "status": "success",
        "customer": response.toJson(),
        "params": params,
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      print("🚨 Update Customer Error Details: $e");

      String errorMessage = "Failed to update customer: ${e.toString()}";
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
  List<String> get supportedMethods => ['PUT'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'PUT': [
          const ApiField(
            name: 'customer_id',
            label: 'Customer ID',
            hint: 'ID of the customer to update',
            isRequired: true,
          ),
          const ApiField(
            name: 'email',
            label: 'Email',
            hint: 'Customer email address',
          ),
          const ApiField(
            name: 'first_name',
            label: 'First Name',
            hint: 'Customer first name',
          ),
          const ApiField(
            name: 'last_name',
            label: 'Last Name',
            hint: 'Customer last name',
          ),
          const ApiField(
            name: 'username',
            label: 'Username',
            hint: 'Customer login username',
          ),
          const ApiField(
            name: 'password',
            label: 'Password',
            hint: 'Customer account password',
          ),
          const ApiField(
            name: 'billing_first_name',
            label: 'Billing First Name',
            hint: 'Billing address first name',
          ),
          const ApiField(
            name: 'billing_last_name',
            label: 'Billing Last Name',
            hint: 'Billing address last name',
          ),
          const ApiField(
            name: 'billing_company',
            label: 'Billing Company',
            hint: 'Billing company name',
          ),
          const ApiField(
            name: 'billing_address_1',
            label: 'Billing Address 1',
            hint: 'Billing address line 1',
          ),
          const ApiField(
            name: 'billing_city',
            label: 'Billing City',
            hint: 'Billing city',
          ),
          const ApiField(
            name: 'billing_state',
            label: 'Billing State',
            hint: 'Billing state',
          ),
          const ApiField(
            name: 'billing_postcode',
            label: 'Billing Postcode',
            hint: 'Billing postcode',
          ),
          const ApiField(
            name: 'billing_country',
            label: 'Billing Country',
            hint: 'Billing country',
          ),
          const ApiField(
            name: 'billing_email',
            label: 'Billing Email',
            hint: 'Billing email address',
          ),
          const ApiField(
            name: 'billing_phone',
            label: 'Billing Phone',
            hint: 'Billing phone number',
          ),
        ],
      };
}
