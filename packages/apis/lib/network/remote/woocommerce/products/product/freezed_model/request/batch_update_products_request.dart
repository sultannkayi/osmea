// To parse this JSON data, do
//
//     final batchUpdateProductsRequest = batchUpdateProductsRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'batch_update_products_request.freezed.dart';
part 'batch_update_products_request.g.dart';

BatchUpdateProductsRequest batchUpdateProductsRequestFromJson(String str) => BatchUpdateProductsRequest.fromJson(json.decode(str));

String batchUpdateProductsRequestToJson(BatchUpdateProductsRequest data) => json.encode(data.toJson());

@freezed
class BatchUpdateProductsRequest with _$BatchUpdateProductsRequest {
    const factory BatchUpdateProductsRequest({
        @JsonKey(name: "create")
        List<Create>? create,
        @JsonKey(name: "update")
        List<Update>? update,
        @JsonKey(name: "delete")
        List<int>? delete,
    }) = _BatchUpdateProductsRequest;

    factory BatchUpdateProductsRequest.fromJson(Map<String, dynamic> json) => _$BatchUpdateProductsRequestFromJson(json);
}

@freezed
class Create with _$Create {
    const factory Create({
        @JsonKey(name: "name")
        String? name,
        @JsonKey(name: "type")
        String? type,
        @JsonKey(name: "regular_price")
        String? regularPrice,
        @JsonKey(name: "description")
        String? description,
        @JsonKey(name: "short_description")
        String? shortDescription,
        @JsonKey(name: "categories")
        List<Category>? categories,
        @JsonKey(name: "images")
        List<Image>? images,
    }) = _Create;

    factory Create.fromJson(Map<String, dynamic> json) => _$CreateFromJson(json);
}

@freezed
class Category with _$Category {
    const factory Category({
        @JsonKey(name: "id")
        int? id,
    }) = _Category;

    factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
}

@freezed
class Image with _$Image {
    const factory Image({
        @JsonKey(name: "src")
        String? src,
    }) = _Image;

    factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}

@freezed
class Update with _$Update {
    const factory Update({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "name")
        String? name,
        @JsonKey(name: "type")
        String? type,
        @JsonKey(name: "description")
        String? description,
        @JsonKey(name: "categories")
        List<Category>? categories,
        @JsonKey(name: "images")
        List<Image>? images,
    }) = _Update;

    factory Update.fromJson(Map<String, dynamic> json) => _$UpdateFromJson(json);
}
