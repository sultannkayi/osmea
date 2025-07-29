// To parse this JSON data, do
//
//     final batchUpdateProductTagsRequest = batchUpdateProductTagsRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'batch_update_product_tags_request.freezed.dart';
part 'batch_update_product_tags_request.g.dart';

BatchUpdateProductTagsRequest batchUpdateProductTagsRequestFromJson(String str) => BatchUpdateProductTagsRequest.fromJson(json.decode(str));

String batchUpdateProductTagsRequestToJson(BatchUpdateProductTagsRequest data) => json.encode(data.toJson());

@freezed
class BatchUpdateProductTagsRequest with _$BatchUpdateProductTagsRequest {
    const factory BatchUpdateProductTagsRequest({
        @JsonKey(name: "create")
        List<Create>? create,
        @JsonKey(name: "update")
        List<Update>? update,
        @JsonKey(name: "delete")
        List<int>? delete,
    }) = _BatchUpdateProductTagsRequest;

    factory BatchUpdateProductTagsRequest.fromJson(Map<String, dynamic> json) => _$BatchUpdateProductTagsRequestFromJson(json);
}

@freezed
class Create with _$Create {
    const factory Create({
        @JsonKey(name: "name")
        String? name,
        @JsonKey(name: "slug")
        String? slug,
        @JsonKey(name: "description")
        String? description,
    }) = _Create;

    factory Create.fromJson(Map<String, dynamic> json) => _$CreateFromJson(json);
}

@freezed
class Update with _$Update {
    const factory Update({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "name")
        String? name,
        @JsonKey(name: "slug")
        String? slug,
        @JsonKey(name: "description")
        String? description,
    }) = _Update;

    factory Update.fromJson(Map<String, dynamic> json) => _$UpdateFromJson(json);
}
