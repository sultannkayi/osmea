// To parse this JSON data, do
//
//     final createGiftCardWithCustomCodeResponse = createGiftCardWithCustomCodeResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'create_gift_card_with_custom_code_response.freezed.dart';
part 'create_gift_card_with_custom_code_response.g.dart';

CreateGiftCardWithCustomCodeResponse
    createGiftCardWithCustomCodeResponseFromJson(String str) =>
        CreateGiftCardWithCustomCodeResponse.fromJson(json.decode(str));

String createGiftCardWithCustomCodeResponseToJson(
        CreateGiftCardWithCustomCodeResponse data) =>
    json.encode(data.toJson());

@freezed
class CreateGiftCardWithCustomCodeResponse
    with _$CreateGiftCardWithCustomCodeResponse {
  const factory CreateGiftCardWithCustomCodeResponse({
    @JsonKey(name: "gift_card") GiftCard? giftCard,
  }) = _CreateGiftCardWithCustomCodeResponse;

  factory CreateGiftCardWithCustomCodeResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateGiftCardWithCustomCodeResponseFromJson(json);
}

@freezed
class GiftCard with _$GiftCard {
  const factory GiftCard({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "balance") String? balance,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") String? updatedAt,
    @JsonKey(name: "currency") String? currency,
    @JsonKey(name: "initial_value") String? initialValue,
    @JsonKey(name: "disabled_at") dynamic disabledAt,
    @JsonKey(name: "line_item_id") dynamic lineItemId,
    @JsonKey(name: "api_client_id") int? apiClientId,
    @JsonKey(name: "user_id") dynamic userId,
    @JsonKey(name: "customer_id") dynamic customerId,
    @JsonKey(name: "note") String? note,
    @JsonKey(name: "expires_on") dynamic expiresOn,
    @JsonKey(name: "template_suffix") String? templateSuffix,
    @JsonKey(name: "last_characters") String? lastCharacters,
    @JsonKey(name: "order_id") dynamic orderId,
    @JsonKey(name: "code") String? code,
  }) = _GiftCard;

  factory GiftCard.fromJson(Map<String, dynamic> json) =>
      _$GiftCardFromJson(json);
}
