// To parse this JSON data, do
//
//     final updateCouponResponse = updateCouponResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'update_coupon_response.freezed.dart';
part 'update_coupon_response.g.dart';

UpdateCouponResponse updateCouponResponseFromJson(String str) =>
    UpdateCouponResponse.fromJson(json.decode(str));

String updateCouponResponseToJson(UpdateCouponResponse data) =>
    json.encode(data.toJson());

@freezed
class UpdateCouponResponse with _$UpdateCouponResponse {
  const factory UpdateCouponResponse({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "code") String? code,
    @JsonKey(name: "amount") String? amount,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "date_created") String? dateCreated,
    @JsonKey(name: "date_created_gmt") String? dateCreatedGmt,
    @JsonKey(name: "date_modified") String? dateModified,
    @JsonKey(name: "date_modified_gmt") String? dateModifiedGmt,
    @JsonKey(name: "discount_type") String? discountType,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "date_expires") String? dateExpires,
    @JsonKey(name: "date_expires_gmt") String? dateExpiresGmt,
    @JsonKey(name: "usage_count") int? usageCount,
    @JsonKey(name: "individual_use") bool? individualUse,
    @JsonKey(name: "product_ids") List<int>? productIds,
    @JsonKey(name: "excluded_product_ids") List<int>? excludedProductIds,
    @JsonKey(name: "usage_limit") int? usageLimit,
    @JsonKey(name: "usage_limit_per_user") int? usageLimitPerUser,
    @JsonKey(name: "limit_usage_to_x_items") int? limitUsageToXItems,
    @JsonKey(name: "free_shipping") bool? freeShipping,
    @JsonKey(name: "product_categories") List<int>? productCategories,
    @JsonKey(name: "excluded_product_categories")
    List<int>? excludedProductCategories,
    @JsonKey(name: "exclude_sale_items") bool? excludeSaleItems,
    @JsonKey(name: "minimum_amount") String? minimumAmount,
    @JsonKey(name: "maximum_amount") String? maximumAmount,
    @JsonKey(name: "email_restrictions") List<String>? emailRestrictions,
    @JsonKey(name: "used_by") List<dynamic>? usedBy,
    @JsonKey(name: "meta_data") List<MetaDatum>? metaData,
    @JsonKey(name: "_links") Links? links,
  }) = _UpdateCouponResponse;

  factory UpdateCouponResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateCouponResponseFromJson(json);
}

@freezed
class Links with _$Links {
  const factory Links({
    @JsonKey(name: "self") List<Self>? self,
    @JsonKey(name: "collection") List<Collection>? collection,
  }) = _Links;

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);
}

@freezed
class Collection with _$Collection {
  const factory Collection({
    @JsonKey(name: "href") String? href,
  }) = _Collection;

  factory Collection.fromJson(Map<String, dynamic> json) =>
      _$CollectionFromJson(json);
}

@freezed
class Self with _$Self {
  const factory Self({
    @JsonKey(name: "href") String? href,
    @JsonKey(name: "targetHints") TargetHints? targetHints,
  }) = _Self;

  factory Self.fromJson(Map<String, dynamic> json) => _$SelfFromJson(json);
}

@freezed
class TargetHints with _$TargetHints {
  const factory TargetHints({
    @JsonKey(name: "allow") List<String>? allow,
  }) = _TargetHints;

  factory TargetHints.fromJson(Map<String, dynamic> json) =>
      _$TargetHintsFromJson(json);
}

@freezed
class MetaDatum with _$MetaDatum {
  const factory MetaDatum({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "key") String? key,
    @JsonKey(name: "value") String? value,
  }) = _MetaDatum;

  factory MetaDatum.fromJson(Map<String, dynamic> json) =>
      _$MetaDatumFromJson(json);
}
