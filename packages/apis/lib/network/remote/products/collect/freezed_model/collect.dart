import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'collect.freezed.dart';
part 'collect.g.dart';

Collect collectFromJson(String str) => Collect.fromJson(json.decode(str));

String collectToJson(Collect data) => json.encode(data.toJson());

/// 🎯 Collect model represents a relationship between a product and a collection
/// A collect is used to add a product to a collection in Shopify
@freezed
class Collect with _$Collect {
    const factory Collect({
        /// The ID of the collect
        @JsonKey(name: "id")
        int? id,
        
        /// The ID of the collection that the product is being added to
        @JsonKey(name: "collection_id")
        int? collectionId,
        
        /// The ID of the product being added to the collection
        @JsonKey(name: "product_id")
        int? productId,
        
        /// The date and time when the collect was created
        @JsonKey(name: "created_at")
        String? createdAt,
        
        /// The date and time when the collect was last updated
        @JsonKey(name: "updated_at")
        String? updatedAt,
        
        /// The position of the product in the collection
        @JsonKey(name: "position")
        int? position,
        
        /// The sort value for the product in the collection
        @JsonKey(name: "sort_value")
        String? sortValue,
    }) = _Collect;

    factory Collect.fromJson(Map<String, dynamic> json) => _$CollectFromJson(json);
}
