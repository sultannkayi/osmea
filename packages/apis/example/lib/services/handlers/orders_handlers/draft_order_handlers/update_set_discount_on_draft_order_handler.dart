import 'package:apis/apis.dart';
import 'package:apis/network/remote/orders/draft_order/abstract/draft_order_service.dart';
import 'package:apis/network/remote/orders/draft_order/freezed_model/request/update_set_discount_on_draft_order_request.dart'
    as update_request;
import 'package:apis/network/remote/orders/draft_order/freezed_model/response/update_set_discount_on_draft_order_response.dart';
import 'package:example/services/api_request_handler.dart';
import 'package:example/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

class UpdateSetDiscountOnDraftOrderHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    switch (method) {
      case 'PUT':
        final String apiVersion =
            params['api_version'] ?? ApiNetwork.apiVersion;
        final String? draftOrderId = params['draft_order_id'];
        final String? description = params['description'];
        final String? valueType = params['value_type'];
        final String? value = params['value'];
        final String? amount = params['amount'];
        final String? title = params['title'];

        if (draftOrderId == null || draftOrderId.isEmpty) {
          return {
            "status": "error",
            "message": "Draft Order ID is required.",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

        if (valueType == null ||
            valueType.isEmpty ||
            value == null ||
            value.isEmpty) {
          return {
            "status": "error",
            "message": "Value type and value are required for the discount.",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

        try {
          final model = update_request.UpdateSetDiscountOnDraftOrderRequest(
            draftOrder: update_request.DraftOrder(
              appliedDiscount: update_request.AppliedDiscount(
                description: description,
                valueType: valueType,
                value: value,
                amount: amount,
                title: title,
              ),
            ),
          );

          final UpdateSetDiscountOnDraftOrderResponse response = await GetIt.I
              .get<DraftOrderService>()
              .updateSetDiscountOnDraftOrder(
                apiVersion: apiVersion,
                draftOrderId: draftOrderId,
                model: model,
              );

          return {
            "status": "success",
            "message": "Discount applied to draft order successfully",
            "draft_order": response.draftOrder?.toJson(),
            "timestamp": DateTime.now().toIso8601String(),
          };
        } catch (e) {
          return {
            "status": "error",
            "message": "Failed to apply discount: ${e.toString()}",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

      default:
        return {
          "error": "Method $method not supported for Update Set Discount API",
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
            hint: 'Enter the ID of the draft order',
          ),
          const ApiField(
            name: 'value_type',
            label: 'Value Type',
            hint: 'Enter the type of discount (percentage or fixed_amount)',
          ),
          const ApiField(
            name: 'value',
            label: 'Value',
            hint: 'Enter the discount value',
          ),
        ],
      };

  Map<String, List<ApiField>> get optionalFields => {
        'PUT': [
          const ApiField(
            name: 'description',
            label: 'Description',
            hint: 'Enter a description for the discount',
          ),
          const ApiField(
            name: 'title',
            label: 'Title',
            hint: 'Enter a title for the discount',
          ),
          const ApiField(
            name: 'amount',
            label: 'Amount',
            hint: 'Enter the calculated amount of the discount',
          ),
        ],
      };
}
