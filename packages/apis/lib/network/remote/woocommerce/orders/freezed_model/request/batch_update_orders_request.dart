// To parse this JSON data, do
//
//     final batchUpdateOrdersRequest = batchUpdateOrdersRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'batch_update_orders_request.freezed.dart';
part 'batch_update_orders_request.g.dart';

BatchUpdateOrdersRequest batchUpdateOrdersRequestFromJson(String str) => BatchUpdateOrdersRequest.fromJson(json.decode(str));

String batchUpdateOrdersRequestToJson(BatchUpdateOrdersRequest data) => json.encode(data.toJson());

@freezed
class BatchUpdateOrdersRequest with _$BatchUpdateOrdersRequest {
    const factory BatchUpdateOrdersRequest({
        @JsonKey(name: "create")
        List<Create>? create,
        @JsonKey(name: "update")
        List<Update>? update,
        @JsonKey(name: "delete")
        List<int>? delete,
    }) = _BatchUpdateOrdersRequest;

    factory BatchUpdateOrdersRequest.fromJson(Map<String, dynamic> json) => _$BatchUpdateOrdersRequestFromJson(json);
}

@freezed
class Create with _$Create {
    const factory Create({
        @JsonKey(name: "status")
        String? status,
        @JsonKey(name: "currency")
        String? currency,
        @JsonKey(name: "billing")
        Billing? billing,
        @JsonKey(name: "shipping")
        Shipping? shipping,
        @JsonKey(name: "line_items")
        List<LineItem>? lineItems,
        @JsonKey(name: "shipping_lines")
        List<ShippingLine>? shippingLines,
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
        @JsonKey(name: "address_1")
        String? address1,
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
        @JsonKey(name: "product_id")
        int? productId,
        @JsonKey(name: "quantity")
        int? quantity,
        @JsonKey(name: "variation_id")
        int? variationId,
    }) = _LineItem;

    factory LineItem.fromJson(Map<String, dynamic> json) => _$LineItemFromJson(json);
}

@freezed
class Shipping with _$Shipping {
    const factory Shipping({
        @JsonKey(name: "first_name")
        String? firstName,
        @JsonKey(name: "last_name")
        String? lastName,
        @JsonKey(name: "address_1")
        String? address1,
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
class ShippingLine with _$ShippingLine {
    const factory ShippingLine({
        @JsonKey(name: "method_id")
        String? methodId,
        @JsonKey(name: "method_title")
        String? methodTitle,
        @JsonKey(name: "total")
        String? total,
    }) = _ShippingLine;

    factory ShippingLine.fromJson(Map<String, dynamic> json) => _$ShippingLineFromJson(json);
}

@freezed
class Update with _$Update {
    const factory Update({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "status")
        String? status,
        @JsonKey(name: "billing")
        Billing? billing,
        @JsonKey(name: "shipping")
        Shipping? shipping,
        @JsonKey(name: "line_items")
        List<LineItem>? lineItems,
    }) = _Update;

    factory Update.fromJson(Map<String, dynamic> json) => _$UpdateFromJson(json);
}
