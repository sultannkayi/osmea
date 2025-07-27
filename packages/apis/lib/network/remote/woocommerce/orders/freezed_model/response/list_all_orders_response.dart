// To parse this JSON data, do
//
//     final listAllOrdersResponse = listAllOrdersResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'list_all_orders_response.freezed.dart';
part 'list_all_orders_response.g.dart';

List<ListAllOrdersResponse> listAllOrdersResponseFromJson(String str) =>
    List<ListAllOrdersResponse>.from(
        json.decode(str).map((x) => ListAllOrdersResponse.fromJson(x)));

String listAllOrdersResponseToJson(List<ListAllOrdersResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class ListAllOrdersResponse with _$ListAllOrdersResponse {
  const factory ListAllOrdersResponse({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "parent_id") int? parentId,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "currency") String? currency,
    @JsonKey(name: "version") String? version,
    @JsonKey(name: "prices_include_tax") bool? pricesIncludeTax,
    @JsonKey(name: "date_created") String? dateCreated,
    @JsonKey(name: "date_modified") String? dateModified,
    @JsonKey(name: "discount_total") String? discountTotal,
    @JsonKey(name: "discount_tax") String? discountTax,
    @JsonKey(name: "shipping_total") String? shippingTotal,
    @JsonKey(name: "shipping_tax") String? shippingTax,
    @JsonKey(name: "cart_tax") String? cartTax,
    @JsonKey(name: "total") String? total,
    @JsonKey(name: "total_tax") String? totalTax,
    @JsonKey(name: "customer_id") int? customerId,
    @JsonKey(name: "order_key") String? orderKey,
    @JsonKey(name: "billing") Billing? billing,
    @JsonKey(name: "shipping") Shipping? shipping,
    @JsonKey(name: "payment_method") String? paymentMethod,
    @JsonKey(name: "payment_method_title") String? paymentMethodTitle,
    @JsonKey(name: "transaction_id") String? transactionId,
    @JsonKey(name: "customer_ip_address") String? customerIpAddress,
    @JsonKey(name: "customer_user_agent") String? customerUserAgent,
    @JsonKey(name: "created_via") String? createdVia,
    @JsonKey(name: "customer_note") String? customerNote,
    @JsonKey(name: "date_completed") String? dateCompleted,
    @JsonKey(name: "date_paid") String? datePaid,
    @JsonKey(name: "cart_hash") String? cartHash,
    @JsonKey(name: "number") String? number,
    @JsonKey(name: "meta_data") List<dynamic>? metaData,
    @JsonKey(name: "line_items") List<LineItem>? lineItems,
    @JsonKey(name: "tax_lines") List<dynamic>? taxLines,
    @JsonKey(name: "shipping_lines") List<ShippingLine>? shippingLines,
    @JsonKey(name: "fee_lines") List<dynamic>? feeLines,
    @JsonKey(name: "coupon_lines") List<dynamic>? couponLines,
    @JsonKey(name: "refunds") List<dynamic>? refunds,
    @JsonKey(name: "payment_url") String? paymentUrl,
    @JsonKey(name: "is_editable") bool? isEditable,
    @JsonKey(name: "needs_payment") bool? needsPayment,
    @JsonKey(name: "needs_processing") bool? needsProcessing,
    @JsonKey(name: "date_created_gmt") String? dateCreatedGmt,
    @JsonKey(name: "date_modified_gmt") String? dateModifiedGmt,
    @JsonKey(name: "date_completed_gmt") String? dateCompletedGmt,
    @JsonKey(name: "date_paid_gmt") String? datePaidGmt,
    @JsonKey(name: "currency_symbol") String? currencySymbol,
    @JsonKey(name: "_links") Links? links,
  }) = _ListAllOrdersResponse;

  factory ListAllOrdersResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAllOrdersResponseFromJson(json);
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
    @JsonKey(name: "state") String? state,
    @JsonKey(name: "postcode") String? postcode,
    @JsonKey(name: "country") String? country,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "phone") String? phone,
  }) = _Billing;

  factory Billing.fromJson(Map<String, dynamic> json) =>
      _$BillingFromJson(json);
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
    @JsonKey(name: "taxes") List<dynamic>? taxes,
    @JsonKey(name: "meta_data") List<MetaDatum>? metaData,
    @JsonKey(name: "sku") String? sku,
    @JsonKey(name: "price") int? price,
    @JsonKey(name: "image") Image? image,
    @JsonKey(name: "parent_name") dynamic parentName,
  }) = _LineItem;

  factory LineItem.fromJson(Map<String, dynamic> json) =>
      _$LineItemFromJson(json);
}

@freezed
class Image with _$Image {
  const factory Image({
    @JsonKey(name: "id") dynamic id,
    @JsonKey(name: "src") String? src,
  }) = _Image;

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}

@freezed
class MetaDatum with _$MetaDatum {
  const factory MetaDatum({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "key") String? key,
    @JsonKey(name: "value") String? value,
    @JsonKey(name: "display_key") String? displayKey,
    @JsonKey(name: "display_value") String? displayValue,
  }) = _MetaDatum;

  factory MetaDatum.fromJson(Map<String, dynamic> json) =>
      _$MetaDatumFromJson(json);
}

@freezed
class Links with _$Links {
  const factory Links({
    @JsonKey(name: "self") List<Self>? self,
    @JsonKey(name: "collection") List<Collection>? collection,
    @JsonKey(name: "email_templates") List<EmailTemplate>? emailTemplates,
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
class EmailTemplate with _$EmailTemplate {
  const factory EmailTemplate({
    @JsonKey(name: "embeddable") bool? embeddable,
    @JsonKey(name: "href") String? href,
  }) = _EmailTemplate;

  factory EmailTemplate.fromJson(Map<String, dynamic> json) =>
      _$EmailTemplateFromJson(json);
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
class Shipping with _$Shipping {
  const factory Shipping({
    @JsonKey(name: "first_name") String? firstName,
    @JsonKey(name: "last_name") String? lastName,
    @JsonKey(name: "company") String? company,
    @JsonKey(name: "address_1") String? address1,
    @JsonKey(name: "address_2") String? address2,
    @JsonKey(name: "city") String? city,
    @JsonKey(name: "state") String? state,
    @JsonKey(name: "postcode") String? postcode,
    @JsonKey(name: "country") String? country,
    @JsonKey(name: "phone") String? phone,
  }) = _Shipping;

  factory Shipping.fromJson(Map<String, dynamic> json) =>
      _$ShippingFromJson(json);
}

@freezed
class ShippingLine with _$ShippingLine {
  const factory ShippingLine({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "method_title") String? methodTitle,
    @JsonKey(name: "method_id") String? methodId,
    @JsonKey(name: "instance_id") String? instanceId,
    @JsonKey(name: "total") String? total,
    @JsonKey(name: "total_tax") String? totalTax,
    @JsonKey(name: "taxes") List<dynamic>? taxes,
    @JsonKey(name: "tax_status") String? taxStatus,
    @JsonKey(name: "meta_data") List<dynamic>? metaData,
  }) = _ShippingLine;

  factory ShippingLine.fromJson(Map<String, dynamic> json) =>
      _$ShippingLineFromJson(json);
}
