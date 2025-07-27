import 'package:apis/apis.dart';
import 'package:apis/dio_config/api_dio_client.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';
import 'package:apis/network/remote/woocommerce/payment_gateways/abstract/payment_gateways_service.dart';
import 'package:apis/network/remote/woocommerce/payment_gateways/freezed_model/response/list_all_payment_gateways_response.dart';
import 'package:apis/network/remote/woocommerce/payment_gateways/freezed_model/response/retrieve_payment_gateway_response.dart';
import 'package:apis/network/remote/woocommerce/payment_gateways/freezed_model/response/update_payment_gateway_response.dart';

part 'api_payment_gateways_service.g.dart';

@RestApi()
@Injectable(as: PaymentGatewaysService)
abstract class ApiPaymentGatewaysService implements PaymentGatewaysService {
  /// 🏭 Factory for dependency injection
  @factoryMethod
  factory ApiPaymentGatewaysService(Dio dio) => _ApiPaymentGatewaysService(
        ApiDioClient.wooDio(),
        baseUrl: WooNetwork.baseUrl,
      );

  @override
  @GET('/wp-json/wc/{apiVersion}/payment_gateways')
  Future<List<ListAllPaymentGatewaysResponse>> listAllPaymentGateways({
    @Path('apiVersion') String? apiVersion,
  });

  @override
  @GET('/wp-json/wc/{apiVersion}/payment_gateways/{id}')
  Future<RetrievePaymentGatewayResponse> retrievePaymentGateway({
    @Path('id') required String id,
    @Path('apiVersion') String? apiVersion,
  });

  @override
  @PUT('/wp-json/wc/{apiVersion}/payment_gateways/{id}')
  Future<UpdatePaymentGatewayResponse> updatePaymentGateway({
    @Path('id') required String id,
    @Body() required Map<String, dynamic> gatewayData,
    @Path('apiVersion') String? apiVersion,
  });
}
