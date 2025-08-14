import 'package:apis/network/remote/woocommerce/products/shipping_classes/freezed_model/response/list_all_product_shipping_classes_response.dart';
import 'package:apis/network/remote/woocommerce/products/shipping_classes/freezed_model/response/create_product_shipping_class_response.dart';
import 'package:apis/network/remote/woocommerce/products/shipping_classes/freezed_model/response/retrieve_product_shipping_class_response.dart';
import 'package:apis/network/remote/woocommerce/products/shipping_classes/freezed_model/response/update_product_shipping_class_response.dart';
import 'package:apis/network/remote/woocommerce/products/shipping_classes/freezed_model/response/delete_product_shipping_class_response.dart';
import 'package:apis/network/remote/woocommerce/products/shipping_classes/freezed_model/request/batch_update_product_shipping_classes_request.dart';
import 'package:apis/network/remote/woocommerce/products/shipping_classes/freezed_model/response/batch_update_product_shipping_classes_response.dart';

/// 📦 Abstract service for WooCommerce Product Shipping Classes API operations
abstract class ProductShippingClassesService {
  /// 📋 List all product shipping classes
  Future<List<ListAllProductShippingClasses>> listAllProductShippingClasses({
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

  /// ➕ Create a new product shipping class
  Future<CreateProductShippingClassResponse> createProductShippingClass({
    required String apiVersion,
    required Map<String, dynamic> shippingClassData,
  });

  /// 🔍 Retrieve a specific product shipping class
  Future<RetrieveProductShippingClassResponse> retrieveProductShippingClass({
    required String apiVersion,
    required int shippingClassId,
  });

  /// ✏️ Update a product shipping class
  Future<UpdateProductShippingClassResponse> updateProductShippingClass({
    required String apiVersion,
    required int shippingClassId,
    required Map<String, dynamic> shippingClassData,
  });

  /// 🗑️ Delete a product shipping class
  Future<DeleteProductShippingClassResponse> deleteProductShippingClass({
    required String apiVersion,
    required int shippingClassId,
    bool? force,
  });

  /// 📦 Batch update product shipping classes
  Future<BatchUpdateProductShippingClassesResponse>
      batchUpdateProductShippingClasses({
    required String apiVersion,
    required BatchUpdateProductShippingClassesRequest batchData,
  });
}
