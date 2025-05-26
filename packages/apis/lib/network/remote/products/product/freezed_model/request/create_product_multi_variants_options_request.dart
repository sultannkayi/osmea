// To parse this JSON data, do
//
//     final createProductMultiVariantsOptionsRequest = createProductMultiVariantsOptionsRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'create_product_multi_variants_options_request.freezed.dart';
part 'create_product_multi_variants_options_request.g.dart';

CreateProductMultiVariantsOptionsRequest createProductMultiVariantsOptionsRequestFromJson(String str) => CreateProductMultiVariantsOptionsRequest.fromJson(json.decode(str));

String createProductMultiVariantsOptionsRequestToJson(CreateProductMultiVariantsOptionsRequest data) => json.encode(data.toJson());

@freezed
class CreateProductMultiVariantsOptionsRequest with _$CreateProductMultiVariantsOptionsRequest {
    const factory CreateProductMultiVariantsOptionsRequest({
        @JsonKey(name: "product")
        Product? product,
    }) = _CreateProductMultiVariantsOptionsRequest;

    factory CreateProductMultiVariantsOptionsRequest.fromJson(Map<String, dynamic> json) => _$CreateProductMultiVariantsOptionsRequestFromJson(json);
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
        @JsonKey(name: "variants")
        List<Variant>? variants,
        @JsonKey(name: "options")
        List<Option>? options,
    }) = _Product;

    factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}

@freezed
class Option with _$Option {
    const factory Option({
        @JsonKey(name: "name")
        String? name,
        @JsonKey(name: "values")
        List<String>? values,
    }) = _Option;

    factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);
}

@freezed
class Variant with _$Variant {
    const factory Variant({
        @JsonKey(name: "option1")
        String? option1,
        @JsonKey(name: "option2")
        String? option2,
    }) = _Variant;

    factory Variant.fromJson(Map<String, dynamic> json) => _$VariantFromJson(json);
}
