import 'package:apis/apis.dart';
import 'package:apis/dio_config/api_dio_client.dart';
import 'package:apis/network/remote/orders/transaction/abstract/transaction.dart';
import 'package:apis/network/remote/orders/transaction/freezed_model/request/create_transaction_request.dart';
import 'package:apis/network/remote/orders/transaction/freezed_model/response/create_transaction_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'api_transaction_service.g.dart';

@RestApi()
@injectable
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
}
