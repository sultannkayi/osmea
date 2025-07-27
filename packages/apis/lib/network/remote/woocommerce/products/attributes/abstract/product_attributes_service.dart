import 'package:apis/network/remote/woocommerce/products/attributes/freezed_model/response/list_all_product_attributes_response.dart';
import 'package:apis/network/remote/woocommerce/products/attributes/freezed_model/response/create_product_attribute_response.dart';
import 'package:apis/network/remote/woocommerce/products/attributes/freezed_model/response/retrieve_product_attribute_response.dart';
import 'package:apis/network/remote/woocommerce/products/attributes/freezed_model/response/update_product_attribute_response.dart';
import 'package:apis/network/remote/woocommerce/products/attributes/freezed_model/response/delete_product_attribute_response.dart';

/// 🏷️ Abstract service for WooCommerce Product Attributes API operations
abstract class ProductAttributesService {
  /// 📋 List all product attributes
  Future<List<ListAllProductAttributesResponse>> listAllProductAttributes({
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
    String? slug,
  });

  /// ➕ Create a new product attribute
  Future<CreateProductAttributeResponse> createProductAttribute({
    required String apiVersion,
    required Map<String, dynamic> attributeData,
  });

  /// 🔍 Retrieve a single product attribute
  Future<RetrieveProductAttributeResponse> retrieveProductAttribute({
    required String apiVersion,
    required int attributeId,
  });

  /// ✏️ Update a product attribute
  Future<UpdateProductAttributeResponse> updateProductAttribute({
    required String apiVersion,
    required int attributeId,
    required Map<String, dynamic> attributeData,
  });

  /// 🗑️ Delete a product attribute
  Future<DeleteProductAttributeResponse> deleteProductAttribute({
    required String apiVersion,
    required int attributeId,
    bool? force,
  });
}
