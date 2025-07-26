// To parse this JSON data, do
//
//     final createCouponRequest = createCouponRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'create_coupon_request.freezed.dart';
part 'create_coupon_request.g.dart';

CreateCouponRequest createCouponRequestFromJson(String str) =>
    CreateCouponRequest.fromJson(json.decode(str));

String createCouponRequestToJson(CreateCouponRequest data) =>
    json.encode(data.toJson());

@freezed
class CreateCouponRequest with _$CreateCouponRequest {
  const factory CreateCouponRequest({
    @JsonKey(name: "code") String? code,
    @JsonKey(name: "amount") String? amount,
    @JsonKey(name: "discount_type") String? discountType,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "date_expires") String? dateExpires,
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
    @JsonKey(name: "meta_data") List<MetaDatum>? metaData,
  }) = _CreateCouponRequest;

  factory CreateCouponRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateCouponRequestFromJson(json);
}

@freezed
class MetaDatum with _$MetaDatum {
  const factory MetaDatum({
    @JsonKey(name: "key") String? key,
    @JsonKey(name: "value") String? value,
  }) = _MetaDatum;

  factory MetaDatum.fromJson(Map<String, dynamic> json) =>
      _$MetaDatumFromJson(json);
}
