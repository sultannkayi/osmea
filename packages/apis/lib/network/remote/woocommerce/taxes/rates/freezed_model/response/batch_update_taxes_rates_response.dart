// To parse this JSON data, do
//
//     final batchUpdateTaxesRatesResponse = batchUpdateTaxesRatesResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'batch_update_taxes_rates_response.freezed.dart';
part 'batch_update_taxes_rates_response.g.dart';

BatchUpdateTaxesRatesResponse batchUpdateTaxesRatesResponseFromJson(String str) => BatchUpdateTaxesRatesResponse.fromJson(json.decode(str));

String batchUpdateTaxesRatesResponseToJson(BatchUpdateTaxesRatesResponse data) => json.encode(data.toJson());

@freezed
class BatchUpdateTaxesRatesResponse with _$BatchUpdateTaxesRatesResponse {
    const factory BatchUpdateTaxesRatesResponse({
        @JsonKey(name: "create")
        List<Create>? create,
        @JsonKey(name: "update")
        List<Delete>? update,
        @JsonKey(name: "delete")
        List<Delete>? delete,
    }) = _BatchUpdateTaxesRatesResponse;

    factory BatchUpdateTaxesRatesResponse.fromJson(Map<String, dynamic> json) => _$BatchUpdateTaxesRatesResponseFromJson(json);
}

@freezed
class Create with _$Create {
    const factory Create({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "country")
        String? country,
        @JsonKey(name: "state")
        String? state,
        @JsonKey(name: "postcode")
        String? postcode,
        @JsonKey(name: "city")
        String? city,
        @JsonKey(name: "rate")
        String? rate,
        @JsonKey(name: "name")
        String? name,
        @JsonKey(name: "priority")
        int? priority,
        @JsonKey(name: "compound")
        bool? compound,
        @JsonKey(name: "shipping")
        bool? shipping,
        @JsonKey(name: "order")
        int? order,
        @JsonKey(name: "class")
        String? createClass,
        @JsonKey(name: "postcodes")
        List<dynamic>? postcodes,
        @JsonKey(name: "cities")
        List<dynamic>? cities,
        @JsonKey(name: "_links")
        Links? links,
    }) = _Create;

    factory Create.fromJson(Map<String, dynamic> json) => _$CreateFromJson(json);
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
