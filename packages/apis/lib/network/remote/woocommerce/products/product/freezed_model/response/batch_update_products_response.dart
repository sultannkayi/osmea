// To parse this JSON data, do
//
//     final batchUpdateProductsResponse = batchUpdateProductsResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'batch_update_products_response.freezed.dart';
part 'batch_update_products_response.g.dart';

BatchUpdateProductsResponse batchUpdateProductsResponseFromJson(String str) => BatchUpdateProductsResponse.fromJson(json.decode(str));

String batchUpdateProductsResponseToJson(BatchUpdateProductsResponse data) => json.encode(data.toJson());

@freezed
class BatchUpdateProductsResponse with _$BatchUpdateProductsResponse {
    const factory BatchUpdateProductsResponse({
        @JsonKey(name: "create")
        List<Create>? create,
        @JsonKey(name: "update")
        List<Create>? update,
        @JsonKey(name: "delete")
        List<Create>? delete,
    }) = _BatchUpdateProductsResponse;

    factory BatchUpdateProductsResponse.fromJson(Map<String, dynamic> json) => _$BatchUpdateProductsResponseFromJson(json);
}

@freezed
class Create with _$Create {
    const factory Create({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "error")
        Error? error,
    }) = _Create;

    factory Create.fromJson(Map<String, dynamic> json) => _$CreateFromJson(json);
}

@freezed
class Error with _$Error {
    const factory Error({
        @JsonKey(name: "code")
        String? code,
        @JsonKey(name: "message")
        String? message,
        @JsonKey(name: "data")
        Data? data,
    }) = _Error;

    factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);
}

@freezed
class Data with _$Data {
    const factory Data({
        @JsonKey(name: "status")
        int? status,
    }) = _Data;

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
