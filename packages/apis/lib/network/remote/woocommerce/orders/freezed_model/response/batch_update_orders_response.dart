// To parse this JSON data, do
//
//     final batchUpdateOrdersResponse = batchUpdateOrdersResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'batch_update_orders_response.freezed.dart';
part 'batch_update_orders_response.g.dart';

BatchUpdateOrdersResponse batchUpdateOrdersResponseFromJson(String str) => BatchUpdateOrdersResponse.fromJson(json.decode(str));

String batchUpdateOrdersResponseToJson(BatchUpdateOrdersResponse data) => json.encode(data.toJson());

@freezed
class BatchUpdateOrdersResponse with _$BatchUpdateOrdersResponse {
    const factory BatchUpdateOrdersResponse({
        @JsonKey(name: "create")
        List<Create>? create,
        @JsonKey(name: "update")
        List<Delete>? update,
        @JsonKey(name: "delete")
        List<Delete>? delete,
    }) = _BatchUpdateOrdersResponse;

    factory BatchUpdateOrdersResponse.fromJson(Map<String, dynamic> json) => _$BatchUpdateOrdersResponseFromJson(json);
}

@freezed
class Create with _$Create {
    const factory Create({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "parent_id")
        int? parentId,
        @JsonKey(name: "status")
        String? status,
        @JsonKey(name: "currency")
        String? currency,
        @JsonKey(name: "version")
        String? version,
        @JsonKey(name: "prices_include_tax")
        bool? pricesIncludeTax,
        @JsonKey(name: "date_created")
        String? dateCreated,
        @JsonKey(name: "date_modified")
        String? dateModified,
        @JsonKey(name: "discount_total")
        String? discountTotal,
        @JsonKey(name: "discount_tax")
        String? discountTax,
        @JsonKey(name: "shipping_total")
        String? shippingTotal,
        @JsonKey(name: "shipping_tax")
        String? shippingTax,
        @JsonKey(name: "cart_tax")
        String? cartTax,
        @JsonKey(name: "total")
        String? total,
        @JsonKey(name: "total_tax")
        String? totalTax,
        @JsonKey(name: "customer_id")
        int? customerId,
        @JsonKey(name: "order_key")
        String? orderKey,
        @JsonKey(name: "billing")
        Billing? billing,
        @JsonKey(name: "shipping")
        Shipping? shipping,
        @JsonKey(name: "payment_method")
        String? paymentMethod,
        @JsonKey(name: "payment_method_title")
        String? paymentMethodTitle,
        @JsonKey(name: "transaction_id")
        String? transactionId,
        @JsonKey(name: "customer_ip_address")
        String? customerIpAddress,
        @JsonKey(name: "customer_user_agent")
        String? customerUserAgent,
        @JsonKey(name: "created_via")
        String? createdVia,
        @JsonKey(name: "customer_note")
        String? customerNote,
        @JsonKey(name: "date_completed")
        dynamic dateCompleted,
        @JsonKey(name: "date_paid")
        dynamic datePaid,
        @JsonKey(name: "cart_hash")
        String? cartHash,
        @JsonKey(name: "number")
        String? number,
        @JsonKey(name: "meta_data")
        List<dynamic>? metaData,
        @JsonKey(name: "line_items")
        List<LineItem>? lineItems,
        @JsonKey(name: "tax_lines")
        List<TaxLine>? taxLines,
        @JsonKey(name: "shipping_lines")
        List<ShippingLine>? shippingLines,
        @JsonKey(name: "fee_lines")
        List<dynamic>? feeLines,
        @JsonKey(name: "coupon_lines")
        List<dynamic>? couponLines,
        @JsonKey(name: "refunds")
        List<dynamic>? refunds,
        @JsonKey(name: "payment_url")
        String? paymentUrl,
        @JsonKey(name: "is_editable")
        bool? isEditable,
        @JsonKey(name: "needs_payment")
        bool? needsPayment,
        @JsonKey(name: "needs_processing")
        bool? needsProcessing,
        @JsonKey(name: "date_created_gmt")
        String? dateCreatedGmt,
        @JsonKey(name: "date_modified_gmt")
        String? dateModifiedGmt,
        @JsonKey(name: "date_completed_gmt")
        dynamic dateCompletedGmt,
        @JsonKey(name: "date_paid_gmt")
        dynamic datePaidGmt,
        @JsonKey(name: "currency_symbol")
        String? currencySymbol,
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
class LineItem with _$LineItem {
    const factory LineItem({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "name")
        String? name,
        @JsonKey(name: "product_id")
        int? productId,
        @JsonKey(name: "variation_id")
        int? variationId,
        @JsonKey(name: "quantity")
        int? quantity,
        @JsonKey(name: "tax_class")
        String? taxClass,
        @JsonKey(name: "subtotal")
        String? subtotal,
        @JsonKey(name: "subtotal_tax")
        String? subtotalTax,
        @JsonKey(name: "total")
        String? total,
        @JsonKey(name: "total_tax")
        String? totalTax,
        @JsonKey(name: "taxes")
        List<Tax>? taxes,
        @JsonKey(name: "meta_data")
        List<dynamic>? metaData,
        @JsonKey(name: "sku")
        dynamic sku,
        @JsonKey(name: "price")
        int? price,
        @JsonKey(name: "image")
        Image? image,
        @JsonKey(name: "parent_name")
        dynamic parentName,
    }) = _LineItem;

    factory LineItem.fromJson(Map<String, dynamic> json) => _$LineItemFromJson(json);
}

@freezed
class Image with _$Image {
    const factory Image({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "src")
        String? src,
    }) = _Image;

    factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}

@freezed
class Tax with _$Tax {
    const factory Tax({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "total")
        String? total,
        @JsonKey(name: "subtotal")
        String? subtotal,
    }) = _Tax;

    factory Tax.fromJson(Map<String, dynamic> json) => _$TaxFromJson(json);
}

@freezed
class Links with _$Links {
    const factory Links({
        @JsonKey(name: "self")
        List<Self>? self,
        @JsonKey(name: "collection")
        List<Collection>? collection,
        @JsonKey(name: "email_templates")
        List<EmailTemplate>? emailTemplates,
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
class EmailTemplate with _$EmailTemplate {
    const factory EmailTemplate({
        @JsonKey(name: "embeddable")
        bool? embeddable,
        @JsonKey(name: "href")
        String? href,
    }) = _EmailTemplate;

    factory EmailTemplate.fromJson(Map<String, dynamic> json) => _$EmailTemplateFromJson(json);
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
        @JsonKey(name: "phone")
        String? phone,
    }) = _Shipping;

    factory Shipping.fromJson(Map<String, dynamic> json) => _$ShippingFromJson(json);
}

@freezed
class ShippingLine with _$ShippingLine {
    const factory ShippingLine({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "method_title")
        String? methodTitle,
        @JsonKey(name: "method_id")
        String? methodId,
        @JsonKey(name: "instance_id")
        String? instanceId,
        @JsonKey(name: "total")
        String? total,
        @JsonKey(name: "total_tax")
        String? totalTax,
        @JsonKey(name: "taxes")
        List<dynamic>? taxes,
        @JsonKey(name: "tax_status")
        String? taxStatus,
        @JsonKey(name: "meta_data")
        List<dynamic>? metaData,
    }) = _ShippingLine;

    factory ShippingLine.fromJson(Map<String, dynamic> json) => _$ShippingLineFromJson(json);
}

@freezed
class TaxLine with _$TaxLine {
    const factory TaxLine({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "rate_code")
        String? rateCode,
        @JsonKey(name: "rate_id")
        int? rateId,
        @JsonKey(name: "label")
        String? label,
        @JsonKey(name: "compound")
        bool? compound,
        @JsonKey(name: "tax_total")
        String? taxTotal,
        @JsonKey(name: "shipping_tax_total")
        String? shippingTaxTotal,
        @JsonKey(name: "rate_percent")
        int? ratePercent,
        @JsonKey(name: "meta_data")
        List<dynamic>? metaData,
    }) = _TaxLine;

    factory TaxLine.fromJson(Map<String, dynamic> json) => _$TaxLineFromJson(json);
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
