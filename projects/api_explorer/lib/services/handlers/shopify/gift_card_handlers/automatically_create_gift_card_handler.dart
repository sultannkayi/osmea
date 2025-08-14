import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/gift_card/abstract/gift_card_service.dart';
import 'package:apis/network/remote/shopify/gift_card/freezed_model/request/automatically_create_gift_card_request.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:api_explorer/services/api_service_registry.dart';

///*******************************************************************
///*************** 🤖 AUTO CREATE GIFT CARD HANDLER 🤖 ***************
///*******************************************************************

class AutomaticallyCreateGiftCardHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    switch (method) {
      case 'POST':
        try {
          final initialValueStr = params['initial_value'] ?? '';

          // ✅ Convert initialValue to int
          final initialValue = int.tryParse(initialValueStr);

          if (initialValue == null) {
            return {
              "status": "error",
              "message": "Initial value must be a valid number.",
              "timestamp": DateTime.now().toIso8601String(),
            };
          }

          final giftCardModel = GiftCard(
            initialValue: initialValue,
          );

          debugPrint(
              '🎯 JSON being sent: ${AutomaticallyCreateGiftCardRequest(giftCard: giftCardModel).toJson()}');

          final response = await GetIt.I
              .get<GiftCardService>()
              .automaticallyCreateGiftCard(
                apiVersion: ApiNetwork.apiVersion,
                model:
                    AutomaticallyCreateGiftCardRequest(giftCard: giftCardModel),
              );

          return {
            "status": "success",
            "message": "Gift card automatically created successfully",
            "giftCard": {
              "id": response.giftCard?.id,
              "initial_value": response.giftCard?.initialValue,
              "currency": response.giftCard?.currency,
              "balance": response.giftCard?.balance,
              "note": response.giftCard?.note,
              "code": response.giftCard?.code,
              "created_at": response.giftCard?.createdAt,
              "updated_at": response.giftCard?.updatedAt,
              "last_characters": response.giftCard?.lastCharacters,
              "expires_on": response.giftCard?.expiresOn,
              "template_suffix": response.giftCard?.templateSuffix,
              "api_client_id": response.giftCard?.apiClientId,
              "customer_id": response.giftCard?.customerId,
              "disabled_at": response.giftCard?.disabledAt,
              "line_item_id": response.giftCard?.lineItemId,
              "order_id": response.giftCard?.orderId,
              "user_id": response.giftCard?.userId,
            },
            "timestamp": DateTime.now().toIso8601String(),
          };
        } catch (e) {
          if (e.toString().contains('session has expired') ||
              e.toString().contains('login?errorHint=no_identity_session')) {
            return {
              "status": "auth_error",
              "message":
                  "Your session has expired. Please re-authenticate to continue.",
              "timestamp": DateTime.now().toIso8601String(),
            };
          }

          return {
            "status": "error",
            "message":
                "Failed to automatically create gift card: ${e.toString()}",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

      default:
        return {
          "error":
              "Method $method not supported for Gift Card API. Only POST is allowed.",
        };
    }
  }

  @override
  List<String> get supportedMethods => ['POST'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'POST': [
          const ApiField(
            name: 'initial_value',
            label: 'Initial Value',
            hint: 'Gift card value as integer (e.g. 100)',
            type: ApiFieldType.number,
            isRequired: true,
          ),
        ],
      };
}
