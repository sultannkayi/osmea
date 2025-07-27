// To parse this JSON data, do
//
//     final updateProductReviewResponse = updateProductReviewResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'update_product_review_response.freezed.dart';
part 'update_product_review_response.g.dart';

UpdateProductReviewResponse updateProductReviewResponseFromJson(String str) =>
    UpdateProductReviewResponse.fromJson(json.decode(str));

String updateProductReviewResponseToJson(UpdateProductReviewResponse data) =>
    json.encode(data.toJson());

@freezed
class UpdateProductReviewResponse with _$UpdateProductReviewResponse {
  const factory UpdateProductReviewResponse({
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
    @JsonKey(name: "_links") Links? links,
  }) = _UpdateProductReviewResponse;

  factory UpdateProductReviewResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateProductReviewResponseFromJson(json);
}

@freezed
class Links with _$Links {
  const factory Links({
    @JsonKey(name: "self") List<Self>? self,
    @JsonKey(name: "collection") List<Collection>? collection,
    @JsonKey(name: "up") List<Collection>? up,
  }) = _Links;

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);
}

@freezed
class Collection with _$Collection {
  const factory Collection({
    @JsonKey(name: "href") String? href,
  }) = _Collection;

  factory Collection.fromJson(Map<String, dynamic> json) =>
      _$CollectionFromJson(json);
}

@freezed
class Self with _$Self {
  const factory Self({
    @JsonKey(name: "href") String? href,
    @JsonKey(name: "targetHints") TargetHints? targetHints,
  }) = _Self;

  factory Self.fromJson(Map<String, dynamic> json) => _$SelfFromJson(json);
}

@freezed
class TargetHints with _$TargetHints {
  const factory TargetHints({
    @JsonKey(name: "allow") List<String>? allow,
  }) = _TargetHints;

  factory TargetHints.fromJson(Map<String, dynamic> json) =>
      _$TargetHintsFromJson(json);
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
