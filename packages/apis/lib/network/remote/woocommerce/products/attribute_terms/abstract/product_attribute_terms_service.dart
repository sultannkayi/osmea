import 'package:apis/network/remote/woocommerce/products/attribute_terms/freezed_model/response/list_all_product_attribute_terms_response.dart';
import 'package:apis/network/remote/woocommerce/products/attribute_terms/freezed_model/response/create_product_attribute_term_response.dart';
import 'package:apis/network/remote/woocommerce/products/attribute_terms/freezed_model/response/retrieve_product_attribute_term_response.dart';
import 'package:apis/network/remote/woocommerce/products/attribute_terms/freezed_model/response/update_product_attribute_term_response.dart';
import 'package:apis/network/remote/woocommerce/products/attribute_terms/freezed_model/response/delete_product_attribute_term_response.dart';

/// 🏷️ Abstract service for WooCommerce Product Attribute Terms API operations
abstract class ProductAttributeTermsService {
  /// 📋 List all product attribute terms
  Future<List<ListAllProductAttributeTermsResponse>>
      listAllProductAttributeTerms({
    required String apiVersion,
    required int attributeId,
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
    String? parent,
    String? product,
    String? slug,
  });

  /// ➕ Create a new product attribute term
  Future<CreateProductAttributeTermResponse> createProductAttributeTerm({
    required String apiVersion,
    required int attributeId,
    required Map<String, dynamic> termData,
  });

  /// 🔍 Retrieve a single product attribute term
  Future<RetrieveProductAttributeTermResponse> retrieveProductAttributeTerm({
    required String apiVersion,
    required int attributeId,
    required int termId,
  });

  /// ✏️ Update a product attribute term
  Future<UpdateProductAttributeTermResponse> updateProductAttributeTerm({
    required String apiVersion,
    required int attributeId,
    required int termId,
    required Map<String, dynamic> termData,
  });

  /// 🗑️ Delete a product attribute term
  Future<DeleteProductAttributeTermResponse> deleteProductAttributeTerm({
    required String apiVersion,
    required int attributeId,
    required int termId,
    bool? force,
  });
}
