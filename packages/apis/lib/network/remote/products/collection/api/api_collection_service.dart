import 'package:apis/apis.dart';
import 'package:apis/dio_config/api_dio_client.dart';
import 'package:apis/network/remote/products/collection/abstract/collection_service.dart';
import 'package:apis/network/remote/products/collection/freezed_model/products_belonging_to_collection_response.dart';
import 'package:apis/network/remote/products/collection/freezed_model/single_collection_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';

part 'api_collection_service.g.dart';

@RestApi()
@Injectable(as: CollectionService)
abstract class CollectionServiceClient implements CollectionService {
  /// 🏭 Factory for dependency injection
  @factoryMethod
  factory CollectionServiceClient(Dio dio) => _CollectionServiceClient(
        ApiDioClient.starter(),
        baseUrl: ApiNetwork.baseUrl,
      );

  @override
  @GET('/api/{api_version}/collections/{collection_id}.json')
  Future<SingleCollectionResponse> singleCollectionResponse({
    @Path('api_version') required String apiVersion,
    @Path('collection_id') required String collectionId,
    @Query('fields') String? fields,
  });

  @override
  @GET('/api/{api_version}/collections/{collection_id}/products.json')
  Future<ProductsBelongingToCollectionResponse> productsBelongingToCollection({
    @Path('api_version') required String apiVersion,
    @Path('collection_id') required String collectionId,
  });
}