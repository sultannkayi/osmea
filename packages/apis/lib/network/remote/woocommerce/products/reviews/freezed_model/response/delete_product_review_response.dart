// To parse this JSON data, do
//
//     final deleteProductReviewResponse = deleteProductReviewResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'delete_product_review_response.freezed.dart';
part 'delete_product_review_response.g.dart';

DeleteProductReviewResponse deleteProductReviewResponseFromJson(String str) =>
    DeleteProductReviewResponse.fromJson(json.decode(str));

String deleteProductReviewResponseToJson(DeleteProductReviewResponse data) =>
    json.encode(data.toJson());

@freezed
class DeleteProductReviewResponse with _$DeleteProductReviewResponse {
  const factory DeleteProductReviewResponse({
    @JsonKey(name: "deleted") bool? deleted,
    @JsonKey(name: "previous") Previous? previous,
  }) = _DeleteProductReviewResponse;

  factory DeleteProductReviewResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteProductReviewResponseFromJson(json);
}

@freezed
class Previous with _$Previous {
  const factory Previous({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "date_created") String? dateCreated,
    @JsonKey(name: "date_created_gmt") String? dateCreatedGmt,
    @JsonKey(name: "product_id") int? productId,
    @JsonKey(name: "product_name") String? productName,
    @JsonKey(name: "product_permalink") String? productPermalink,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "reviewer") String? reviewer,
    @JsonKey(name: "reviewer_email") String? reviewerEmail,
    @JsonKey(name: "review") String? review,
    @JsonKey(name: "rating") int? rating,
    @JsonKey(name: "verified") bool? verified,
    @JsonKey(name: "reviewer_avatar_urls")
    ReviewerAvatarUrls? reviewerAvatarUrls,
  }) = _Previous;

  factory Previous.fromJson(Map<String, dynamic> json) =>
      _$PreviousFromJson(json);
}

@freezed
class ReviewerAvatarUrls with _$ReviewerAvatarUrls {
  const factory ReviewerAvatarUrls({
    @JsonKey(name: "24") String? the24,
    @JsonKey(name: "48") String? the48,
    @JsonKey(name: "96") String? the96,
  }) = _ReviewerAvatarUrls;

  factory ReviewerAvatarUrls.fromJson(Map<String, dynamic> json) =>
      _$ReviewerAvatarUrlsFromJson(json);
}
