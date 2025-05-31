// To parse this JSON data, do
//
//     final createGiftCardWithCustomCodeRequest = createGiftCardWithCustomCodeRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'create_gift_card_with_custom_code_request.freezed.dart';
part 'create_gift_card_with_custom_code_request.g.dart';

CreateGiftCardWithCustomCodeRequest createGiftCardWithCustomCodeRequestFromJson(
        String str) =>
    CreateGiftCardWithCustomCodeRequest.fromJson(json.decode(str));

String createGiftCardWithCustomCodeRequestToJson(
        CreateGiftCardWithCustomCodeRequest data) =>
    json.encode(data.toJson());

@freezed
class CreateGiftCardWithCustomCodeRequest
    with _$CreateGiftCardWithCustomCodeRequest {
  const factory CreateGiftCardWithCustomCodeRequest({
    @JsonKey(name: "gift_card") GiftCard? giftCard,
  }) = _CreateGiftCardWithCustomCodeRequest;

  factory CreateGiftCardWithCustomCodeRequest.fromJson(
          Map<String, dynamic> json) =>
      _$CreateGiftCardWithCustomCodeRequestFromJson(json);
}

@freezed
class GiftCard with _$GiftCard {
  const factory GiftCard({
    @JsonKey(name: "note") String? note,
    @JsonKey(name: "initial_value") int? initialValue,
    @JsonKey(name: "code") String? code,
    @JsonKey(name: "template_suffix") String? templateSuffix,
  }) = _GiftCard;

  factory GiftCard.fromJson(Map<String, dynamic> json) =>
      _$GiftCardFromJson(json);
}
