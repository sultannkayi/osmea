import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:apis/network/remote/products/collect/freezed_model/collect.dart';
import 'dart:convert';

part 'get_collects_response.freezed.dart';
part 'get_collects_response.g.dart';

GetCollectsResponse getCollectsResponseFromJson(String str) => GetCollectsResponse.fromJson(json.decode(str));

String getCollectsResponseToJson(GetCollectsResponse data) => json.encode(data.toJson());

@freezed
class GetCollectsResponse with _$GetCollectsResponse {
    const factory GetCollectsResponse({
        @JsonKey(name: "collects")
        List<Collect>? collects,
    }) = _GetCollectsResponse;

    factory GetCollectsResponse.fromJson(Map<String, dynamic> json) => _$GetCollectsResponseFromJson(json);
}