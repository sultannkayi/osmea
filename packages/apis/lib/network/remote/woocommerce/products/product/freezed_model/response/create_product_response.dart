// To parse this JSON data, do
//
//     final createProductResponse = createProductResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'create_product_response.freezed.dart';
part 'create_product_response.g.dart';

CreateProductResponse createProductResponseFromJson(String str) =>
    CreateProductResponse.fromJson(json.decode(str));

String createProductResponseToJson(CreateProductResponse data) =>
    json.encode(data.toJson());

@freezed
class CreateProductResponse with _$CreateProductResponse {
  const factory CreateProductResponse({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "slug") String? slug,
    @JsonKey(name: "permalink") String? permalink,
    @JsonKey(name: "date_created") String? dateCreated,
    @JsonKey(name: "date_created_gmt") String? dateCreatedGmt,
    @JsonKey(name: "date_modified") String? dateModified,
    @JsonKey(name: "date_modified_gmt") String? dateModifiedGmt,
    @JsonKey(name: "type") String? type,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "featured") bool? featured,
    @JsonKey(name: "catalog_visibility") String? catalogVisibility,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "short_description") String? shortDescription,
    @JsonKey(name: "sku") String? sku,
    @JsonKey(name: "price") String? price,
    @JsonKey(name: "regular_price") String? regularPrice,
    @JsonKey(name: "sale_price") String? salePrice,
    @JsonKey(name: "date_on_sale_from") dynamic dateOnSaleFrom,
    @JsonKey(name: "date_on_sale_from_gmt") dynamic dateOnSaleFromGmt,
    @JsonKey(name: "date_on_sale_to") dynamic dateOnSaleTo,
    @JsonKey(name: "date_on_sale_to_gmt") dynamic dateOnSaleToGmt,
    @JsonKey(name: "on_sale") bool? onSale,
    @JsonKey(name: "purchasable") bool? purchasable,
    @JsonKey(name: "total_sales") int? totalSales,
    @JsonKey(name: "virtual") bool? virtual,
    @JsonKey(name: "downloadable") bool? downloadable,
    @JsonKey(name: "downloads") List<dynamic>? downloads,
    @JsonKey(name: "download_limit") int? downloadLimit,
    @JsonKey(name: "download_expiry") int? downloadExpiry,
    @JsonKey(name: "external_url") String? externalUrl,
    @JsonKey(name: "button_text") String? buttonText,
    @JsonKey(name: "tax_status") String? taxStatus,
    @JsonKey(name: "tax_class") String? taxClass,
    @JsonKey(name: "manage_stock") bool? manageStock,
    @JsonKey(name: "stock_quantity") dynamic stockQuantity,
    @JsonKey(name: "backorders") String? backorders,
    @JsonKey(name: "backorders_allowed") bool? backordersAllowed,
    @JsonKey(name: "backordered") bool? backordered,
    @JsonKey(name: "low_stock_amount") dynamic lowStockAmount,
    @JsonKey(name: "sold_individually") bool? soldIndividually,
    @JsonKey(name: "weight") String? weight,
    @JsonKey(name: "dimensions") Dimensions? dimensions,
    @JsonKey(name: "shipping_required") bool? shippingRequired,
    @JsonKey(name: "shipping_taxable") bool? shippingTaxable,
    @JsonKey(name: "shipping_class") String? shippingClass,
    @JsonKey(name: "shipping_class_id") int? shippingClassId,
    @JsonKey(name: "reviews_allowed") bool? reviewsAllowed,
    @JsonKey(name: "average_rating") String? averageRating,
    @JsonKey(name: "rating_count") int? ratingCount,
    @JsonKey(name: "upsell_ids") List<dynamic>? upsellIds,
    @JsonKey(name: "cross_sell_ids") List<dynamic>? crossSellIds,
    @JsonKey(name: "parent_id") int? parentId,
    @JsonKey(name: "purchase_note") String? purchaseNote,
    @JsonKey(name: "categories") List<Category>? categories,
    @JsonKey(name: "brands") List<dynamic>? brands,
    @JsonKey(name: "tags") List<dynamic>? tags,
    @JsonKey(name: "images") List<dynamic>? images,
    @JsonKey(name: "attributes") List<dynamic>? attributes,
    @JsonKey(name: "default_attributes") List<dynamic>? defaultAttributes,
    @JsonKey(name: "variations") List<dynamic>? variations,
    @JsonKey(name: "grouped_products") List<dynamic>? groupedProducts,
    @JsonKey(name: "menu_order") int? menuOrder,
    @JsonKey(name: "price_html") String? priceHtml,
    @JsonKey(name: "related_ids") List<int>? relatedIds,
    @JsonKey(name: "meta_data") List<dynamic>? metaData,
    @JsonKey(name: "stock_status") String? stockStatus,
    @JsonKey(name: "has_options") bool? hasOptions,
    @JsonKey(name: "post_password") String? postPassword,
    @JsonKey(name: "global_unique_id") String? globalUniqueId,
    @JsonKey(name: "permalink_template") String? permalinkTemplate,
    @JsonKey(name: "generated_slug") String? generatedSlug,
    @JsonKey(name: "_links") Links? links,
  }) = _CreateProductResponse;

  factory CreateProductResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateProductResponseFromJson(json);
}

@freezed
class Category with _$Category {
  const factory Category({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "slug") String? slug,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

@freezed
class Dimensions with _$Dimensions {
  const factory Dimensions({
    @JsonKey(name: "length") String? length,
    @JsonKey(name: "width") String? width,
    @JsonKey(name: "height") String? height,
  }) = _Dimensions;

  factory Dimensions.fromJson(Map<String, dynamic> json) =>
      _$DimensionsFromJson(json);
}

@freezed
class Links with _$Links {
  const factory Links({
    @JsonKey(name: "self") List<Self>? self,
    @JsonKey(name: "collection") List<Collection>? collection,
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
