// To parse this JSON data, do
//
//     final listAllCustomersResponse = listAllCustomersResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'list_all_customers_response.freezed.dart';
part 'list_all_customers_response.g.dart';

List<ListAllCustomersResponse> listAllCustomersResponseFromJson(String str) =>
    List<ListAllCustomersResponse>.from(
        json.decode(str).map((x) => ListAllCustomersResponse.fromJson(x)));

String listAllCustomersResponseToJson(List<ListAllCustomersResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class ListAllCustomersResponse with _$ListAllCustomersResponse {
  const factory ListAllCustomersResponse({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "date_created") String? dateCreated,
    @JsonKey(name: "date_created_gmt") String? dateCreatedGmt,
    @JsonKey(name: "date_modified") String? dateModified,
    @JsonKey(name: "date_modified_gmt") String? dateModifiedGmt,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "first_name") String? firstName,
    @JsonKey(name: "last_name") String? lastName,
    @JsonKey(name: "role") String? role,
    @JsonKey(name: "username") String? username,
    @JsonKey(name: "billing") Billing? billing,
    @JsonKey(name: "shipping") Shipping? shipping,
    @JsonKey(name: "is_paying_customer") bool? isPayingCustomer,
    @JsonKey(name: "avatar_url") String? avatarUrl,
    @JsonKey(name: "meta_data") List<MetaDatum>? metaData,
    @JsonKey(name: "_links") Links? links,
  }) = _ListAllCustomersResponse;

  factory ListAllCustomersResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAllCustomersResponseFromJson(json);
}

@freezed
class Billing with _$Billing {
  const factory Billing({
    @JsonKey(name: "first_name") String? firstName,
    @JsonKey(name: "last_name") String? lastName,
    @JsonKey(name: "company") String? company,
    @JsonKey(name: "address_1") String? address1,
    @JsonKey(name: "address_2") String? address2,
    @JsonKey(name: "city") String? city,
    @JsonKey(name: "postcode") String? postcode,
    @JsonKey(name: "country") String? country,
    @JsonKey(name: "state") String? state,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "phone") String? phone,
  }) = _Billing;

  factory Billing.fromJson(Map<String, dynamic> json) =>
      _$BillingFromJson(json);
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

@freezed
class Shipping with _$Shipping {
  const factory Shipping({
    @JsonKey(name: "first_name") String? firstName,
    @JsonKey(name: "last_name") String? lastName,
    @JsonKey(name: "company") String? company,
    @JsonKey(name: "address_1") String? address1,
    @JsonKey(name: "address_2") String? address2,
    @JsonKey(name: "city") String? city,
    @JsonKey(name: "postcode") String? postcode,
    @JsonKey(name: "country") String? country,
    @JsonKey(name: "state") String? state,
    @JsonKey(name: "phone") String? phone,
  }) = _Shipping;

  factory Shipping.fromJson(Map<String, dynamic> json) =>
      _$ShippingFromJson(json);
}
