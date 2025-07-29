import 'package:apis/network/remote/woocommerce/products/product/freezed_model/response/list_all_products_response.dart';
import 'package:apis/network/remote/woocommerce/products/product/freezed_model/request/create_product_request.dart';
import 'package:apis/network/remote/woocommerce/products/product/freezed_model/response/create_product_response.dart';
import 'package:apis/network/remote/woocommerce/products/product/freezed_model/response/retrieve_product_response.dart';
import 'package:apis/network/remote/woocommerce/products/product/freezed_model/response/update_product_response.dart';
import 'package:apis/network/remote/woocommerce/products/product/freezed_model/response/delete_product_response.dart';
import 'package:apis/network/remote/woocommerce/products/product/freezed_model/request/batch_update_products_request.dart';
import 'package:apis/network/remote/woocommerce/products/product/freezed_model/response/batch_update_products_response.dart';

abstract class ProductsService {
  /// List all products
  Future<List<ListAllProductsResponse>> listAllProducts({
    String? context,
    int? page,
    int? perPage,
    String? search,
    String? after,
    String? before,
    String? exclude,
    String? include,
    int? offset,
    String? order,
    String? orderBy,
    String? parent,
    String? parentExclude,
    String? slug,
    String? status,
    String? type,
    String? sku,
    bool? featured,
    String? category,
    String? tag,
    String? shippingClass,
    String? attribute,
    String? attributeTerm,
    String? taxClass,
    String? minPrice,
    String? maxPrice,
    String? stockStatus,
    bool? onSale,
  });

  /// Retrieve a single product
  Future<RetrieveProductResponse> retrieveProduct(
    int productId, {
    String? context,
  });

  /// Create a product
  Future<CreateProductResponse> createProduct({
    required String apiVersion,
    required Map<String, dynamic> productData,
  });

  /// Update a product
  Future<UpdateProductResponse> updateProduct(
    int productId,
    Map<String, dynamic> productData,
  );

  /// Delete a product
  Future<DeleteProductResponse> deleteProduct(
    int productId, {
    bool? force,
  });

  /// Retrieve product custom field names
  Future<List<String>> retrieveProductCustomFieldNames(
    int productId,
  );

  /// 📦 Batch update products
  Future<BatchUpdateProductsResponse> batchUpdateProducts({
    required String apiVersion,
    required BatchUpdateProductsRequest batchData,
  });
}
