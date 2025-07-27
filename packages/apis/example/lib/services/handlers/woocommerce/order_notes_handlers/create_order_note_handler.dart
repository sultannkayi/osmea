import 'package:apis/network/remote/woocommerce/orders/order_id/notes/abstract/order_notes_service.dart';
import 'package:example/services/api_request_handler.dart';
import 'package:example/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

/// 🎯 CreateOrderNoteHandler - WooCommerce Create Order Note API
///
/// This handler creates a new order note using the WooCommerce API.
///
/// **Required Parameters:**
/// - order_id: Order ID (number)
/// - note: Note text (string)
/// - customer_note: Visible to customer (true/false, optional, default: false)
class CreateOrderNoteHandler extends ApiRequestHandler {
  @override
  String get name => 'WooCommerce Create Order Note';

  @override
  String get description => 'Creates a new note for the specified order';

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
            name: 'note',
            label: 'Note',
            hint: 'Note text (e.g: "Customer requested special delivery")',
            isRequired: true,
            type: ApiFieldType.text,
          ),
          const ApiField(
            name: 'customer_note',
            label: 'Customer Note',
            hint: 'Visible to customer? (true/false, default: false)',
            isRequired: false,
            type: ApiFieldType.boolean,
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
      final note = params['note']?.toString() ?? '';
      final customerNote = params['customer_note']?.toString().toLowerCase();

      // ✅ Validate required parameters
      if (orderId == null || orderId <= 0) {
        throw Exception('❌ order_id is required and must be a valid number!');
      }

      if (note.isEmpty) {
        throw Exception('❌ note parameter is required and cannot be empty!');
      }

      // 🔧 Build request body
      final Map<String, dynamic> noteData = {
        'note': note,
      };

      // Add customer_note parameter if provided
      if (customerNote != null && customerNote.isNotEmpty) {
        if (customerNote == 'true' || customerNote == '1') {
          noteData['customer_note'] = true;
        } else if (customerNote == 'false' || customerNote == '0') {
          noteData['customer_note'] = false;
        }
      }

      // 🌐 Make API call
      final service = GetIt.I.get<OrderNotesService>();
      final response = await service.createOrderNote(
        apiVersion: 'v3',
        orderId: orderId,
        noteData: noteData,
      );

      // ✅ Return successful response
      return {
        "status": "success",
        "message": "Order note created successfully",
        "order_note": response.toJson(),
        "order_id": orderId,
        "note_data": noteData,
        "params": params,
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      // ❌ Return detailed error information
      return {
        "status": "error",
        "message": "Create Order Note failed: ${e.toString()}",
        "error_details": e.toString(),
        "params": params,
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }
}
