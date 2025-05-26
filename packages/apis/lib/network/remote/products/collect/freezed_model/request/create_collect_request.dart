import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_collect_request.freezed.dart';
part 'create_collect_request.g.dart';

/// 📦 Create Collect Request Model
/// Used to create a new collect (product-collection association)
@freezed
class CreateCollectRequest with _$CreateCollectRequest {
  const factory CreateCollectRequest({
    required CollectToCreate collect,
  }) = _CreateCollectRequest;

  factory CreateCollectRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateCollectRequestFromJson(json);
}

@freezed
class CollectToCreate with _$CollectToCreate {
  const factory CollectToCreate({
    /// Product ID to associate with the collection
    @JsonKey(name: 'product_id') required int productId,
    
    /// Collection ID to associate with the product  
    @JsonKey(name: 'collection_id') required int collectionId,
    
    /// Position of the collect within the collection (optional)
    int? position,
    
    /// Sort value for the collect (optional)
    @JsonKey(name: 'sort_value') String? sortValue,
  }) = _CollectToCreate;

  factory CollectToCreate.fromJson(Map<String, dynamic> json) =>
      _$CollectToCreateFromJson(json);
}
