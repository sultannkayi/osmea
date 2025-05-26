import 'package:apis/apis.dart';
import 'package:apis/dio_config/api_dio_client.dart';
import 'package:apis/network/remote/products/product/abstract/product_service.dart';
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
import 'package:apis/network/remote/products/product/freezed_model/request/update_product_tags_request.dart';
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
import 'package:apis/network/remote/products/product/freezed_model/response/update_product_with_variant_response.dart';
import 'package:apis/network/remote/products/product/freezed_model/response/update_product_reorder_variants_response.dart';
import 'package:apis/network/remote/products/product/freezed_model/response/update_product_tags_response.dart';
import 'package:apis/network/remote/products/product/freezed_model/response/show_hidden_product_response.dart';
import 'package:apis/network/remote/products/product/freezed_model/response/list_of_products_response.dart';
import 'package:apis/network/remote/products/product/freezed_model/response/single_product_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'api_product_service.g.dart';

@RestApi()
@Injectable(as: ProductService)

/// 🌐 ProductService
abstract class ProductServiceClient implements ProductService {
  /// 🏭 Factory for dependency injection
  @factoryMethod
  factory ProductServiceClient(Dio dio) => _ProductServiceClient(
        ApiDioClient.starter(),
        baseUrl: ApiNetwork.baseUrl,
      );

  /// 📋 List all products
  @override
  @GET('/api/{api_version}/products.json')
  Future<ListOfProductsResponse> listProducts({
    @Path('api_version') required String apiVersion,
    @Query('limit') int? limit,
    @Query('ids') String? ids,
    @Query('since_id') String? sinceId,
    @Query('title') String? title,
    @Query('vendor') String? vendor,
    @Query('handle') String? handle,
    @Query('product_type') String? productType,
    @Query('published_status') String? publishedStatus,
    @Query('published_at_min') String? publishedAtMin,
    @Query('published_at_max') String? publishedAtMax,
    @Query('updated_at_min') String? updatedAtMin,
    @Query('updated_at_max') String? updatedAtMax,
    @Query('created_at_min') String? createdAtMin,
    @Query('created_at_max') String? createdAtMax,
    @Query('fields') String? fields,
    @Query('collection_id') String? collectionId,
    @Query('presentment_currencies') String? presentmentCurrencies,
  });

  /// 📄 Get a single product by ID
  @override
  @GET('/api/{api_version}/products/{product_id}.json')
  Future<SingleProductResponse> getProduct({
    @Path('api_version') required String apiVersion,
    @Path('product_id') required String productId,
    @Query('fields') String? fields,
  });

  /// 🔢 Count product collection
  @override
  @GET('/api/{api_version}/products/count.json')
  Future<CountProductsCollectionResponse> countProducts({
    @Path('api_version') required String apiVersion,
    @Query('vendor') String? vendor,
    @Query('product_type') String? productType,
    @Query('collection_id') String? collectionId,
    @Query('created_at_min') String? createdAtMin,
    @Query('created_at_max') String? createdAtMax,
    @Query('updated_at_min') String? updatedAtMin,
    @Query('updated_at_max') String? updatedAtMax,
    @Query('published_at_min') String? publishedAtMin,
    @Query('published_at_max') String? publishedAtMax,
    @Query('published_status') String? publishedStatus,
  });

  /// ➕ Create product with multiple variants and options
  @override
  @POST('/api/{api_version}/products.json')
  Future<CreateProductMultiVariantsOptionsResponse>
      createProductMultiVariantsOptions({
    @Path('api_version') required String apiVersion,
    @Body() required CreateProductMultiVariantsOptionsRequest request,
  });

  /// 🖼️ Create product with base image
  @override
  @POST('/api/{api_version}/products.json')
  Future<CreateProductBaseImageResponse> createProductBaseImage({
    @Path('api_version') required String apiVersion,
    @Body() required CreateProductBaseImageRequest request,
  });

  /// 🔢 Create product with multiple variants
  @override
  @POST('/api/{api_version}/products.json')
  Future<CreateProductMultiVariantsResponse> createProductMultiVariants({
    @Path('api_version') required String apiVersion,
    @Body() required CreateProductMultiVariantsRequest request,
  });

  /// 🏷️ Create product with metafield
  @override
  @POST('/api/{api_version}/products.json')
  Future<CreateProductWithMetafieldResponse> createProductWithMetafield({
    @Path('api_version') required String apiVersion,
    @Body() required CreateProductWithMetafieldRequest request,
  });

  /// 🔧 Create default product variant
  @override
  @POST('/api/{api_version}/products.json')
  Future<CreateDefaultProductVariantResponse> createDefaultProductVariant({
    @Path('api_version') required String apiVersion,
    @Body() required CreateDefaultProductVariantRequest request,
  });

  /// 📥 Create product with downloaded image
  @override
  @POST('/api/{api_version}/products.json')
  Future<CreateProductDownloadedImageResponse> createProductDownloadedImage({
    @Path('api_version') required String apiVersion,
    @Body() required CreateProductDownloadedImageRequest request,
  });

  /// 🚫 Create unpublished product
  @override
  @POST('/api/{api_version}/products.json')
  Future<CreateUnpublishedProductResponse> createUnpublishedProduct({
    @Path('api_version') required String apiVersion,
    @Body() required CreateUnpublishedProductRequest request,
  });

  /// 🏷️ Add metafield to existing product
  @override
  @PUT('/api/{api_version}/products/{product_id}.json')
  Future<AddMetafieldToProductResponse> addMetafieldToProduct({
    @Path('api_version') required String apiVersion,
    @Path('product_id') required String productId,
    @Body() required AddMetafieldToProductRequest request,
  });

  /// 🖼️ Update product add image
  @override
  @PUT('/api/{api_version}/products/{product_id}.json')
  Future<UpdateProductAddImageResponse> updateProductAddImage({
    @Path('api_version') required String apiVersion,
    @Path('product_id') required String productId,
    @Body() required UpdateProductAddImageRequest request,
  });

  /// 🔄 Update product reorder image
  @override
  @PUT('/api/{api_version}/products/{product_id}.json')
  Future<UpdateProductReorderImageResponse> updateProductReorderImage({
    @Path('api_version') required String apiVersion,
    @Path('product_id') required String productId,
    @Body() required UpdateProductReorderImageRequest request,
  });

  /// 📝 Update product title
  @override
  @PUT('/api/{api_version}/products/{product_id}.json')
  Future<UpdateProductTitleResponse> updateProductTitle({
    @Path('api_version') required String apiVersion,
    @Path('product_id') required String productId,
    @Body() required UpdateProductTitleRequest request,
  });

  /// 🗑️ Clear product images
  @override
  @PUT('/api/{api_version}/products/{product_id}.json')
  Future<UpdateProductClearImagesResponse> updateProductClearImages({
    @Path('api_version') required String apiVersion,
    @Path('product_id') required String productId,
    @Body() required UpdateProductClearImagesRequest request,
  });

  /// 🔍 Update product SEO
  @override
  @PUT('/api/{api_version}/products/{product_id}.json')
  Future<UpdateProductSeoResponse> updateProductSeo({
    @Path('api_version') required String apiVersion,
    @Path('product_id') required String productId,
    @Body() required UpdateProductSeoRequest request,
  });

  /// 🔄 Update product with variant
  @override
  @PUT('/api/{api_version}/products/{product_id}.json')
  Future<UpdateProductWithVariantResponse> updateProductWithVariant({
    @Path('api_version') required String apiVersion,
    @Path('product_id') required String productId,
    @Body() required UpdateProductWithVariantRequest request,
  });

  /// 🔄 Update product reorder variants
  @override
  @PUT('/api/{api_version}/products/{product_id}.json')
  Future<UpdateProductReorderVariantsResponse> updateProductReorderVariants({
    @Path('api_version') required String apiVersion,
    @Path('product_id') required String productId,
    @Body() required UpdateProductReorderVariantsRequest request,
  });

  /// 👁️ Show hidden product
  @override
  @PUT('/api/{api_version}/products/{product_id}.json')
  Future<ShowHiddenProductResponse> showHiddenProduct({
    @Path('api_version') required String apiVersion,
    @Path('product_id') required String productId,
    @Body() required ShowHiddenProductRequest request,
  });

  /// 🏷️ Update product tags
  @override
  @PUT('/api/{api_version}/products/{product_id}.json')
  Future<UpdateProductTagsResponse> updateProductTags({
    @Path('api_version') required String apiVersion,
    @Path('product_id') required String productId,
    @Body() required UpdateProductTagsRequest request,
  });

  /// 🗑️ Delete product
  @override
  @DELETE('/api/{api_version}/products/{product_id}.json')
  Future<void> deleteProduct({
    @Path('api_version') required String apiVersion,
    @Path('product_id') required String productId,
  });
}
