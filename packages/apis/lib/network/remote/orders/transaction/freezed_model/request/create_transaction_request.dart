import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'create_transaction_request.freezed.dart';
part 'create_transaction_request.g.dart';

CreateTransactionRequest createTransactionRequestFromJson(String str) =>
    CreateTransactionRequest.fromJson(json.decode(str));

String createTransactionRequestToJson(CreateTransactionRequest data) =>
    json.encode(data.toJson());

@freezed
class CreateTransactionRequest with _$CreateTransactionRequest {
  const factory CreateTransactionRequest({
    @JsonKey(name: "transaction") Transaction? transaction,
  }) = _CreateTransactionRequest;

  factory CreateTransactionRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateTransactionRequestFromJson(json);
}

@freezed
class Transaction with _$Transaction {
  const factory Transaction({
    @JsonKey(name: "kind") String? kind,
    @JsonKey(name: "amount") String? amount,
    @JsonKey(name: "currency") String? currency,
    @JsonKey(name: "gateway") String? gateway,
    @JsonKey(name: "test") bool? test,
    @JsonKey(name: "source") String? source,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
}
