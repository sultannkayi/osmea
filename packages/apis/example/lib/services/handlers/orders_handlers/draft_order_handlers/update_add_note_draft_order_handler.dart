import 'package:apis/apis.dart';
import 'package:apis/network/remote/orders/draft_order/abstract/draft_order.dart';
import 'package:apis/network/remote/orders/draft_order/freezed_model/request/update_add_note_draft_order_request.dart'
    as update_request;
import 'package:apis/network/remote/orders/draft_order/freezed_model/response/update_add_note_draft_order_response.dart';
import 'package:example/services/api_request_handler.dart';
import 'package:example/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

class UpdateAddNoteDraftOrderHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    switch (method) {
      case 'PUT':
        final String apiVersion =
            params['api_version'] ?? ApiNetwork.apiVersion;
        final String? draftOrderId = params['draft_order_id'];
        final String? note = params['note'];

        if (draftOrderId == null || draftOrderId.isEmpty) {
          return {
            "status": "error",
            "message": "Draft Order ID is required.",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

        if (note == null || note.isEmpty) {
          return {
            "status": "error",
            "message": "Note is required.",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

        try {
          final model = update_request.UpdateAddNoteDraftOrderRequest(
            draftOrder: update_request.DraftOrder(
              note: note,
            ),
          );

          final UpdateAddNoteDraftOrderResponse response =
              await GetIt.I.get<DraftOrderService>().updateAddNoteDraftOrder(
                    apiVersion: apiVersion,
                    draftOrderId: draftOrderId,
                    model: model,
                  );

          return {
            "status": "success",
            "message": "Draft order note updated successfully",
            "draft_order": response.draftOrder?.toJson(),
            "timestamp": DateTime.now().toIso8601String(),
          };
        } catch (e) {
          return {
            "status": "error",
            "message": "Failed to update draft order note: ${e.toString()}",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

      default:
        return {
          "error":
              "Method $method not supported for Update Add Note Draft Order API",
        };
    }
  }

  @override
  List<String> get supportedMethods => ['PUT'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'PUT': [
          const ApiField(
            name: 'draft_order_id',
            label: 'Draft Order ID',
            hint: 'Enter the ID of the draft order to update',
          ),
          const ApiField(
            name: 'note',
            label: 'Note',
            hint: 'Enter the note to add to the draft order',
          ),
        ],
      };
}
