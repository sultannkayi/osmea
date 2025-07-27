import 'package:apis/network/remote/woocommerce/orders/order_id/notes/abstract/order_notes_service.dart';
import 'package:example/services/api_request_handler.dart';
import 'package:example/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

/// 🎯 RetrieveOrderNoteHandler - WooCommerce Retrieve Order Note API
///
/// This handler retrieves a single order note using the WooCommerce API.
///
/// **Required Parameters:**
/// - order_id: Order ID (number)
/// - note_id: Note ID (number)
/// - context: Request context (optional, view/edit)
class RetrieveOrderNoteHandler extends ApiRequestHandler {
  @override
  String get name => 'WooCommerce Retrieve Order Note';

  @override
  String get description => 'Retrieves a single note from the specified order';

  @override
  List<String> get supportedMethods => ['GET'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'GET': [
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
            name: 'context',
            label: 'Context',
            hint: 'Request context (view, edit)',
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
      final noteId = int.tryParse(params['note_id']?.toString() ?? '');
      final context = params['context']?.toString();

      // ✅ Validate required parameters
      if (orderId == null || orderId <= 0) {
        throw Exception('❌ order_id is required and must be a valid number!');
      }

      if (noteId == null || noteId <= 0) {
        throw Exception('❌ note_id is required and must be a valid number!');
      }

      // 🌐 Make API call
      final service = GetIt.I.get<OrderNotesService>();
      final response = await service.retrieveOrderNote(
        apiVersion: 'v3',
        orderId: orderId,
        noteId: noteId,
        context: context?.isNotEmpty == true ? context : null,
      );

      // ✅ Return successful response
      return {
        "status": "success",
        "message": "Order note retrieved successfully",
        "order_note": response.toJson(),
        "order_id": orderId,
        "note_id": noteId,
        "params": params,
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      // ❌ Return detailed error information
      return {
        "status": "error",
        "message": "Retrieve Order Note failed: ${e.toString()}",
        "error_details": e.toString(),
        "params": params,
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }
}
