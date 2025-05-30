// To parse this JSON data, do
//
//     final automaticallyCreateGiftCardRequest = automaticallyCreateGiftCardRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'automatically_create_gift_card_request.freezed.dart';
part 'automatically_create_gift_card_request.g.dart';

AutomaticallyCreateGiftCardRequest automaticallyCreateGiftCardRequestFromJson(
        String str) =>
    AutomaticallyCreateGiftCardRequest.fromJson(json.decode(str));

String automaticallyCreateGiftCardRequestToJson(
        AutomaticallyCreateGiftCardRequest data) =>
    json.encode(data.toJson());

@freezed
class AutomaticallyCreateGiftCardRequest
    with _$AutomaticallyCreateGiftCardRequest {
  const factory AutomaticallyCreateGiftCardRequest({
    @JsonKey(name: "gift_card") GiftCard? giftCard,
  }) = _AutomaticallyCreateGiftCardRequest;

  factory AutomaticallyCreateGiftCardRequest.fromJson(
          Map<String, dynamic> json) =>
      _$AutomaticallyCreateGiftCardRequestFromJson(json);
}

@freezed
class GiftCard with _$GiftCard {
  const factory GiftCard({
    @JsonKey(name: "initial_value") int? initialValue,
  }) = _GiftCard;

  factory GiftCard.fromJson(Map<String, dynamic> json) =>
      _$GiftCardFromJson(json);
}
