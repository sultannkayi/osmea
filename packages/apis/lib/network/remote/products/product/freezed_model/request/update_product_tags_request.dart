// To parse this JSON data, do
//
//     final updateProductTagsRequest = updateProductTagsRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'update_product_tags_request.freezed.dart';
part 'update_product_tags_request.g.dart';

UpdateProductTagsRequest updateProductTagsRequestFromJson(String str) => UpdateProductTagsRequest.fromJson(json.decode(str));

String updateProductTagsRequestToJson(UpdateProductTagsRequest data) => json.encode(data.toJson());

@freezed
class UpdateProductTagsRequest with _$UpdateProductTagsRequest {
    const factory UpdateProductTagsRequest({
        @JsonKey(name: "product")
        Product? product,
    }) = _UpdateProductTagsRequest;

    factory UpdateProductTagsRequest.fromJson(Map<String, dynamic> json) => _$UpdateProductTagsRequestFromJson(json);
}

@freezed
class Product with _$Product {
    const factory Product({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "tags")
        String? tags,
    }) = _Product;

    factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}
