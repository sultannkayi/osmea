// To parse this JSON data, do
//
//     final countProductsCollectionResponse = countProductsCollectionResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'count_products_collection_response.freezed.dart';
part 'count_products_collection_response.g.dart';

CountProductsCollectionResponse countProductsCollectionResponseFromJson(String str) => CountProductsCollectionResponse.fromJson(json.decode(str));

String countProductsCollectionResponseToJson(CountProductsCollectionResponse data) => json.encode(data.toJson());

@freezed
class CountProductsCollectionResponse with _$CountProductsCollectionResponse {
    const factory CountProductsCollectionResponse({
        @JsonKey(name: "count")
        int? count,
    }) = _CountProductsCollectionResponse;

    factory CountProductsCollectionResponse.fromJson(Map<String, dynamic> json) => _$CountProductsCollectionResponseFromJson(json);
}
