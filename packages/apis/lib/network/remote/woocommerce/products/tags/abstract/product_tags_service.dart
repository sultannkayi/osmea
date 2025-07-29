import 'package:apis/network/remote/woocommerce/products/tags/freezed_model/response/list_all_product_tags_response.dart';
import 'package:apis/network/remote/woocommerce/products/tags/freezed_model/response/create_product_tag_response.dart';
import 'package:apis/network/remote/woocommerce/products/tags/freezed_model/response/retrieve_product_tag_response.dart';
import 'package:apis/network/remote/woocommerce/products/tags/freezed_model/response/update_product_tag_response.dart';
import 'package:apis/network/remote/woocommerce/products/tags/freezed_model/response/delete_product_tag_response.dart';
import 'package:apis/network/remote/woocommerce/products/tags/freezed_model/request/batch_update_product_tags_request.dart';
import 'package:apis/network/remote/woocommerce/products/tags/freezed_model/response/batch_update_product_tags_response.dart';

/// 🏷️ Abstract service for WooCommerce Product Tags API operations
abstract class ProductTagsService {
  /// 📋 List all product tags
  Future<List<ListAllProductTagsResponse>> listAllProductTags({
    required String apiVersion,
    String? context,
    int? page,
    int? perPage,
    String? search,
    List<int>? exclude,
    List<int>? include,
    int? offset,
    String? order,
    String? orderby,
    bool? hideEmpty,
    int? product,
    String? slug,
  });

  /// ➕ Create a new product tag
  Future<CreateProductTagResponse> createProductTag({
    required String apiVersion,
    required Map<String, dynamic> tagData,
  });

  /// 🔍 Retrieve a single product tag
  Future<RetrieveProductTagResponse> retrieveProductTag({
    required String apiVersion,
    required int tagId,
  });

  /// ✏️ Update a product tag
  Future<UpdateProductTagResponse> updateProductTag({
    required String apiVersion,
    required int tagId,
    required Map<String, dynamic> tagData,
  });

  /// 🗑️ Delete a product tag
  Future<DeleteProductTagResponse> deleteProductTag({
    required String apiVersion,
    required int tagId,
    bool? force,
  });

  /// 📦 Batch update product tags
  Future<BatchUpdateProductTagsResponse> batchUpdateProductTags({
    required String apiVersion,
    required BatchUpdateProductTagsRequest batchData,
  });
}
