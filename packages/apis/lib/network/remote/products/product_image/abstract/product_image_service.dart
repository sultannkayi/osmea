import 'package:apis/network/remote/products/product_image/freezed_model/response/create_a_new_product_image_response.dart';
import 'package:apis/network/remote/products/product_image/freezed_model/response/receive_a_list_of_all_product_image_response.dart';
import 'package:apis/network/remote/products/product_image/freezed_model/response/receive_a_single_product_image_response.dart';
import 'package:apis/network/remote/products/product_image/freezed_model/response/receive_a_count_of_all_product_images_response.dart';
import 'package:apis/network/remote/products/product_image/freezed_model/request/create_a_new_product_image_request.dart';
import 'package:apis/network/remote/products/product_image/freezed_model/request/modify_an_existing_product_image_request.dart';
import 'package:apis/network/remote/products/product_image/freezed_model/response/modify_an_existing_product_image_response.dart';
import 'package:apis/network/remote/products/product_image/freezed_model/response/create_product_image_main_response.dart';
import 'package:apis/network/remote/products/product_image/freezed_model/response/create_product_image_variant_response.dart';

abstract class ProductImageService {
  /// 🖼️ Retrieve list of product images
  Future<ReceiveAListOfAllProductImagesResponse> getProductImages({
    required String apiVersion,
    required String productId,
    String? sinceId,
    String? fields,
  });

  /// 🖼️ Retrieve a single product image by ID
  Future<ReceiveASingleProductImageResponse> getSingleProductImage({
    required String apiVersion,
    required String productId,
    required String imageId,
    String? fields,
  });

  /// 🔢 Get count of product images
  Future<ReceiveACountOfAllProductImagesResponse> getProductImageCount({
    required String apiVersion,
    required String productId,
  });

  /// ➕ Create a new product image
  Future<ReceiveASingleProductImageResponse> createProductImage({
    required String apiVersion,
    required String productId,
    required CreateANewProductImageRequest request,
  });

  /// 🖼️ PUT: Modify an existing product image
  Future<ModifyAnExistingProductImageResponse> modifyProductImage({
    required String apiVersion,
    required String productId,
    required String imageId,
    required ModifyAnExistingProductImageRequest request,
  });

  /// 🗑️ DELETE: Remove an existing product image
  Future<void> deleteProductImage({
    required String apiVersion,
    required String productId,
    required String imageId,
  });
  
  Future<CreateANewProductImageResponse> createProductImageResponse({
  required String apiVersion,
  required String productId,
  required CreateANewProductImageRequest request,
});

Future<CreateProductImageMainResponse> createProductImageMain({
  required String apiVersion,
  required String productId,
  required Map<String, dynamic> body,
});

/// 🧬 Create product image with variant(s)
Future<CreateProductImageVariantResponse> createProductImageVariant({
  required String apiVersion,
  required String productId,
  required Map<String, dynamic> body,
});



}
