import 'package:apis/apis.dart';
import 'package:apis/dio_config/api_dio_client.dart';
import 'package:apis/network/remote/smart_collections/abstract/smart_collection_service.dart';
import 'package:apis/network/remote/smart_collections/freezed_model/response/retrieves_list_of_smart_collections_response.dart';
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
  });


}
