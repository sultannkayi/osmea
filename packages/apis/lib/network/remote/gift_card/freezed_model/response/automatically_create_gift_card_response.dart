// To parse this JSON data, do
//
//     final automaticallyCreateGiftCardResponse = automaticallyCreateGiftCardResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'automatically_create_gift_card_response.freezed.dart';
part 'automatically_create_gift_card_response.g.dart';

AutomaticallyCreateGiftCardResponse automaticallyCreateGiftCardResponseFromJson(
        String str) =>
    AutomaticallyCreateGiftCardResponse.fromJson(json.decode(str));

String automaticallyCreateGiftCardResponseToJson(
        AutomaticallyCreateGiftCardResponse data) =>
    json.encode(data.toJson());

@freezed
class AutomaticallyCreateGiftCardResponse
    with _$AutomaticallyCreateGiftCardResponse {
  const factory AutomaticallyCreateGiftCardResponse({
    @JsonKey(name: "gift_card") GiftCard? giftCard,
  }) = _AutomaticallyCreateGiftCardResponse;

  factory AutomaticallyCreateGiftCardResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AutomaticallyCreateGiftCardResponseFromJson(json);
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
    @JsonKey(name: "note") dynamic note,
    @JsonKey(name: "expires_on") dynamic expiresOn,
    @JsonKey(name: "template_suffix") dynamic templateSuffix,
    @JsonKey(name: "last_characters") String? lastCharacters,
    @JsonKey(name: "order_id") dynamic orderId,
    @JsonKey(name: "code") String? code,
  }) = _GiftCard;

  factory GiftCard.fromJson(Map<String, dynamic> json) =>
      _$GiftCardFromJson(json);
}
