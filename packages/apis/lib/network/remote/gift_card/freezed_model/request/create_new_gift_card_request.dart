// To parse this JSON data, do
//
//     final createNewGiftCardRequest = createNewGiftCardRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'create_new_gift_card_request.freezed.dart';
part 'create_new_gift_card_request.g.dart';

CreateNewGiftCardRequest createNewGiftCardRequestFromJson(String str) =>
    CreateNewGiftCardRequest.fromJson(json.decode(str));

String createNewGiftCardRequestToJson(CreateNewGiftCardRequest data) =>
    json.encode(data.toJson());

@freezed
class CreateNewGiftCardRequest with _$CreateNewGiftCardRequest {
  const factory CreateNewGiftCardRequest({
    @JsonKey(name: "gift_card") GiftCard? giftCard,
  }) = _CreateNewGiftCardRequest;

  factory CreateNewGiftCardRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateNewGiftCardRequestFromJson(json);
}

@freezed
class GiftCard with _$GiftCard {
  const factory GiftCard({
    @JsonKey(name: "initial_value") int? initialValue,
    @JsonKey(name: "note") String? note,
    @JsonKey(name: "currency") String? currency,
  }) = _GiftCard;

  factory GiftCard.fromJson(Map<String, dynamic> json) =>
      _$GiftCardFromJson(json);
}
