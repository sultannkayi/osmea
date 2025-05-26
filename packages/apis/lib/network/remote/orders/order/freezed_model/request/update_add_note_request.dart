import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'update_add_note_request.freezed.dart';
part 'update_add_note_request.g.dart';

UpdateAddNoteRequest updateAddNoteRequestFromJson(String str) =>
    UpdateAddNoteRequest.fromJson(json.decode(str));

String updateAddNoteRequestToJson(UpdateAddNoteRequest data) =>
    json.encode(data.toJson());

@freezed
class UpdateAddNoteRequest with _$UpdateAddNoteRequest {
  const factory UpdateAddNoteRequest({
    @JsonKey(name: "order") Order? order,
  }) = _UpdateAddNoteRequest;

  factory UpdateAddNoteRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateAddNoteRequestFromJson(json);
}

@freezed
class Order with _$Order {
  const factory Order({
    @JsonKey(name: "note") String? note,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}
