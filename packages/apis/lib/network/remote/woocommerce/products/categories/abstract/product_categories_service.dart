import 'package:apis/network/remote/woocommerce/products/categories/freezed_model/response/list_all_product_categories_response.dart';
import 'package:apis/network/remote/woocommerce/products/categories/freezed_model/response/create_product_category_response.dart';
import 'package:apis/network/remote/woocommerce/products/categories/freezed_model/response/retrieve_product_category_response.dart';
import 'package:apis/network/remote/woocommerce/products/categories/freezed_model/response/update_product_category_response.dart';
import 'package:apis/network/remote/woocommerce/products/categories/freezed_model/response/delete_product_category_response.dart';
import 'package:apis/network/remote/woocommerce/products/categories/freezed_model/request/batch_update_product_categories_request.dart';
import 'package:apis/network/remote/woocommerce/products/categories/freezed_model/response/batch_update_product_categories_response.dart';

abstract class ProductCategoriesService {
  Future<ListAllProductCategoriesResponse> listAllProductCategories({
    required String apiVersion,
    int? page,
    int? perPage,
    String? search,
    List<int>? exclude,
    List<int>? include,
    String? order,
    String? orderby,
    bool? hideEmpty,
    int? parent,
    int? product,
    String? slug,
  });

  Future<CreateProductCategoryResponse> createProductCategory({
    required String apiVersion,
    required Map<String, dynamic> categoryData,
  });

  Future<RetrieveProductCategoryResponse> retrieveProductCategory({
    required String apiVersion,
    required int categoryId,
  });

  Future<UpdateProductCategoryResponse> updateProductCategory({
    required String apiVersion,
    required int categoryId,
    required Map<String, dynamic> categoryData,
  });

  Future<DeleteProductCategoryResponse> deleteProductCategory({
    required String apiVersion,
    required int categoryId,
    bool? force,
  });

  /// 📦 Batch update product categories in the WooCommerce API.
  Future<BatchUpdateProductCategoriesResponse> batchUpdateProductCategories({
    required String apiVersion,
    required BatchUpdateProductCategoriesRequest batchData,
  });
}
