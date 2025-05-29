import 'package:apis/dio_config/api_dio_client.dart';
import 'package:apis/network/remote/products/product_image/abstract/product_image_service.dart';
import 'package:apis/network/remote/products/product_image/freezed_model/response/create_a_new_product_image_response.dart';
import 'package:apis/network/remote/products/product_image/freezed_model/response/receive_a_list_of_all_product_image_response.dart';
import 'package:apis/network/remote/products/product_image/freezed_model/response/receive_a_single_product_image_response.dart';
import 'package:apis/network/remote/products/product_image/freezed_model/response/receive_a_count_of_all_product_images_response.dart';
import 'package:apis/network/remote/products/product_image/freezed_model/request/create_a_new_product_image_request.dart';
import 'package:apis/network/remote/products/product_image/freezed_model/request/modify_an_existing_product_image_request.dart';
import 'package:apis/network/remote/products/product_image/freezed_model/response/modify_an_existing_product_image_response.dart';
import 'package:apis/network/remote/products/product_image/freezed_model/response/create_product_image_main_response.dart';
import 'package:apis/network/remote/products/product_image/freezed_model/response/create_product_image_variant_response.dart';

import 'package:apis/apis.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'api_product_image_service.g.dart';

@RestApi()
@Injectable(as: ProductImageService)
abstract class ProductImageServiceClient implements ProductImageService {
  /// 🏭 Factory for dependency injection  
  @factoryMethod
  factory ProductImageServiceClient(Dio dio) => _ProductImageServiceClient(
        ApiDioClient.starter(),
        baseUrl: ApiNetwork.baseUrl,
      );

  /// 🖼 Retrieve list of product images
  @override
  @GET('/api/{api_version}/products/{product_id}/images.json')
  Future<ReceiveAListOfAllProductImagesResponse> getProductImages({
    @Path('api_version') required String apiVersion,
    @Path('product_id') required String productId,
    @Query('since_id') String? sinceId,
    @Query('fields') String? fields,
  });

  /// 🖼 Retrieve a single product image by ID
@override
@GET('/api/{api_version}/products/{product_id}/images/{image_id}.json')
Future<ReceiveASingleProductImageResponse> getSingleProductImage({
  @Path('api_version') required String apiVersion,
  @Path('product_id') required String productId,
  @Path('image_id') required String imageId,
  @Query('fields') String? fields,
});

/// 🔢 Retrieve count of all product images
@override
@GET('/api/{api_version}/products/{product_id}/images/count.json')
Future<ReceiveACountOfAllProductImagesResponse> getProductImageCount({
  @Path('api_version') required String apiVersion,
  @Path('product_id') required String productId,
});  /// ➕ Create a new product image
@override
@POST('/api/{api_version}/products/{product_id}/images.json')
Future<ReceiveASingleProductImageResponse> createProductImage({
  @Path('api_version') required String apiVersion,
  @Path('product_id') required String productId,
  @Body() required CreateANewProductImageRequest request,
});

 // 🖼 PUT: Update an existing product image
  @override
  @PUT('/api/{api_version}/products/{product_id}/images/{image_id}.json')
  Future<ModifyAnExistingProductImageResponse> modifyProductImage({
    @Path('api_version') required String apiVersion,
    @Path('product_id') required String productId,
    @Path('image_id') required String imageId,
    @Body() required ModifyAnExistingProductImageRequest request,
  });

  /// 🗑 Delete a product image
  @override
  @DELETE('/api/{api_version}/products/{product_id}/images/{image_id}.json')
  Future<void> deleteProductImage({
    @Path('api_version') required String apiVersion,
    @Path('product_id') required String productId,
    @Path('image_id') required String imageId,
  });

/// ➕ Create a new product image (alternative signature)
@override
@POST('/api/{api_version}/products/{product_id}/images.json')
Future<CreateANewProductImageResponse> createProductImageResponse({
  @Path('api_version') required String apiVersion,
  @Path('product_id') required String productId,
  @Body() required CreateANewProductImageRequest request,
});

@POST('/api/{api_version}/products/{product_id}/images.json')
Future<CreateProductImageMainResponse> createProductImageMain({
  @Path('api_version') required String apiVersion,
  @Path('product_id') required String productId,
  @Body() required Map<String, dynamic> body,
});

/// 🧩 CREATE: Product Image for Variant
@POST('/api/{api_version}/products/{product_id}/images.json')
Future<CreateProductImageVariantResponse> createProductImageVariant({
  @Path('api_version') required String apiVersion,
  @Path('product_id') required String productId,
  @Body() required Map<String, dynamic> body,
});







}