import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/orders/abstract/orders_service.dart';
import 'package:apis/network/remote/woocommerce/orders/freezed_model/request/create_order_request.dart';
import 'package:example/services/api_request_handler.dart';
import 'package:get_it/get_it.dart';
import 'package:example/services/api_service_registry.dart';
import 'package:dio/dio.dart';

///*******************************************************************
///******************* ✨ CREATE ORDER HANDLER ********************
///*******************************************************************

class CreateOrderHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, dynamic> params,
  ) async {
    if (method != 'POST') {
      return {
        "status": "error",
        "message": "Method $method not supported for Create Order API",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      // Parse billing information
      Billing? billing;
      if (params.containsKey('billing_first_name') ||
          params.containsKey('billing_email')) {
        billing = Billing(
          firstName: params['billing_first_name']?.isNotEmpty == true
              ? params['billing_first_name']
              : null,
          lastName: params['billing_last_name']?.isNotEmpty == true
              ? params['billing_last_name']
              : null,
          address1: params['billing_address_1']?.isNotEmpty == true
              ? params['billing_address_1']
              : null,
          city: params['billing_city']?.isNotEmpty == true
              ? params['billing_city']
              : null,
          state: params['billing_state']?.isNotEmpty == true
              ? params['billing_state']
              : null,
          postcode: params['billing_postcode']?.isNotEmpty == true
              ? params['billing_postcode']
              : null,
          country: params['billing_country']?.isNotEmpty == true
              ? params['billing_country']
              : null,
          email: params['billing_email']?.isNotEmpty == true
              ? params['billing_email']
              : null,
          phone: params['billing_phone']?.isNotEmpty == true
              ? params['billing_phone']
              : null,
        );
      }

      // Parse shipping information
      Shipping? shipping;
      if (params.containsKey('shipping_first_name') ||
          params.containsKey('shipping_address_1')) {
        shipping = Shipping(
          firstName:
              params['shipping_first_name']?.toString().isNotEmpty == true
                  ? params['shipping_first_name']?.toString()
                  : null,
          lastName: params['shipping_last_name']?.toString().isNotEmpty == true
              ? params['shipping_last_name']?.toString()
              : null,
          address1: params['shipping_address_1']?.toString().isNotEmpty == true
              ? params['shipping_address_1']?.toString()
              : null,
          city: params['shipping_city']?.toString().isNotEmpty == true
              ? params['shipping_city']?.toString()
              : null,
          state: params['shipping_state']?.toString().isNotEmpty == true
              ? params['shipping_state']?.toString()
              : null,
          postcode: params['shipping_postcode']?.toString().isNotEmpty == true
              ? params['shipping_postcode']?.toString()
              : null,
          country: params['shipping_country']?.toString().isNotEmpty == true
              ? params['shipping_country']?.toString()
              : null,
        );
      }

      // Parse line items
      List<LineItem>? lineItems;
      if (params.containsKey('product_id') && params.containsKey('quantity')) {
        final productId = int.tryParse(params['product_id']!);
        final quantity = int.tryParse(params['quantity']!);

        if (productId != null && quantity != null) {
          lineItems = [
            LineItem(
              productId: productId,
              quantity: quantity,
            ),
          ];
        }
      }

      // Create order request
      final orderData = CreateOrderRequest(
        paymentMethod: params['payment_method']?.isNotEmpty == true
            ? params['payment_method']
            : null,
        paymentMethodTitle: params['payment_method_title']?.isNotEmpty == true
            ? params['payment_method_title']
            : null,
        setPaid: params['set_paid'] == 'true' ? true : null,
        billing: billing,
        shipping: shipping,
        lineItems: lineItems,
      );

      final response = await GetIt.I<OrdersService>().createOrder(
        apiVersion: WooNetwork.apiVersion,
        orderData: orderData,
      );

      return {
        "status": "success",
        "order": response.toJson(),
        "params": params,
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      print("🚨 Create Order Error Details: $e");

      String errorMessage = "Failed to create order: ${e.toString()}";
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
  List<String> get supportedMethods => ['POST'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'POST': [
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
            name: 'billing_address_1',
            label: 'Billing Address 1',
            hint: 'Customer billing address line 1',
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
            name: 'shipping_address_1',
            label: 'Shipping Address 1',
            hint: 'Customer shipping address line 1',
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

          // Line Items
          const ApiField(
            name: 'product_id',
            label: 'Product ID',
            hint: 'Product ID to add to order',
          ),
          const ApiField(
            name: 'quantity',
            label: 'Quantity',
            hint: 'Product quantity',
          ),
        ],
      };
}
