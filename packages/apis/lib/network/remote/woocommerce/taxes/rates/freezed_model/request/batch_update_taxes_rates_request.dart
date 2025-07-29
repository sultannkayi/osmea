// To parse this JSON data, do
//
//     final batchUpdateTaxesRatesRequest = batchUpdateTaxesRatesRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'batch_update_taxes_rates_request.freezed.dart';
part 'batch_update_taxes_rates_request.g.dart';

BatchUpdateTaxesRatesRequest batchUpdateTaxesRatesRequestFromJson(String str) => BatchUpdateTaxesRatesRequest.fromJson(json.decode(str));

String batchUpdateTaxesRatesRequestToJson(BatchUpdateTaxesRatesRequest data) => json.encode(data.toJson());

@freezed
class BatchUpdateTaxesRatesRequest with _$BatchUpdateTaxesRatesRequest {
    const factory BatchUpdateTaxesRatesRequest({
        @JsonKey(name: "update")
        List<Update>? update,
        @JsonKey(name: "delete")
        List<int>? delete,
        @JsonKey(name: "create")
        List<Create>? create,
    }) = _BatchUpdateTaxesRatesRequest;

    factory BatchUpdateTaxesRatesRequest.fromJson(Map<String, dynamic> json) => _$BatchUpdateTaxesRatesRequestFromJson(json);
}

@freezed
class Create with _$Create {
    const factory Create({
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
    }) = _Create;

    factory Create.fromJson(Map<String, dynamic> json) => _$CreateFromJson(json);
}

@freezed
class Update with _$Update {
    const factory Update({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "rate")
        String? rate,
        @JsonKey(name: "name")
        String? name,
        @JsonKey(name: "shipping")
        bool? shipping,
    }) = _Update;

    factory Update.fromJson(Map<String, dynamic> json) => _$UpdateFromJson(json);
}
