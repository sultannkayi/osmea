import 'package:freezed_annotation/freezed_annotation.dart';

part 'updates_ordering_type_of_products_smart_collection_request.freezed.dart';
part 'updates_ordering_type_of_products_smart_collection_request.g.dart';

@freezed
class UpdateOrderingTypeOfProductsRequest
    with _$UpdateOrderingTypeOfProductsRequest {
  const factory UpdateOrderingTypeOfProductsRequest({
    @JsonKey(name: 'sort_order') required String sortOrder,
    @JsonKey(name: 'products') required List<int> products,
  }) = _UpdateOrderingTypeOfProductsRequest;

  factory UpdateOrderingTypeOfProductsRequest.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateOrderingTypeOfProductsRequestFromJson(json);
}