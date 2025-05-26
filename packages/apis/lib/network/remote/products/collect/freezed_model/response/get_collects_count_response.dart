import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'get_collects_count_response.freezed.dart';
part 'get_collects_count_response.g.dart';

GetCollectsCountResponse getCollectsCountResponseFromJson(String str) => GetCollectsCountResponse.fromJson(json.decode(str));

String getCollectsCountResponseToJson(GetCollectsCountResponse data) => json.encode(data.toJson());

@freezed
class GetCollectsCountResponse with _$GetCollectsCountResponse {
    const factory GetCollectsCountResponse({
        @JsonKey(name: "count")
        int? count,
    }) = _GetCollectsCountResponse;

    factory GetCollectsCountResponse.fromJson(Map<String, dynamic> json) => _$GetCollectsCountResponseFromJson(json);
}