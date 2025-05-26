import 'package:apis/apis.dart';
import 'package:apis/dio_config/api_dio_client.dart';
import 'package:apis/network/remote/products/collect/abstract/collect_service.dart';
import 'package:apis/network/remote/products/collect/freezed_model/request/create_collect_request.dart';
import 'package:apis/network/remote/products/collect/freezed_model/response/get_collects_response.dart';
import 'package:apis/network/remote/products/collect/freezed_model/response/get_single_collect_response.dart';
import 'package:apis/network/remote/products/collect/freezed_model/response/get_collects_count_response.dart';
import 'package:apis/network/remote/products/collect/freezed_model/response/create_collect_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'api_collect_service.g.dart';

@RestApi()
@Injectable(as: CollectService)
abstract class CollectServiceClient implements CollectService {
  /// 🏭 Factory for dependency injection
  @factoryMethod
  factory CollectServiceClient(Dio dio) => _CollectServiceClient(
        ApiDioClient.starter(),
        baseUrl: ApiNetwork.baseUrl,
      );

  /// 📋 Retrieve list of collects
  @override
  @GET('/api/{api_version}/collects.json')
  Future<GetCollectsResponse> getCollects({
    @Path('api_version') required String apiVersion,
    @Query('limit') int? limit,
    @Query('since_id') String? sinceId,
    @Query('fields') String? fields,
    @Query('product_id') String? productId,
    @Query('collection_id') String? collectionId,
  });

  /// 📋 Retrieve list of collects filtered by collection
  @override
  @GET('/api/{api_version}/collects.json')
  Future<GetCollectsResponse> getCollectsByCollection({
    @Path('api_version') required String apiVersion,
    @Query('collection_id') required String collectionId,
    @Query('limit') int? limit,
    @Query('since_id') String? sinceId,
    @Query('fields') String? fields,
  });

  /// 📋 Retrieve list of collects filtered by product
  @override
  @GET('/api/{api_version}/collects.json')
  Future<GetCollectsResponse> getCollectsByProduct({
    @Path('api_version') required String apiVersion,
    @Query('product_id') required String productId,
    @Query('limit') int? limit,
    @Query('since_id') String? sinceId,
    @Query('fields') String? fields,
  });

  /// 🔍 Retrieve a single collect
  @override
  @GET('/api/{api_version}/collects/{collect_id}.json')
  Future<GetSingleCollectResponse> getSingleCollect({
    @Path('api_version') required String apiVersion,
    @Path('collect_id') required String collectId,
    @Query('fields') String? fields,
  });

  /// 🔢 Retrieve count of collects
  @override
  @GET('/api/{api_version}/collects/count.json')
  Future<GetCollectsCountResponse> getCollectsCount({
    @Path('api_version') required String apiVersion,
    @Query('product_id') String? productId,
    @Query('collection_id') String? collectionId,
  });

  /// 🔢 Retrieve count of collects filtered by collection
  @override
  @GET('/api/{api_version}/collects/count.json')
  Future<GetCollectsCountResponse> getCollectsCountByCollection({
    @Path('api_version') required String apiVersion,
    @Query('collection_id') required String collectionId,
  });

  /// 🔢 Retrieve count of collects filtered by product
  @override
  @GET('/api/{api_version}/collects/count.json')
  Future<GetCollectsCountResponse> getCollectsCountByProduct({
    @Path('api_version') required String apiVersion,
    @Query('product_id') required String productId,
  });

  /// ➕ Create a new collect (associate product with collection)
  @override
  @POST('/api/{api_version}/collects.json')
  Future<CreateCollectResponse> createCollect({
    @Path('api_version') required String apiVersion,
    @Body() required CreateCollectRequest model,
  });

  /// 🗑️ Delete a collect by ID
  @override
  @DELETE('/api/{api_version}/collects/{collect_id}.json')
  Future<void> deleteCollect({
    @Path('api_version') required String apiVersion,
    @Path('collect_id') required String collectId,
  });
}