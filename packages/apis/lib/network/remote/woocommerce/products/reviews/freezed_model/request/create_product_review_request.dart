// To parse this JSON data, do
//
//     final createProductReviewRequest = createProductReviewRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'create_product_review_request.freezed.dart';
part 'create_product_review_request.g.dart';

CreateProductReviewRequest createProductReviewRequestFromJson(String str) =>
    CreateProductReviewRequest.fromJson(json.decode(str));

String createProductReviewRequestToJson(CreateProductReviewRequest data) =>
    json.encode(data.toJson());

@freezed
class CreateProductReviewRequest with _$CreateProductReviewRequest {
  const factory CreateProductReviewRequest({
    @JsonKey(name: "product_id") int? productId,
    @JsonKey(name: "review") String? review,
    @JsonKey(name: "reviewer") String? reviewer,
    @JsonKey(name: "reviewer_email") String? reviewerEmail,
    @JsonKey(name: "rating") int? rating,
    @JsonKey(name: "status") String? status,
  }) = _CreateProductReviewRequest;

  factory CreateProductReviewRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateProductReviewRequestFromJson(json);
}
