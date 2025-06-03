import 'package:apis/apis.dart';
import 'package:apis/dio_config/api_dio_client.dart';
import 'package:apis/network/remote/orders/refund/abstract/refund_service.dart';
import 'package:apis/network/remote/orders/refund/freezed_model/request/create_refund_calculate_request.dart';
import 'package:apis/network/remote/orders/refund/freezed_model/request/create_refund_request.dart';
import 'package:apis/network/remote/orders/refund/freezed_model/response/create_refund_calculate_response.dart';
import 'package:apis/network/remote/orders/refund/freezed_model/response/create_refund_response.dart';

import 'package:apis/network/remote/orders/refund/freezed_model/response/get_list_refund_response.dart';
import 'package:apis/network/remote/orders/refund/freezed_model/response/get_single_refund_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'api_refund_service.g.dart';

@RestApi()
@Injectable(as: RefundService)
abstract class RefundServiceClient implements RefundService {
  @factoryMethod
  factory RefundServiceClient(Dio dio) => _RefundServiceClient(
        ApiDioClient.starter(),
        baseUrl: ApiNetwork.baseUrl,
      );

  @override
  @GET('/api/{api_version}/orders/{order_id}/refunds/{refund_id}.json')
  Future<GetSingleRefundResponse> getSingleRefund({
    @Path('api_version') required String apiVersion,
    @Path('order_id') required String orderId,
    @Path('refund_id') required String refundId,
  });

  @GET('/api/{api_version}/orders/{order_id}/refunds.json')
  Future<GetListRefundResponse> getListRefund({
    @Path('api_version') required String apiVersion,
    @Path('order_id') required String orderId,
  });

  @POST('/api/{api_version}/orders/{order_id}/refunds/calculate.json')
  Future<CreateRefundCalculateResponse> createRefundCalculate({
    @Path('api_version') required String apiVersion,
    @Path('order_id') required String orderId,
    @Body() required CreateRefundCalculateRequest model,
  });

  @POST('/api/{api_version}/orders/{order_id}/refunds.json')
  Future<CreateRefundResponse> createRefund({
    @Path('api_version') required String apiVersion,
    @Path('order_id') required String orderId,
    @Body() required CreateRefundRequest model,
  });
}
