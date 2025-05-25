import 'package:apis/apis.dart';
import 'package:apis/dio_config/api_dio_client.dart';
import 'package:apis/network/remote/products/product/abstract/product_service.dart';
import 'package:apis/network/remote/products/product/freezed_model/response/list_of_products_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'api_product_service.g.dart';

@RestApi()
@Injectable(as: ProductService)

/// 🌐 ProductService
abstract class ProductServiceClient implements ProductService {
  /// 🏭 Factory for dependency injection
  @factoryMethod
  factory ProductServiceClient(Dio dio) => _ProductServiceClient(
        ApiDioClient.starter(),
        baseUrl: ApiNetwork.baseUrl,
      );

  /// 📋 List all products
  @override
  @GET('/api/{api_version}/products.json')
  Future<ListOfProductsResponse> listProducts({
    @Path('api_version') required String apiVersion,
    @Query('limit') int? limit,
    @Query('ids') String? ids,
    @Query('since_id') String? sinceId,
    @Query('title') String? title,
    @Query('vendor') String? vendor,
    @Query('handle') String? handle,
    @Query('product_type') String? productType,
    @Query('published_status') String? publishedStatus,
    @Query('published_at_min') String? publishedAtMin,
    @Query('published_at_max') String? publishedAtMax,
    @Query('updated_at_min') String? updatedAtMin,
    @Query('updated_at_max') String? updatedAtMax,
    @Query('created_at_min') String? createdAtMin,
    @Query('created_at_max') String? createdAtMax,
    @Query('fields') String? fields,
    @Query('collection_id') String? collectionId,
    @Query('presentment_currencies') String? presentmentCurrencies,
  });
}
