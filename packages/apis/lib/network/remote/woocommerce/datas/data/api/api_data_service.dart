import 'package:apis/apis.dart';
import 'package:apis/dio_config/api_dio_client.dart';
import 'package:apis/network/remote/woocommerce/datas/data/abstract/data_service.dart';
import 'package:apis/network/remote/woocommerce/datas/data/freezed_model/response/list_all_data_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';

part 'api_data_service.g.dart';

@RestApi()
@Injectable(as: DataService)
abstract class ApiDataService implements DataService {
  @factoryMethod
  factory ApiDataService(Dio dio) => _ApiDataService(
        ApiDioClient.wooDio(),
        baseUrl: WooNetwork.baseUrl,
      );

  @override
  @GET('/wp-json/wc/{apiVersion}/data')
  Future<List<ListAllDataResponse>> listAllData({
    @Path('apiVersion') String? apiVersion = 'v3',
  });
}
