// To parse this JSON data, do
//
//     final updateProductReviewRequest = updateProductReviewRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'update_product_review_request.freezed.dart';
part 'update_product_review_request.g.dart';

UpdateProductReviewRequest updateProductReviewRequestFromJson(String str) =>
    UpdateProductReviewRequest.fromJson(json.decode(str));

String updateProductReviewRequestToJson(UpdateProductReviewRequest data) =>
    json.encode(data.toJson());

@freezed
class UpdateProductReviewRequest with _$UpdateProductReviewRequest {
  const factory UpdateProductReviewRequest({
    @JsonKey(name: "review") String? review,
    @JsonKey(name: "reviewer") String? reviewer,
    @JsonKey(name: "reviewer_email") String? reviewerEmail,
    @JsonKey(name: "rating") int? rating,
    @JsonKey(name: "status") String? status,
  }) = _UpdateProductReviewRequest;

  factory UpdateProductReviewRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateProductReviewRequestFromJson(json);
}
