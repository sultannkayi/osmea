// To parse this JSON data, do
//
//     final updateCouponRequest = updateCouponRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'update_coupon_request.freezed.dart';
part 'update_coupon_request.g.dart';

UpdateCouponRequest updateCouponRequestFromJson(String str) =>
    UpdateCouponRequest.fromJson(json.decode(str));

String updateCouponRequestToJson(UpdateCouponRequest data) =>
    json.encode(data.toJson());

@freezed
class UpdateCouponRequest with _$UpdateCouponRequest {
  const factory UpdateCouponRequest({
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
  }) = _UpdateCouponRequest;

  factory UpdateCouponRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateCouponRequestFromJson(json);
}
