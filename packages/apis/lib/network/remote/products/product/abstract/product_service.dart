import 'package:apis/network/remote/products/product/freezed_model/response/list_of_products_response.dart';

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

}
