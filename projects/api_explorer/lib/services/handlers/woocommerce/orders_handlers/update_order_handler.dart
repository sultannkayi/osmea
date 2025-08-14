import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/orders/abstract/orders_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:get_it/get_it.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:dio/dio.dart';

///*******************************************************************
///******************* 🔄 UPDATE ORDER HANDLER ********************
///*******************************************************************

class UpdateOrderHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'PUT') {
      return {
        "status": "error",
        "message": "Method $method not supported for Update Order API",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    // Validate required parameter
    if (!params.containsKey('order_id') || params['order_id']!.isEmpty) {
      return {
        "status": "error",
        "message": "Order ID is required",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      // Parse order ID
      final orderIdStr = params['order_id']?.toString() ?? '';
      final orderId = int.tryParse(orderIdStr);
      if (orderId == null || orderId <= 0) {
        return {
          "status": "error",
          "message": "❌ order_id is required and must be a valid number!",
          "params": params,
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      // Build order data from parameters
      Map<String, dynamic> orderData = {};

      // Basic order fields
      if (params['status']?.isNotEmpty == true) {
        orderData['status'] = params['status'];
      }
      if (params['currency']?.isNotEmpty == true) {
        orderData['currency'] = params['currency'];
      }
      if (params['customer_id']?.isNotEmpty == true) {
        final customerId = int.tryParse(params['customer_id']!);
        if (customerId != null) {
          orderData['customer_id'] = customerId;
        }
      }
      if (params['customer_note']?.isNotEmpty == true) {
        orderData['customer_note'] = params['customer_note'];
      }
      if (params['payment_method']?.isNotEmpty == true) {
        orderData['payment_method'] = params['payment_method'];
      }
      if (params['payment_method_title']?.isNotEmpty == true) {
        orderData['payment_method_title'] = params['payment_method_title'];
      }
      if (params['set_paid'] == 'true') {
        orderData['set_paid'] = true;
      }
      if (params['transaction_id']?.isNotEmpty == true) {
        orderData['transaction_id'] = params['transaction_id'];
      }

      // Parse billing information
      Map<String, dynamic> billing = {};
      if (params['billing_first_name']?.isNotEmpty == true) {
        billing['first_name'] = params['billing_first_name'];
      }
      if (params['billing_last_name']?.isNotEmpty == true) {
        billing['last_name'] = params['billing_last_name'];
      }
      if (params['billing_company']?.isNotEmpty == true) {
        billing['company'] = params['billing_company'];
      }
      if (params['billing_address_1']?.isNotEmpty == true) {
        billing['address_1'] = params['billing_address_1'];
      }
      if (params['billing_address_2']?.isNotEmpty == true) {
        billing['address_2'] = params['billing_address_2'];
      }
      if (params['billing_city']?.isNotEmpty == true) {
        billing['city'] = params['billing_city'];
      }
      if (params['billing_state']?.isNotEmpty == true) {
        billing['state'] = params['billing_state'];
      }
      if (params['billing_postcode']?.isNotEmpty == true) {
        billing['postcode'] = params['billing_postcode'];
      }
      if (params['billing_country']?.isNotEmpty == true) {
        billing['country'] = params['billing_country'];
      }
      if (params['billing_email']?.isNotEmpty == true) {
        billing['email'] = params['billing_email'];
      }
      if (params['billing_phone']?.isNotEmpty == true) {
        billing['phone'] = params['billing_phone'];
      }
      if (billing.isNotEmpty) {
        orderData['billing'] = billing;
      }

      // Parse shipping information
      Map<String, dynamic> shipping = {};
      if (params['shipping_first_name']?.isNotEmpty == true) {
        shipping['first_name'] = params['shipping_first_name'];
      }
      if (params['shipping_last_name']?.isNotEmpty == true) {
        shipping['last_name'] = params['shipping_last_name'];
      }
      if (params['shipping_company']?.isNotEmpty == true) {
        shipping['company'] = params['shipping_company'];
      }
      if (params['shipping_address_1']?.isNotEmpty == true) {
        shipping['address_1'] = params['shipping_address_1'];
      }
      if (params['shipping_address_2']?.isNotEmpty == true) {
        shipping['address_2'] = params['shipping_address_2'];
      }
      if (params['shipping_city']?.isNotEmpty == true) {
        shipping['city'] = params['shipping_city'];
      }
      if (params['shipping_state']?.isNotEmpty == true) {
        shipping['state'] = params['shipping_state'];
      }
      if (params['shipping_postcode']?.isNotEmpty == true) {
        shipping['postcode'] = params['shipping_postcode'];
      }
      if (params['shipping_country']?.isNotEmpty == true) {
        shipping['country'] = params['shipping_country'];
      }
      if (params['shipping_phone']?.isNotEmpty == true) {
        shipping['phone'] = params['shipping_phone'];
      }
      if (shipping.isNotEmpty) {
        orderData['shipping'] = shipping;
      }

      // Remove null/empty values
      orderData.removeWhere((key, value) => value == null || value == '');

      print("🔍 [DEBUG] Update order data: $orderData");

      final response = await GetIt.I<OrdersService>().updateOrder(
        apiVersion: WooNetwork.apiVersion,
        orderId: orderId,
        orderData: orderData,
      );

      return {
        "status": "success",
        "order": response.toJson(),
        "order_id": orderId,
        "params": params,
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      print("🚨 Update Order Error Details: $e");

      String errorMessage = "Failed to update order: ${e.toString()}";
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
            name: 'order_id',
            label: 'Order ID',
            hint: 'ID of the order to update',
            isRequired: true,
          ),

          // Order Fields
          const ApiField(
            name: 'status',
            label: 'Order Status',
            hint:
                'Order status (pending, processing, on-hold, completed, cancelled, refunded, failed)',
          ),
          const ApiField(
            name: 'currency',
            label: 'Currency',
            hint: 'Currency code (e.g., USD, EUR, GBP)',
          ),
          const ApiField(
            name: 'customer_id',
            label: 'Customer ID',
            hint: 'User ID who owns the order (0 for guests)',
          ),
          const ApiField(
            name: 'customer_note',
            label: 'Customer Note',
            hint: 'Note left by customer during checkout',
          ),
          const ApiField(
            name: 'payment_method',
            label: 'Payment Method',
            hint: 'Payment method ID (e.g., bacs, cheque, cod)',
          ),
          const ApiField(
            name: 'payment_method_title',
            label: 'Payment Method Title',
            hint: 'Payment method title',
          ),
          const ApiField(
            name: 'set_paid',
            label: 'Set Paid',
            hint: 'Define if the order is paid (true/false)',
          ),
          const ApiField(
            name: 'transaction_id',
            label: 'Transaction ID',
            hint: 'Unique transaction ID',
          ),

          // Billing Fields
          const ApiField(
            name: 'billing_first_name',
            label: 'Billing First Name',
            hint: 'Customer billing first name',
          ),
          const ApiField(
            name: 'billing_last_name',
            label: 'Billing Last Name',
            hint: 'Customer billing last name',
          ),
          const ApiField(
            name: 'billing_company',
            label: 'Billing Company',
            hint: 'Customer billing company',
          ),
          const ApiField(
            name: 'billing_address_1',
            label: 'Billing Address 1',
            hint: 'Customer billing address line 1',
          ),
          const ApiField(
            name: 'billing_address_2',
            label: 'Billing Address 2',
            hint: 'Customer billing address line 2',
          ),
          const ApiField(
            name: 'billing_city',
            label: 'Billing City',
            hint: 'Customer billing city',
          ),
          const ApiField(
            name: 'billing_state',
            label: 'Billing State',
            hint: 'Customer billing state',
          ),
          const ApiField(
            name: 'billing_postcode',
            label: 'Billing Postcode',
            hint: 'Customer billing postcode',
          ),
          const ApiField(
            name: 'billing_country',
            label: 'Billing Country',
            hint: 'Customer billing country (2-letter code)',
          ),
          const ApiField(
            name: 'billing_email',
            label: 'Billing Email',
            hint: 'Customer billing email address',
          ),
          const ApiField(
            name: 'billing_phone',
            label: 'Billing Phone',
            hint: 'Customer billing phone number',
          ),

          // Shipping Fields
          const ApiField(
            name: 'shipping_first_name',
            label: 'Shipping First Name',
            hint: 'Customer shipping first name',
          ),
          const ApiField(
            name: 'shipping_last_name',
            label: 'Shipping Last Name',
            hint: 'Customer shipping last name',
          ),
          const ApiField(
            name: 'shipping_company',
            label: 'Shipping Company',
            hint: 'Customer shipping company',
          ),
          const ApiField(
            name: 'shipping_address_1',
            label: 'Shipping Address 1',
            hint: 'Customer shipping address line 1',
          ),
          const ApiField(
            name: 'shipping_address_2',
            label: 'Shipping Address 2',
            hint: 'Customer shipping address line 2',
          ),
          const ApiField(
            name: 'shipping_city',
            label: 'Shipping City',
            hint: 'Customer shipping city',
          ),
          const ApiField(
            name: 'shipping_state',
            label: 'Shipping State',
            hint: 'Customer shipping state',
          ),
          const ApiField(
            name: 'shipping_postcode',
            label: 'Shipping Postcode',
            hint: 'Customer shipping postcode',
          ),
          const ApiField(
            name: 'shipping_country',
            label: 'Shipping Country',
            hint: 'Customer shipping country (2-letter code)',
          ),
          const ApiField(
            name: 'shipping_phone',
            label: 'Shipping Phone',
            hint: 'Customer shipping phone number',
          ),
        ],
      };
}
