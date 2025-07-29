// To parse this JSON data, do
//
//     final batchUpdateCustomersRequest = batchUpdateCustomersRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'batch_update_customers_request.freezed.dart';
part 'batch_update_customers_request.g.dart';

BatchUpdateCustomersRequest batchUpdateCustomersRequestFromJson(String str) => BatchUpdateCustomersRequest.fromJson(json.decode(str));

String batchUpdateCustomersRequestToJson(BatchUpdateCustomersRequest data) => json.encode(data.toJson());

@freezed
class BatchUpdateCustomersRequest with _$BatchUpdateCustomersRequest {
    const factory BatchUpdateCustomersRequest({
        @JsonKey(name: "create")
        List<Create>? create,
        @JsonKey(name: "update")
        List<Update>? update,
        @JsonKey(name: "delete")
        List<int>? delete,
    }) = _BatchUpdateCustomersRequest;

    factory BatchUpdateCustomersRequest.fromJson(Map<String, dynamic> json) => _$BatchUpdateCustomersRequestFromJson(json);
}

@freezed
class Create with _$Create {
    const factory Create({
        @JsonKey(name: "email")
        String? email,
        @JsonKey(name: "first_name")
        String? firstName,
        @JsonKey(name: "last_name")
        String? lastName,
        @JsonKey(name: "role")
        String? role,
        @JsonKey(name: "username")
        String? username,
        @JsonKey(name: "billing")
        Billing? billing,
        @JsonKey(name: "shipping")
        Shipping? shipping,
    }) = _Create;

    factory Create.fromJson(Map<String, dynamic> json) => _$CreateFromJson(json);
}

@freezed
class Billing with _$Billing {
    const factory Billing({
        @JsonKey(name: "first_name")
        String? firstName,
        @JsonKey(name: "last_name")
        String? lastName,
        @JsonKey(name: "company")
        String? company,
        @JsonKey(name: "address_1")
        String? address1,
        @JsonKey(name: "address_2")
        String? address2,
        @JsonKey(name: "city")
        String? city,
        @JsonKey(name: "state")
        String? state,
        @JsonKey(name: "postcode")
        String? postcode,
        @JsonKey(name: "country")
        String? country,
        @JsonKey(name: "email")
        String? email,
        @JsonKey(name: "phone")
        String? phone,
    }) = _Billing;

    factory Billing.fromJson(Map<String, dynamic> json) => _$BillingFromJson(json);
}

@freezed
class Shipping with _$Shipping {
    const factory Shipping({
        @JsonKey(name: "first_name")
        String? firstName,
        @JsonKey(name: "last_name")
        String? lastName,
        @JsonKey(name: "company")
        String? company,
        @JsonKey(name: "address_1")
        String? address1,
        @JsonKey(name: "address_2")
        String? address2,
        @JsonKey(name: "city")
        String? city,
        @JsonKey(name: "state")
        String? state,
        @JsonKey(name: "postcode")
        String? postcode,
        @JsonKey(name: "country")
        String? country,
    }) = _Shipping;

    factory Shipping.fromJson(Map<String, dynamic> json) => _$ShippingFromJson(json);
}

@freezed
class Update with _$Update {
    const factory Update({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "email")
        String? email,
        @JsonKey(name: "first_name")
        String? firstName,
        @JsonKey(name: "last_name")
        String? lastName,
        @JsonKey(name: "role")
        String? role,
        @JsonKey(name: "username")
        String? username,
        @JsonKey(name: "billing")
        Billing? billing,
        @JsonKey(name: "shipping")
        Shipping? shipping,
    }) = _Update;

    factory Update.fromJson(Map<String, dynamic> json) => _$UpdateFromJson(json);
}
