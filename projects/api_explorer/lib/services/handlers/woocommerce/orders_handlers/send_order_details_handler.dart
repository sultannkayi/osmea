import 'package:apis/network/remote/woocommerce/orders/abstract/orders_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

/// 🎯 SendOrderDetailsHandler - WooCommerce Send Order Details API
///
/// This handler sends order details email to customer using the WooCommerce API.
///
/// **Required Parameters:**
/// - order_id: Order ID (number)
/// - action: Action type (string, default: "send_order_details")
/// - resend_customer_invoice: Resend invoice (optional, true/false)
/// - custom_message: Custom message (optional, string)
class SendOrderDetailsHandler extends ApiRequestHandler {
  String get name => 'WooCommerce Send Order Details';

  String get description => 'Sends order details email to customer';

  @override
  List<String> get supportedMethods => ['POST'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'POST': [
          const ApiField(
            name: 'order_id',
            label: 'Order ID',
            hint: 'Order ID number (e.g: 123)',
            isRequired: true,
            type: ApiFieldType.number,
          ),
          const ApiField(
            name: 'action',
            label: 'Action',
            hint: 'Action type (default: send_order_details)',
            isRequired: false,
            type: ApiFieldType.text,
          ),
          const ApiField(
            name: 'resend_customer_invoice',
            label: 'Resend Customer Invoice',
            hint: 'Resend invoice to customer (true/false)',
            isRequired: false,
            type: ApiFieldType.boolean,
          ),
          const ApiField(
            name: 'custom_message',
            label: 'Custom Message',
            hint: 'Custom message to include in email',
            isRequired: false,
            type: ApiFieldType.text,
          ),
        ],
      };

  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, dynamic> params,
  ) async {
    try {
      // 📊 Parse parameters
      final orderId = int.tryParse(params['order_id']?.toString() ?? '');
      final action = params['action']?.toString() ?? 'send_order_details';
      final resendInvoiceStr =
          params['resend_customer_invoice']?.toString().toLowerCase();
      final customMessage = params['custom_message']?.toString();

      // ✅ Validate required parameters
      if (orderId == null || orderId <= 0) {
        throw Exception('❌ order_id is required and must be a valid number!');
      }

      // 🔧 Build action data
      final Map<String, dynamic> actionData = {
        'action': action,
      };

      // Add resend_customer_invoice if provided
      if (resendInvoiceStr != null && resendInvoiceStr.isNotEmpty) {
        if (resendInvoiceStr == 'true' || resendInvoiceStr == '1') {
          actionData['resend_customer_invoice'] = true;
        } else if (resendInvoiceStr == 'false' || resendInvoiceStr == '0') {
          actionData['resend_customer_invoice'] = false;
        }
      }

      // Add custom message if provided
      if (customMessage != null && customMessage.isNotEmpty) {
        actionData['custom_message'] = customMessage;
      }

      // 🌐 Make API call
      final service = GetIt.I.get<OrdersService>();
      final response = await service.sendOrderDetails(
        apiVersion: 'v3',
        orderId: orderId,
        actionData: actionData,
      );

      // ✅ Return successful response
      return {
        "status": "success",
        "message": "Order details sent successfully",
        "response": response.toJson(),
        "order_id": orderId,
        "action_data": actionData,
        "params": params,
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      // ❌ Return detailed error information
      return {
        "status": "error",
        "message": "Send Order Details failed: ${e.toString()}",
        "error_details": e.toString(),
        "params": params,
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }
}
