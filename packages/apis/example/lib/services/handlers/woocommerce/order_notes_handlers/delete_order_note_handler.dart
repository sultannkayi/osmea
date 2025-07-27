import 'package:apis/network/remote/woocommerce/orders/order_id/notes/abstract/order_notes_service.dart';
import 'package:example/services/api_request_handler.dart';
import 'package:example/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

/// 🎯 DeleteOrderNoteHandler - WooCommerce Delete Order Note API
///
/// This handler deletes a note from a specific order using the WooCommerce API.
///
/// **Required Parameters:**
/// - order_id: Order ID (number)
/// - note_id: Note ID (number)
/// - force: Force delete (optional, true/false)
class DeleteOrderNoteHandler extends ApiRequestHandler {
  @override
  String get name => 'WooCommerce Delete Order Note';

  @override
  String get description => 'Deletes a note from the specified order';

  @override
  List<String> get supportedMethods => ['DELETE'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'DELETE': [
          const ApiField(
            name: 'order_id',
            label: 'Order ID',
            hint: 'Order ID number (e.g: 123)',
            isRequired: true,
            type: ApiFieldType.number,
          ),
          const ApiField(
            name: 'note_id',
            label: 'Note ID',
            hint: 'Note ID number (e.g: 456)',
            isRequired: true,
            type: ApiFieldType.number,
          ),
          const ApiField(
            name: 'force',
            label: 'Force Delete',
            hint: 'Force delete permanently (true/false, default: false)',
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
      final noteId = int.tryParse(params['note_id']?.toString() ?? '');
      final forceStr = params['force']?.toString().toLowerCase();

      // ✅ Validate required parameters
      if (orderId == null || orderId <= 0) {
        throw Exception('❌ order_id is required and must be a valid number!');
      }

      if (noteId == null || noteId <= 0) {
        throw Exception('❌ note_id is required and must be a valid number!');
      }

      // 🔧 Parse force parameter
      bool? force;
      if (forceStr != null && forceStr.isNotEmpty) {
        if (forceStr == 'true' || forceStr == '1') {
          force = true;
        } else if (forceStr == 'false' || forceStr == '0') {
          force = false;
        }
      }

      // 🌐 Make API call
      final service = GetIt.I.get<OrderNotesService>();
      final response = await service.deleteOrderNote(
        apiVersion: 'v3',
        orderId: orderId,
        noteId: noteId,
        force: force,
      );

      // ✅ Return successful response
      return {
        "status": "success",
        "message": "Order note deleted successfully",
        "deleted_note": response.toJson(),
        "order_id": orderId,
        "note_id": noteId,
        "force": force,
        "params": params,
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      // ❌ Return detailed error information
      return {
        "status": "error",
        "message": "Delete Order Note failed: ${e.toString()}",
        "error_details": e.toString(),
        "params": params,
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }
}
