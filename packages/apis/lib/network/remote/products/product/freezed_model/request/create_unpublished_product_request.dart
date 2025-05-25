// To parse this JSON data, do
//
//     final createUnpublishedProductRequest = createUnpublishedProductRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'create_unpublished_product_request.freezed.dart';
part 'create_unpublished_product_request.g.dart';

CreateUnpublishedProductRequest createUnpublishedProductRequestFromJson(String str) => CreateUnpublishedProductRequest.fromJson(json.decode(str));

String createUnpublishedProductRequestToJson(CreateUnpublishedProductRequest data) => json.encode(data.toJson());

@freezed
class CreateUnpublishedProductRequest with _$CreateUnpublishedProductRequest {
    const factory CreateUnpublishedProductRequest({
        @JsonKey(name: "product")
        Product? product,
    }) = _CreateUnpublishedProductRequest;

    factory CreateUnpublishedProductRequest.fromJson(Map<String, dynamic> json) => _$CreateUnpublishedProductRequestFromJson(json);
}

@freezed
class Product with _$Product {
    const factory Product({
        @JsonKey(name: "title")
        String? title,
        @JsonKey(name: "body_html")
        String? bodyHtml,
        @JsonKey(name: "vendor")
        String? vendor,
        @JsonKey(name: "product_type")
        String? productType,
        @JsonKey(name: "published")
        bool? published,
    }) = _Product;

    factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}
