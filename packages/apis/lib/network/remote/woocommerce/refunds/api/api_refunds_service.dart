import 'package:apis/apis.dart';
import 'package:apis/dio_config/api_dio_client.dart';
import 'package:apis/network/remote/woocommerce/refunds/abstract/refunds_service.dart';
import 'package:apis/network/remote/woocommerce/refunds/freezed_model/response/list_all_refunds_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';

part 'api_refunds_service.g.dart';

@RestApi()
@Injectable(as: RefundsService)
abstract class ApiRefundsService implements RefundsService {
  @factoryMethod
  factory ApiRefundsService(Dio dio) => _ApiRefundsService(
        ApiDioClient.wooDio(),
        baseUrl: WooNetwork.baseUrl,
      );

  @override
  @GET('/wp-json/wc/{apiVersion}/orders/{orderId}/refunds')
  Future<List<ListAllRefundsResponse>> listAllRefunds({
    @Path('orderId') required int orderId,
    @Path('apiVersion') String? apiVersion = 'v3',
  });
}
