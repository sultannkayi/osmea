// To parse this JSON data, do
//
//     final listAllRefundsResponse = listAllRefundsResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'list_all_refunds_response.freezed.dart';
part 'list_all_refunds_response.g.dart';

List<ListAllRefundsResponse> listAllRefundsResponseFromJson(String str) =>
    List<ListAllRefundsResponse>.from(
        json.decode(str).map((x) => ListAllRefundsResponse.fromJson(x)));

String listAllRefundsResponseToJson(List<ListAllRefundsResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class ListAllRefundsResponse with _$ListAllRefundsResponse {
  const factory ListAllRefundsResponse({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "date_created") DateTime? dateCreated,
    @JsonKey(name: "date_created_gmt") DateTime? dateCreatedGmt,
    @JsonKey(name: "amount") String? amount,
    @JsonKey(name: "reason") String? reason,
    @JsonKey(name: "refunded_by") int? refundedBy,
    @JsonKey(name: "refunded_payment") bool? refundedPayment,
    @JsonKey(name: "meta_data") List<MetaData>? metaData,
    @JsonKey(name: "line_items") List<LineItem>? lineItems,
    @JsonKey(name: "api_refund") bool? apiRefund,
    @JsonKey(name: "_links") Links? links,
  }) = _ListAllRefundsResponse;

  factory ListAllRefundsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAllRefundsResponseFromJson(json);
}

@freezed
class LineItem with _$LineItem {
  const factory LineItem({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "product_id") int? productId,
    @JsonKey(name: "variation_id") int? variationId,
    @JsonKey(name: "quantity") int? quantity,
    @JsonKey(name: "tax_class") String? taxClass,
    @JsonKey(name: "subtotal") String? subtotal,
    @JsonKey(name: "subtotal_tax") String? subtotalTax,
    @JsonKey(name: "total") String? total,
    @JsonKey(name: "total_tax") String? totalTax,
    @JsonKey(name: "taxes") List<Tax>? taxes,
    @JsonKey(name: "meta_data") List<MetaData>? metaData,
    @JsonKey(name: "sku") String? sku,
    @JsonKey(name: "price") double? price,
  }) = _LineItem;

  factory LineItem.fromJson(Map<String, dynamic> json) =>
      _$LineItemFromJson(json);
}

@freezed
class Links with _$Links {
  const factory Links({
    @JsonKey(name: "self") List<Self>? self,
    @JsonKey(name: "collection") List<Collection>? collection,
    @JsonKey(name: "up") List<Up>? up,
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
  }) = _Self;

  factory Self.fromJson(Map<String, dynamic> json) => _$SelfFromJson(json);
}

@freezed
class Up with _$Up {
  const factory Up({
    @JsonKey(name: "href") String? href,
  }) = _Up;

  factory Up.fromJson(Map<String, dynamic> json) => _$UpFromJson(json);
}

@freezed
class MetaData with _$MetaData {
  const factory MetaData({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "key") String? key,
    @JsonKey(name: "value") dynamic value,
  }) = _MetaData;

  factory MetaData.fromJson(Map<String, dynamic> json) =>
      _$MetaDataFromJson(json);
}

@freezed
class Tax with _$Tax {
  const factory Tax({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "total") String? total,
    @JsonKey(name: "subtotal") String? subtotal,
  }) = _Tax;

  factory Tax.fromJson(Map<String, dynamic> json) => _$TaxFromJson(json);
}
