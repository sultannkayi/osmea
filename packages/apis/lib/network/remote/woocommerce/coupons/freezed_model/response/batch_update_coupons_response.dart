// To parse this JSON data, do
//
//     final batchUpdateCouponsResponse = batchUpdateCouponsResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'batch_update_coupons_response.freezed.dart';
part 'batch_update_coupons_response.g.dart';

BatchUpdateCouponsResponse batchUpdateCouponsResponseFromJson(String str) => BatchUpdateCouponsResponse.fromJson(json.decode(str));

String batchUpdateCouponsResponseToJson(BatchUpdateCouponsResponse data) => json.encode(data.toJson());

@freezed
class BatchUpdateCouponsResponse with _$BatchUpdateCouponsResponse {
    const factory BatchUpdateCouponsResponse({
        @JsonKey(name: "create")
        List<Create>? create,
        @JsonKey(name: "update")
        List<Delete>? update,
        @JsonKey(name: "delete")
        List<Delete>? delete,
    }) = _BatchUpdateCouponsResponse;

    factory BatchUpdateCouponsResponse.fromJson(Map<String, dynamic> json) => _$BatchUpdateCouponsResponseFromJson(json);
}

@freezed
class Create with _$Create {
    const factory Create({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "code")
        String? code,
        @JsonKey(name: "amount")
        String? amount,
        @JsonKey(name: "status")
        String? status,
        @JsonKey(name: "date_created")
        String? dateCreated,
        @JsonKey(name: "date_created_gmt")
        String? dateCreatedGmt,
        @JsonKey(name: "date_modified")
        String? dateModified,
        @JsonKey(name: "date_modified_gmt")
        String? dateModifiedGmt,
        @JsonKey(name: "discount_type")
        String? discountType,
        @JsonKey(name: "description")
        String? description,
        @JsonKey(name: "date_expires")
        dynamic dateExpires,
        @JsonKey(name: "date_expires_gmt")
        dynamic dateExpiresGmt,
        @JsonKey(name: "usage_count")
        int? usageCount,
        @JsonKey(name: "individual_use")
        bool? individualUse,
        @JsonKey(name: "product_ids")
        List<dynamic>? productIds,
        @JsonKey(name: "excluded_product_ids")
        List<dynamic>? excludedProductIds,
        @JsonKey(name: "usage_limit")
        dynamic usageLimit,
        @JsonKey(name: "usage_limit_per_user")
        dynamic usageLimitPerUser,
        @JsonKey(name: "limit_usage_to_x_items")
        dynamic limitUsageToXItems,
        @JsonKey(name: "free_shipping")
        bool? freeShipping,
        @JsonKey(name: "product_categories")
        List<dynamic>? productCategories,
        @JsonKey(name: "excluded_product_categories")
        List<dynamic>? excludedProductCategories,
        @JsonKey(name: "exclude_sale_items")
        bool? excludeSaleItems,
        @JsonKey(name: "minimum_amount")
        String? minimumAmount,
        @JsonKey(name: "maximum_amount")
        String? maximumAmount,
        @JsonKey(name: "email_restrictions")
        List<dynamic>? emailRestrictions,
        @JsonKey(name: "used_by")
        List<dynamic>? usedBy,
        @JsonKey(name: "meta_data")
        List<dynamic>? metaData,
        @JsonKey(name: "_links")
        Links? links,
    }) = _Create;

    factory Create.fromJson(Map<String, dynamic> json) => _$CreateFromJson(json);
}

@freezed
class Links with _$Links {
    const factory Links({
        @JsonKey(name: "self")
        List<Self>? self,
        @JsonKey(name: "collection")
        List<Collection>? collection,
    }) = _Links;

    factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);
}

@freezed
class Collection with _$Collection {
    const factory Collection({
        @JsonKey(name: "href")
        String? href,
    }) = _Collection;

    factory Collection.fromJson(Map<String, dynamic> json) => _$CollectionFromJson(json);
}

@freezed
class Self with _$Self {
    const factory Self({
        @JsonKey(name: "href")
        String? href,
        @JsonKey(name: "targetHints")
        TargetHints? targetHints,
    }) = _Self;

    factory Self.fromJson(Map<String, dynamic> json) => _$SelfFromJson(json);
}

@freezed
class TargetHints with _$TargetHints {
    const factory TargetHints({
        @JsonKey(name: "allow")
        List<String>? allow,
    }) = _TargetHints;

    factory TargetHints.fromJson(Map<String, dynamic> json) => _$TargetHintsFromJson(json);
}

@freezed
class Delete with _$Delete {
    const factory Delete({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "error")
        Error? error,
    }) = _Delete;

    factory Delete.fromJson(Map<String, dynamic> json) => _$DeleteFromJson(json);
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
