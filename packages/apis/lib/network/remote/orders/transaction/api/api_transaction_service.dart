import 'package:apis/apis.dart';
import 'package:apis/dio_config/api_dio_client.dart';
import 'package:apis/network/remote/orders/transaction/abstract/transaction_service.dart';
import 'package:apis/network/remote/orders/transaction/freezed_model/request/create_transaction_request.dart';
import 'package:apis/network/remote/orders/transaction/freezed_model/response/create_transaction_response.dart';
import 'package:apis/network/remote/orders/transaction/freezed_model/response/get_transaction_count_response.dart';
import 'package:apis/network/remote/orders/transaction/freezed_model/response/get_transaction_list_response.dart';
import 'package:apis/network/remote/orders/transaction/freezed_model/response/get_transaction_single_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'api_transaction_service.g.dart';

@RestApi()
@Injectable(as: TransactionService)
abstract class TransactionServiceClient implements TransactionService {
  @factoryMethod
  factory TransactionServiceClient(Dio dio) => _TransactionServiceClient(
        ApiDioClient.starter(),
        baseUrl: ApiNetwork.baseUrl,
      );

  @override
  @POST('/api/{api_version}/orders/{order_id}/transactions.json')
  Future<CreateTransactionResponse> createTransaction({
    @Path('api_version') required String apiVersion,
    @Path('order_id') required String orderId,
    @Body() required CreateTransactionRequest model,
  });

  @GET('/api/{api_version}/orders/{order_id}/transactions/count.json')
  Future<GetTransactionCountResponse> getTransactionCount({
    @Path('api_version') required String apiVersion,
    @Path('order_id') required String orderId,
  });

  @GET(
      '/api/{api_version}/orders/{order_id}/transactions/{transaction_id}.json')
  Future<GetTransactionSingleResponse> getTransactionSingle({
    @Path('api_version') required String apiVersion,
    @Path('order_id') required String orderId,
    @Path('transaction_id') required String transactionId,
    @Query('fields') String? fields,
    @Query('in_shop_currency') String? in_shop_currency,
  });

  @GET('/api/{api_version}/orders/{order_id}/transactions.json')
  Future<GetTransactionListResponse> getTransactionList({
    @Path('api_version') required String apiVersion,
    @Path('order_id') required String orderId,
    @Query('since_id') String? since_id,
    @Query('fields') String? fields,
    @Query('in_shop_currency') String? in_shop_currency,
  });
}
