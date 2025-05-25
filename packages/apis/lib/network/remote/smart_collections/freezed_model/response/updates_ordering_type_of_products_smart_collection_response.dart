// To parse this JSON data, do
//
//     final updatesOrderingTypeOfProductsSmartCollection = updatesOrderingTypeOfProductsSmartCollectionFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'updates_ordering_type_of_products_smart_collection_response.freezed.dart';
part 'updates_ordering_type_of_products_smart_collection_response.g.dart';

UpdatesOrderingTypeOfProductsSmartCollection
    updatesOrderingTypeOfProductsSmartCollectionFromJson(String str) =>
        UpdatesOrderingTypeOfProductsSmartCollection.fromJson(json.decode(str));

String updatesOrderingTypeOfProductsSmartCollectionToJson(
        UpdatesOrderingTypeOfProductsSmartCollection data) =>
    json.encode(data.toJson());

@freezed
class UpdatesOrderingTypeOfProductsSmartCollection
    with _$UpdatesOrderingTypeOfProductsSmartCollection {
  const factory UpdatesOrderingTypeOfProductsSmartCollection() =
      _UpdatesOrderingTypeOfProductsSmartCollection;

  factory UpdatesOrderingTypeOfProductsSmartCollection.fromJson(
          Map<String, dynamic> json) =>
      _$UpdatesOrderingTypeOfProductsSmartCollectionFromJson(json);
}