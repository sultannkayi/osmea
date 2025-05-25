import 'package:apis/network/remote/orders/transaction/freezed_model/request/create_transaction_request.dart';
import 'package:apis/network/remote/orders/transaction/freezed_model/response/create_transaction_response.dart';

abstract class TransactionService {
  Future<CreateTransactionResponse> createTransaction({
    required String apiVersion,
    required String orderId,
    required CreateTransactionRequest model,
  });
}
