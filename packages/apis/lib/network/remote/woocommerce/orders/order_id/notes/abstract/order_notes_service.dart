import 'package:apis/network/remote/woocommerce/orders/order_id/notes/freezed_model/response/list_all_order_notes_response.dart';
import 'package:apis/network/remote/woocommerce/orders/order_id/notes/freezed_model/response/create_order_note_response.dart';
import 'package:apis/network/remote/woocommerce/orders/order_id/notes/freezed_model/response/retrieve_order_note_response.dart';
import 'package:apis/network/remote/woocommerce/orders/order_id/notes/freezed_model/response/delete_order_note_response.dart';

/// 🔑 Abstract contract for WooCommerce Order Notes Service
/// Defines the interface for all order notes-related operations in WooCommerce API
abstract class OrderNotesService {
  /// 📋 Retrieves a list of all notes from a specific order in the WooCommerce API.
  Future<List<ListAllOrderNotesResponse>> listAllOrderNotes({
    required String apiVersion,
    required int orderId,
    String? context,
    String? type,
  });

  /// ➕ Creates a new note for a specific order in the WooCommerce API.
  Future<CreateOrderNoteResponse> createOrderNote({
    required String apiVersion,
    required int orderId,
    required Map<String, dynamic> noteData,
  });

  /// 🔍 Retrieves a single note from a specific order in the WooCommerce API.
  Future<RetrieveOrderNoteResponse> retrieveOrderNote({
    required String apiVersion,
    required int orderId,
    required int noteId,
    String? context,
  });

  /// 🗑️ Deletes a note from a specific order in the WooCommerce API.
  Future<DeleteOrderNoteResponse> deleteOrderNote({
    required String apiVersion,
    required int orderId,
    required int noteId,
    bool? force,
  });
}
