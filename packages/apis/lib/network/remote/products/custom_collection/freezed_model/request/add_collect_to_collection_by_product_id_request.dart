// To parse this JSON data, do
//
//     final addCollectToCollectionByProductIdRequest = addCollectToCollectionByProductIdRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'add_collect_to_collection_by_product_id_request.freezed.dart';
part 'add_collect_to_collection_by_product_id_request.g.dart';

AddCollectToCollectionByProductIdRequest addCollectToCollectionByProductIdRequestFromJson(String str) => AddCollectToCollectionByProductIdRequest.fromJson(json.decode(str));

String addCollectToCollectionByProductIdRequestToJson(AddCollectToCollectionByProductIdRequest data) => json.encode(data.toJson());

@freezed
class AddCollectToCollectionByProductIdRequest with _$AddCollectToCollectionByProductIdRequest {
    const factory AddCollectToCollectionByProductIdRequest({
        @JsonKey(name: "custom_collection")
        CustomCollection? customCollection,
    }) = _AddCollectToCollectionByProductIdRequest;

    factory AddCollectToCollectionByProductIdRequest.fromJson(Map<String, dynamic> json) => _$AddCollectToCollectionByProductIdRequestFromJson(json);
}

@freezed
class CustomCollection with _$CustomCollection {
    const factory CustomCollection({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "collects")
        List<Collect>? collects,
    }) = _CustomCollection;

    factory CustomCollection.fromJson(Map<String, dynamic> json) => _$CustomCollectionFromJson(json);
}

@freezed
class Collect with _$Collect {
    const factory Collect({
        @JsonKey(name: "product_id")
        int? productId,
        @JsonKey(name: "position")
        int? position,
    }) = _Collect;

    factory Collect.fromJson(Map<String, dynamic> json) => _$CollectFromJson(json);
}
