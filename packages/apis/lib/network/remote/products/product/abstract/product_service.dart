import 'package:apis/network/remote/products/product/freezed_model/request/create_product_base_image_request.dart';
import 'package:apis/network/remote/products/product/freezed_model/request/create_product_multi_variants_options_request.dart';
import 'package:apis/network/remote/products/product/freezed_model/request/create_product_multi_variants_request.dart';
import 'package:apis/network/remote/products/product/freezed_model/request/create_product_with_metafield_request.dart';
import 'package:apis/network/remote/products/product/freezed_model/request/create_default_product_variant_request.dart';
import 'package:apis/network/remote/products/product/freezed_model/request/create_product_downloaded_image_request.dart';
import 'package:apis/network/remote/products/product/freezed_model/request/create_unpublished_product_request.dart';
import 'package:apis/network/remote/products/product/freezed_model/request/add_metafield_to_product_request.dart';
import 'package:apis/network/remote/products/product/freezed_model/request/update_product_add_image_request.dart';
import 'package:apis/network/remote/products/product/freezed_model/request/update_product_reorder_image_request.dart';
import 'package:apis/network/remote/products/product/freezed_model/request/update_product_title_request.dart';
import 'package:apis/network/remote/products/product/freezed_model/request/update_product_clear_images_request.dart';
import 'package:apis/network/remote/products/product/freezed_model/request/update_product_seo_request.dart';
import 'package:apis/network/remote/products/product/freezed_model/request/update_product_with_variant_request.dart';
import 'package:apis/network/remote/products/product/freezed_model/request/update_product_reorder_variants_request.dart';
import 'package:apis/network/remote/products/product/freezed_model/request/show_hidden_product_request.dart';
import 'package:apis/network/remote/products/product/freezed_model/response/count_products_collection_response.dart';
import 'package:apis/network/remote/products/product/freezed_model/response/create_product_base_image_response.dart';
import 'package:apis/network/remote/products/product/freezed_model/response/create_product_multi_variants_options_response.dart';
import 'package:apis/network/remote/products/product/freezed_model/response/create_product_multi_variants_response.dart';
import 'package:apis/network/remote/products/product/freezed_model/response/create_product_with_metafield_response.dart';
import 'package:apis/network/remote/products/product/freezed_model/response/create_default_product_variant_response.dart';
import 'package:apis/network/remote/products/product/freezed_model/response/create_product_downloaded_image_response.dart';
import 'package:apis/network/remote/products/product/freezed_model/response/create_unpublished_product_response.dart';
import 'package:apis/network/remote/products/product/freezed_model/response/add_metafield_to_product_response.dart';
import 'package:apis/network/remote/products/product/freezed_model/response/update_product_add_image_response.dart';
import 'package:apis/network/remote/products/product/freezed_model/response/update_product_reorder_image_response.dart';
import 'package:apis/network/remote/products/product/freezed_model/response/update_product_title_response.dart';
import 'package:apis/network/remote/products/product/freezed_model/response/update_product_clear_images_response.dart';
import 'package:apis/network/remote/products/product/freezed_model/response/update_product_seo_response.dart';
import 'package:apis/network/remote/products/product/freezed_model/response/list_of_products_response.dart';
import 'package:apis/network/remote/products/product/freezed_model/response/single_product_response.dart';
import 'package:apis/network/remote/products/product/freezed_model/response/update_product_with_variant_response.dart';
import 'package:apis/network/remote/products/product/freezed_model/response/update_product_reorder_variants_response.dart';
import 'package:apis/network/remote/products/product/freezed_model/response/show_hidden_product_response.dart';

/// 📦 Abstract Product Service
/// Defines the contract for all product-related API operations
abstract class ProductService {
  /// 📋 List all products
  Future<ListOfProductsResponse> listProducts({
    required String apiVersion,
    int? limit,
    String? ids,
    String? sinceId,
    String? title,
    String? vendor,
    String? handle,
    String? productType,
    String? publishedStatus,
    String? publishedAtMin,
    String? publishedAtMax,
    String? updatedAtMin,
    String? updatedAtMax,
    String? createdAtMin,
    String? createdAtMax,
    String? fields,
    String? collectionId,
    String? presentmentCurrencies,
  });

  /// 📄 Get a single product by ID
  Future<SingleProductResponse> getProduct({
    required String apiVersion,
    required String productId,
    String? fields,
  });

  /// 🔢 Count product collection
  Future<CountProductsCollectionResponse> countProducts({
    required String apiVersion,
    String? vendor,
    String? productType,
    String? collectionId,
    String? createdAtMin,
    String? createdAtMax,
    String? updatedAtMin,
    String? updatedAtMax,
    String? publishedAtMin,
    String? publishedAtMax,
    String? publishedStatus,
  });

  /// ➕ Create product with multiple variants and options
  Future<CreateProductMultiVariantsOptionsResponse>
      createProductMultiVariantsOptions({
    required String apiVersion,
    required CreateProductMultiVariantsOptionsRequest request,
  });

  /// 🖼️ Create product with base image
  Future<CreateProductBaseImageResponse> createProductBaseImage({
    required String apiVersion,
    required CreateProductBaseImageRequest request,
  });

  /// 🔢 Create product with multiple variants
  Future<CreateProductMultiVariantsResponse> createProductMultiVariants({
    required String apiVersion,
    required CreateProductMultiVariantsRequest request,
  });

  /// 🏷️ Create product with metafield
  Future<CreateProductWithMetafieldResponse> createProductWithMetafield({
    required String apiVersion,
    required CreateProductWithMetafieldRequest request,
  });

  /// ➕ Create product with default variant
  Future<CreateDefaultProductVariantResponse> createDefaultProductVariant({
    required String apiVersion,
    required CreateDefaultProductVariantRequest request,
  });

  /// 📥 Create product with downloaded image
  Future<CreateProductDownloadedImageResponse> createProductDownloadedImage({
    required String apiVersion,
    required CreateProductDownloadedImageRequest request,
  });

  /// 🚫 Create unpublished product
  Future<CreateUnpublishedProductResponse> createUnpublishedProduct({
    required String apiVersion,
    required CreateUnpublishedProductRequest request,
  });

  /// 🏷️ Add metafield to existing product
  Future<AddMetafieldToProductResponse> addMetafieldToProduct({
    required String apiVersion,
    required String productId,
    required AddMetafieldToProductRequest request,
  });

  /// 🖼️ Update product add image
  Future<UpdateProductAddImageResponse> updateProductAddImage({
    required String apiVersion,
    required String productId,
    required UpdateProductAddImageRequest request,
  });

  /// 🔄 Update product reorder image
  Future<UpdateProductReorderImageResponse> updateProductReorderImage({
    required String apiVersion,
    required String productId,
    required UpdateProductReorderImageRequest request,
  });

  /// 📝 Update product title
  Future<UpdateProductTitleResponse> updateProductTitle({
    required String apiVersion,
    required String productId,
    required UpdateProductTitleRequest request,
  });

  /// 🗑️ Clear product images
  Future<UpdateProductClearImagesResponse> updateProductClearImages({
    required String apiVersion,
    required String productId,
    required UpdateProductClearImagesRequest request,
  });

  /// 🔍 Update product SEO
  Future<UpdateProductSeoResponse> updateProductSeo({
    required String apiVersion,
    required String productId,
    required UpdateProductSeoRequest request,
  });

  /// 🔄 Update product with variant
  Future<UpdateProductWithVariantResponse> updateProductWithVariant({
    required String apiVersion,
    required String productId,
    required UpdateProductWithVariantRequest request,
  });

  /// 🔄 Update product reorder variants
  Future<UpdateProductReorderVariantsResponse> updateProductReorderVariants({
    required String apiVersion,
    required String productId,
    required UpdateProductReorderVariantsRequest request,
  });

  /// 👁️ Show hidden product
  Future<ShowHiddenProductResponse> showHiddenProduct({
    required String apiVersion,
    required String productId,
    required ShowHiddenProductRequest request,
  });
}
