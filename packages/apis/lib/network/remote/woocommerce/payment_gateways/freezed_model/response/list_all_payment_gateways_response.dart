// To parse this JSON data, do
//
//     final listAllPaymentGatewaysResponse = listAllPaymentGatewaysResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'list_all_payment_gateways_response.freezed.dart';
part 'list_all_payment_gateways_response.g.dart';

List<ListAllPaymentGatewaysResponse> listAllPaymentGatewaysResponseFromJson(
        String str) =>
    List<ListAllPaymentGatewaysResponse>.from(json
        .decode(str)
        .map((x) => ListAllPaymentGatewaysResponse.fromJson(x)));

String listAllPaymentGatewaysResponseToJson(
        List<ListAllPaymentGatewaysResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class ListAllPaymentGatewaysResponse with _$ListAllPaymentGatewaysResponse {
  const factory ListAllPaymentGatewaysResponse({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "order") int? order,
    @JsonKey(name: "enabled") bool? enabled,
    @JsonKey(name: "method_title") String? methodTitle,
    @JsonKey(name: "method_description") String? methodDescription,
    @JsonKey(name: "method_supports") List<String>? methodSupports,
    @JsonKey(name: "settings") Settings? settings,
    @JsonKey(name: "needs_setup") bool? needsSetup,
    @JsonKey(name: "post_install_scripts") List<dynamic>? postInstallScripts,
    @JsonKey(name: "settings_url") String? settingsUrl,
    @JsonKey(name: "connection_url") dynamic connectionUrl,
    @JsonKey(name: "setup_help_text") dynamic setupHelpText,
    @JsonKey(name: "required_settings_keys")
    List<dynamic>? requiredSettingsKeys,
    @JsonKey(name: "_links") Links? links,
  }) = _ListAllPaymentGatewaysResponse;

  factory ListAllPaymentGatewaysResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAllPaymentGatewaysResponseFromJson(json);
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
class Settings with _$Settings {
  const factory Settings({
    @JsonKey(name: "title") EnableForVirtual? title,
    @JsonKey(name: "instructions") EnableForVirtual? instructions,
    @JsonKey(name: "enable_for_methods") EnableForMethods? enableForMethods,
    @JsonKey(name: "enable_for_virtual") EnableForVirtual? enableForVirtual,
  }) = _Settings;

  factory Settings.fromJson(Map<String, dynamic> json) =>
      _$SettingsFromJson(json);
}

@freezed
class EnableForMethods with _$EnableForMethods {
  const factory EnableForMethods({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "label") String? label,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "type") String? type,
    @JsonKey(name: "value") String? value,
    @JsonKey(name: "default") String? enableForMethodsDefault,
    @JsonKey(name: "tip") String? tip,
    @JsonKey(name: "placeholder") String? placeholder,
    @JsonKey(name: "options") PaymentGatewayOptions? options,
  }) = _EnableForMethods;

  factory EnableForMethods.fromJson(Map<String, dynamic> json) =>
      _$EnableForMethodsFromJson(json);
}

@freezed
class PaymentGatewayOptions with _$PaymentGatewayOptions {
  const factory PaymentGatewayOptions({
    @JsonKey(name: "Fixed Price") FixedPrice? fixedPrice,
    @JsonKey(name: "Free Shipping") FreeShipping? freeShipping,
    @JsonKey(name: "Store Pickup") StorePickup? storePickup,
  }) = _PaymentGatewayOptions;

  factory PaymentGatewayOptions.fromJson(Map<String, dynamic> json) =>
      _$PaymentGatewayOptionsFromJson(json);
}

@freezed
class FreeShipping with _$FreeShipping {
  const factory FreeShipping({
    @JsonKey(name: "free_shipping") String? freeShipping,
    @JsonKey(name: "free_shipping:1") String? freeShipping1,
  }) = _FreeShipping;

  factory FreeShipping.fromJson(Map<String, dynamic> json) =>
      _$FreeShippingFromJson(json);
}

@freezed
class StorePickup with _$StorePickup {
  const factory StorePickup({
    @JsonKey(name: "pickup_location") String? pickupLocation,
  }) = _StorePickup;

  factory StorePickup.fromJson(Map<String, dynamic> json) =>
      _$StorePickupFromJson(json);
}

@freezed
class FixedPrice with _$FixedPrice {
  const factory FixedPrice({
    @JsonKey(name: "flat_rate") String? flatRate,
    @JsonKey(name: "flat_rate:2") String? flatRate2,
  }) = _FixedPrice;

  factory FixedPrice.fromJson(Map<String, dynamic> json) =>
      _$FixedPriceFromJson(json);
}

@freezed
class EnableForVirtual with _$EnableForVirtual {
  const factory EnableForVirtual({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "label") String? label,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "type") String? type,
    @JsonKey(name: "value") String? value,
    @JsonKey(name: "default") String? enableForVirtualDefault,
    @JsonKey(name: "tip") String? tip,
    @JsonKey(name: "placeholder") String? placeholder,
  }) = _EnableForVirtual;

  factory EnableForVirtual.fromJson(Map<String, dynamic> json) =>
      _$EnableForVirtualFromJson(json);
}
