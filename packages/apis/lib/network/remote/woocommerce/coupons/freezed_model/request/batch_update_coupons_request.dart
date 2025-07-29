// To parse this JSON data, do
//
//     final batchUpdateCouponsRequest = batchUpdateCouponsRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'batch_update_coupons_request.freezed.dart';
part 'batch_update_coupons_request.g.dart';

BatchUpdateCouponsRequest batchUpdateCouponsRequestFromJson(String str) => BatchUpdateCouponsRequest.fromJson(json.decode(str));

String batchUpdateCouponsRequestToJson(BatchUpdateCouponsRequest data) => json.encode(data.toJson());

@freezed
class BatchUpdateCouponsRequest with _$BatchUpdateCouponsRequest {
    const factory BatchUpdateCouponsRequest({
        @JsonKey(name: "create")
        List<Create>? create,
        @JsonKey(name: "update")
        List<Update>? update,
        @JsonKey(name: "delete")
        List<int>? delete,
    }) = _BatchUpdateCouponsRequest;

    factory BatchUpdateCouponsRequest.fromJson(Map<String, dynamic> json) => _$BatchUpdateCouponsRequestFromJson(json);
}

@freezed
class Create with _$Create {
    const factory Create({
        @JsonKey(name: "code")
        String? code,
        @JsonKey(name: "amount")
        String? amount,
        @JsonKey(name: "discount_type")
        String? discountType,
        @JsonKey(name: "individual_use")
        bool? individualUse,
        @JsonKey(name: "exclude_sale_items")
        bool? excludeSaleItems,
        @JsonKey(name: "minimum_amount")
        String? minimumAmount,
    }) = _Create;

    factory Create.fromJson(Map<String, dynamic> json) => _$CreateFromJson(json);
}

@freezed
class Update with _$Update {
    const factory Update({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "code")
        String? code,
        @JsonKey(name: "amount")
        String? amount,
        @JsonKey(name: "discount_type")
        String? discountType,
        @JsonKey(name: "individual_use")
        bool? individualUse,
        @JsonKey(name: "exclude_sale_items")
        bool? excludeSaleItems,
        @JsonKey(name: "minimum_amount")
        String? minimumAmount,
    }) = _Update;

    factory Update.fromJson(Map<String, dynamic> json) => _$UpdateFromJson(json);
}
