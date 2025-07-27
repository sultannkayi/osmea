// To parse this JSON data, do
//
//     final createOrderNoteRequest = createOrderNoteRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'create_order_note_request.freezed.dart';
part 'create_order_note_request.g.dart';

CreateOrderNoteRequest createOrderNoteRequestFromJson(String str) =>
    CreateOrderNoteRequest.fromJson(json.decode(str));

String createOrderNoteRequestToJson(CreateOrderNoteRequest data) =>
    json.encode(data.toJson());

@freezed
class CreateOrderNoteRequest with _$CreateOrderNoteRequest {
  const factory CreateOrderNoteRequest({
    @JsonKey(name: "note") String? note,
    @JsonKey(name: "customer_note") bool? customerNote,
  }) = _CreateOrderNoteRequest;

  factory CreateOrderNoteRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderNoteRequestFromJson(json);
}
