import 'package:apis/network/remote/woocommerce/products/variations/freezed_model/response/list_all_product_variations_response.dart';
import 'package:apis/network/remote/woocommerce/products/variations/freezed_model/response/create_product_variation_response.dart';
import 'package:apis/network/remote/woocommerce/products/variations/freezed_model/response/retrieve_product_variation_response.dart';
import 'package:apis/network/remote/woocommerce/products/variations/freezed_model/response/update_product_variation_response.dart';
import 'package:apis/network/remote/woocommerce/products/variations/freezed_model/response/delete_product_variation_response.dart';

/// 🔄 Abstract service for WooCommerce Product Variations API operations
abstract class ProductVariationsService {
  /// 📋 List all product variations for a specific product
  Future<List<ListAllProductVariationsResponse>> listAllProductVariations({
    required String apiVersion,
    required int productId,
    String? context,
    int? page,
    int? perPage,
    String? search,
    String? after,
    String? before,
    List<int>? exclude,
    List<int>? include,
    int? offset,
    String? order,
    String? orderby,
    List<int>? parent,
    List<int>? parentExclude,
    String? slug,
    String? status,
    String? sku,
    String? featured,
    String? category,
    String? tag,
    String? shippingClass,
    String? attribute,
    String? attributeTerm,
    String? taxClass,
    String? onSale,
    String? minPrice,
    String? maxPrice,
    String? stockStatus,
  });

  /// ➕ Create a new product variation
  Future<CreateProductVariationResponse> createProductVariation({
    required String apiVersion,
    required int productId,
    required Map<String, dynamic> variationData,
  });

  /// 🔍 Retrieve a single product variation
  Future<RetrieveProductVariationResponse> retrieveProductVariation({
    required String apiVersion,
    required int productId,
    required int variationId,
  });

  /// ✏️ Update a product variation
  Future<UpdateProductVariationResponse> updateProductVariation({
    required String apiVersion,
    required int productId,
    required int variationId,
    required Map<String, dynamic> variationData,
  });

  /// 🗑️ Delete a product variation
  Future<DeleteProductVariationResponse> deleteProductVariation({
    required String apiVersion,
    required int productId,
    required int variationId,
    bool? force,
  });
}
