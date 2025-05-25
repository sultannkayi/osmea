import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:apis/network/remote/products/collect/freezed_model/collect.dart';
import 'dart:convert';

part 'get_single_collect_response.freezed.dart';
part 'get_single_collect_response.g.dart';

GetSingleCollectResponse getSingleCollectResponseFromJson(String str) => GetSingleCollectResponse.fromJson(json.decode(str));

String getSingleCollectResponseToJson(GetSingleCollectResponse data) => json.encode(data.toJson());

@freezed
class GetSingleCollectResponse with _$GetSingleCollectResponse {
    const factory GetSingleCollectResponse({
        @JsonKey(name: "collect")
        Collect? collect,
    }) = _GetSingleCollectResponse;

    factory GetSingleCollectResponse.fromJson(Map<String, dynamic> json) => _$GetSingleCollectResponseFromJson(json);
}