// To parse this JSON data, do
//
//     final batchUpdateCustomersResponse = batchUpdateCustomersResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'batch_update_customers_response.freezed.dart';
part 'batch_update_customers_response.g.dart';

BatchUpdateCustomersResponse batchUpdateCustomersResponseFromJson(String str) => BatchUpdateCustomersResponse.fromJson(json.decode(str));

String batchUpdateCustomersResponseToJson(BatchUpdateCustomersResponse data) => json.encode(data.toJson());

@freezed
class BatchUpdateCustomersResponse with _$BatchUpdateCustomersResponse {
    const factory BatchUpdateCustomersResponse({
        @JsonKey(name: "create")
        List<Create>? create,
        @JsonKey(name: "update")
        List<Delete>? update,
        @JsonKey(name: "delete")
        List<Delete>? delete,
    }) = _BatchUpdateCustomersResponse;

    factory BatchUpdateCustomersResponse.fromJson(Map<String, dynamic> json) => _$BatchUpdateCustomersResponseFromJson(json);
}

@freezed
class Create with _$Create {
    const factory Create({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "date_created")
        String? dateCreated,
        @JsonKey(name: "date_created_gmt")
        String? dateCreatedGmt,
        @JsonKey(name: "date_modified")
        String? dateModified,
        @JsonKey(name: "date_modified_gmt")
        String? dateModifiedGmt,
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
        @JsonKey(name: "is_paying_customer")
        bool? isPayingCustomer,
        @JsonKey(name: "avatar_url")
        String? avatarUrl,
        @JsonKey(name: "meta_data")
        List<MetaDatum>? metaData,
        @JsonKey(name: "_links")
        Links? links,
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
        @JsonKey(name: "postcode")
        String? postcode,
        @JsonKey(name: "country")
        String? country,
        @JsonKey(name: "state")
        String? state,
        @JsonKey(name: "email")
        String? email,
        @JsonKey(name: "phone")
        String? phone,
    }) = _Billing;

    factory Billing.fromJson(Map<String, dynamic> json) => _$BillingFromJson(json);
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
class MetaDatum with _$MetaDatum {
    const factory MetaDatum({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "key")
        String? key,
        @JsonKey(name: "value")
        String? value,
    }) = _MetaDatum;

    factory MetaDatum.fromJson(Map<String, dynamic> json) => _$MetaDatumFromJson(json);
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
        @JsonKey(name: "postcode")
        String? postcode,
        @JsonKey(name: "country")
        String? country,
        @JsonKey(name: "state")
        String? state,
        @JsonKey(name: "phone")
        String? phone,
    }) = _Shipping;

    factory Shipping.fromJson(Map<String, dynamic> json) => _$ShippingFromJson(json);
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
