import 'package:apis/network/remote/products/product/freezed_model/request/create_product_base_image_request.dart';
import 'package:apis/network/remote/products/product/freezed_model/request/create_product_multi_variants_options_request.dart';
import 'package:apis/network/remote/products/product/freezed_model/response/count_products_collection_response.dart';
import 'package:apis/network/remote/products/product/freezed_model/response/create_product_base_image_response.dart';
import 'package:apis/network/remote/products/product/freezed_model/response/create_product_multi_variants_options_response.dart';
import 'package:apis/network/remote/products/product/freezed_model/response/list_of_products_response.dart';
import 'package:apis/network/remote/products/product/freezed_model/response/single_product_response.dart';

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
}
