import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/gift_card/abstract/gift_card_service.dart';
import 'package:apis/network/remote/shopify/gift_card/freezed_model/request/create_gift_card_with_custom_code_request.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:api_explorer/services/api_service_registry.dart';

///*******************************************************************
///*************** 🎫 CREATE GIFT CARD WITH CUSTOM CODE HANDLER 🎫 ***************
///*******************************************************************

class CreateGiftCardWithCustomCodeHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    switch (method) {
      case 'POST':
        try {
          final initialValueStr = params['initial_value'] ?? '';
          final code = params['code'] ?? '';

          final initialValue = int.tryParse(initialValueStr);

          if (initialValue == null || code.isEmpty) {
            return {
              "status": "error",
              "message":
                  "Initial value must be a valid number and code is required.",
              "timestamp": DateTime.now().toIso8601String(),
            };
          }

          // 📋 Optional fields
          final note = params['note'];
          final templateSuffix = params['template_suffix'];

          final giftCardModel = GiftCard(
            initialValue: initialValue,
            code: code,
            note: note,
            templateSuffix: templateSuffix,
          );

          debugPrint(
              '🎯 JSON being sent: ${CreateGiftCardWithCustomCodeRequest(giftCard: giftCardModel).toJson()}');

          final response =
              await GetIt.I.get<GiftCardService>().createGiftCardWithCustomCode(
                    apiVersion: ApiNetwork.apiVersion,
                    model: CreateGiftCardWithCustomCodeRequest(
                        giftCard: giftCardModel),
                  );

          return {
            "status": "success",
            "message": "Gift card with custom code created successfully",
            "giftCard": {
              "id": response.giftCard?.id,
              "initial_value": response.giftCard?.initialValue,
              "code": response.giftCard?.code,
              "note": response.giftCard?.note,
              "template_suffix": response.giftCard?.templateSuffix,
              "balance": response.giftCard?.balance,
              "currency": response.giftCard?.currency,
              "created_at": response.giftCard?.createdAt,
              "last_characters": response.giftCard?.lastCharacters,
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
                "Failed to create gift card with custom code: ${e.toString()}",
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
            hint: 'Gift card value (e.g. 100)',
            type: ApiFieldType.number,
            isRequired: true,
          ),
          const ApiField(
            name: 'code',
            label: 'Custom Code',
            hint: 'Custom gift card code (e.g. WELCOME2024)',
            isRequired: true,
          ),
          const ApiField(
            name: 'note',
            label: 'Note',
            hint: 'Optional note about this card',
          ),
          const ApiField(
            name: 'template_suffix',
            label: 'Template Suffix',
            hint: 'Optional template suffix',
          ),
        ],
      };
}
