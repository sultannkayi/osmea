import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'update_note_attributes_request.freezed.dart';
part 'update_note_attributes_request.g.dart';

UpdateNoteAttributesRequest updateNoteAttributesRequestFromJson(String str) =>
    UpdateNoteAttributesRequest.fromJson(json.decode(str));

String updateNoteAttributesRequestToJson(UpdateNoteAttributesRequest data) =>
    json.encode(data.toJson());

@freezed
class UpdateNoteAttributesRequest with _$UpdateNoteAttributesRequest {
  const factory UpdateNoteAttributesRequest({
    @JsonKey(name: "order") Order? order,
  }) = _UpdateNoteAttributesRequest;

  factory UpdateNoteAttributesRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateNoteAttributesRequestFromJson(json);
}

@freezed
class Order with _$Order {
  const factory Order({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "note_attributes") List<NoteAttribute>? noteAttributes,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}

@freezed
class NoteAttribute with _$NoteAttribute {
  const factory NoteAttribute({
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "value") String? value,
  }) = _NoteAttribute;

  factory NoteAttribute.fromJson(Map<String, dynamic> json) =>
      _$NoteAttributeFromJson(json);
}
