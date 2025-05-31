// To parse this JSON data, do
//
//     final disableGiftCardRequest = disableGiftCardRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'disable_gift_card_request.freezed.dart';
part 'disable_gift_card_request.g.dart';

DisableGiftCardRequest disableGiftCardRequestFromJson(String str) =>
    DisableGiftCardRequest.fromJson(json.decode(str));

String disableGiftCardRequestToJson(DisableGiftCardRequest data) =>
    json.encode(data.toJson());

@freezed
class DisableGiftCardRequest with _$DisableGiftCardRequest {
  const factory DisableGiftCardRequest({
    @JsonKey(name: "gift_card") GiftCard? giftCard,
  }) = _DisableGiftCardRequest;

  factory DisableGiftCardRequest.fromJson(Map<String, dynamic> json) =>
      _$DisableGiftCardRequestFromJson(json);
}

@freezed
class GiftCard with _$GiftCard {
  const factory GiftCard({
    @JsonKey(name: "id") int? id,
  }) = _GiftCard;

  factory GiftCard.fromJson(Map<String, dynamic> json) =>
      _$GiftCardFromJson(json);
}
