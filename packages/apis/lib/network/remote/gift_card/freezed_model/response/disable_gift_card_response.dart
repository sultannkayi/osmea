// To parse this JSON data, do
//
//     final disableGiftCardResponse = disableGiftCardResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'disable_gift_card_response.freezed.dart';
part 'disable_gift_card_response.g.dart';

DisableGiftCardResponse disableGiftCardResponseFromJson(String str) =>
    DisableGiftCardResponse.fromJson(json.decode(str));

String disableGiftCardResponseToJson(DisableGiftCardResponse data) =>
    json.encode(data.toJson());

@freezed
class DisableGiftCardResponse with _$DisableGiftCardResponse {
  const factory DisableGiftCardResponse({
    @JsonKey(name: "gift_card") GiftCard? giftCard,
  }) = _DisableGiftCardResponse;

  factory DisableGiftCardResponse.fromJson(Map<String, dynamic> json) =>
      _$DisableGiftCardResponseFromJson(json);
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
    @JsonKey(name: "disabled_at") String? disabledAt,
    @JsonKey(name: "line_item_id") dynamic lineItemId,
    @JsonKey(name: "api_client_id") dynamic apiClientId,
    @JsonKey(name: "user_id") dynamic userId,
    @JsonKey(name: "customer_id") dynamic customerId,
    @JsonKey(name: "note") dynamic note,
    @JsonKey(name: "expires_on") dynamic expiresOn,
    @JsonKey(name: "template_suffix") dynamic templateSuffix,
    @JsonKey(name: "last_characters") String? lastCharacters,
    @JsonKey(name: "order_id") dynamic orderId,
  }) = _GiftCard;

  factory GiftCard.fromJson(Map<String, dynamic> json) =>
      _$GiftCardFromJson(json);
}
