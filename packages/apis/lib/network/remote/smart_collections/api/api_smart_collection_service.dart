import 'package:apis/apis.dart';
import 'package:apis/dio_config/api_dio_client.dart';
import 'package:apis/network/remote/smart_collections/abstract/smart_collection_service.dart';
import 'package:apis/network/remote/smart_collections/freezed_model/request/create_smart_collection_request.dart';
import 'package:apis/network/remote/smart_collections/freezed_model/request/updates_existing_smart_collection_request.dart';
import 'package:apis/network/remote/smart_collections/freezed_model/request/updates_ordering_type_of_products_smart_collection_request.dart';
import 'package:apis/network/remote/smart_collections/freezed_model/response/retrieves_list_of_smart_collections_response.dart';
import 'package:apis/network/remote/smart_collections/freezed_model/response/retrieves_single_smart_collection_response.dart';
import 'package:apis/network/remote/smart_collections/freezed_model/response/retrieves_count_of_smart_collections_response.dart';
import 'package:apis/network/remote/smart_collections/freezed_model/response/updates_existing_smart_collection_response.dart';
import 'package:apis/network/remote/smart_collections/freezed_model/response/updates_ordering_type_of_products_smart_collection_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'api_smart_collection_service.g.dart';

@RestApi()
@Injectable(as: SmartCollectionService)
abstract class ApiSmartCollectionService implements SmartCollectionService {
  /// 🏭 Factory for dependency injection
  @factoryMethod
  factory ApiSmartCollectionService(Dio dio) => _ApiSmartCollectionService(
        ApiDioClient.starter(),
        baseUrl: ApiNetwork.baseUrl,
      );

  /// 📥 Retrieves all smart collections
  @GET('/api/{api_version}/smart_collections.json')
  @override
  Future<RetrievesListOfSmartCollectionsResponse> listSmartCollections({
    @Path('api_version') required String apiVersion,
    @Query('limit') int? limit,
    @Query('since_id') String? sinceId,
    @Query('fields') String? fields,
    @Query('ids') String? ids,
    @Query('title') String? title,
    @Query('handle') String? handle,
    @Query('product_id') String? productId,
    @Query('updated_at_min') String? updatedAtMin,
    @Query('updated_at_max') String? updatedAtMax,
    @Query('published_at_min') String? publishedAtMin,
    @Query('published_at_max') String? publishedAtMax,
    @Query('published_status') String? publishedStatus,
  });

  /// 📄 Retrieves a single smart collection by ID
  @GET('/api/{api_version}/smart_collections/{id}.json')
  @override
  Future<RetrievesSingleSmartCollectionsResponse>
      retrieveSingleSmartCollection({
    @Path('api_version') required String apiVersion,
    @Path('id') required String id,
    @Query('fields') String? fields, // 👈 query olarak gönderilir
  });

  /// 🔢 Retrieves count of smart collections
  @GET('/api/{api_version}/smart_collections/count.json')
  @override
  Future<RetrievesCountOfSmartCollectionsResponse> countSmartCollections({
    @Path('api_version') required String apiVersion,
    @Query('title') String? title,
    @Query('product_id') String? productId,
    @Query('updated_at_min') String? updatedAtMin,
    @Query('updated_at_max') String? updatedAtMax,
    @Query('published_at_min') String? publishedAtMin,
    @Query('published_at_max') String? publishedAtMax,
    @Query('published_status') String? publishedStatus,
  });

  /// 🆕 Creates a new smart collection
  @POST('/api/{api_version}/smart_collections.json')
  @override
  Future<RetrievesSingleSmartCollectionsResponse> createSmartCollection({
    @Path('api_version') required String apiVersion,
    @Body() required CreateSmartCollectionRequest request,
  });

  /// ❌ Deletes a smart collection by ID
  @override
  @DELETE('/api/{api_version}/smart_collections/{id}.json')
  Future<void> deleteSmartCollection({
    @Path('api_version') required String apiVersion,
    @Path('id') required String id,
  });

  /// ✏ Updates an existing smart collection
  @PUT('/api/{api_version}/smart_collections/{id}.json')
  @override
  Future<UpdatesExistingSmartCollectionResponse> updateSmartCollection({
    @Path('api_version') required String apiVersion,
    @Path('id') required String id,
    @Body() required UpdateSmartCollectionRequest request,
  });

  /// 🔀 Updates ordering of products in a smart collection (manual sort)
  @PUT('/api/{api_version}/smart_collections/{id}/order.json')
  @override
  Future<UpdatesOrderingTypeOfProductsSmartCollection> updateProductOrder({
    @Path('api_version') required String apiVersion,
    @Path('id') required String id,
    @Body() required UpdateOrderingTypeOfProductsRequest request,
  });
}