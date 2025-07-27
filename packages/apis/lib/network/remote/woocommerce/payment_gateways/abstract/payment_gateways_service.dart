import 'package:apis/network/remote/woocommerce/payment_gateways/freezed_model/response/list_all_payment_gateways_response.dart';
import 'package:apis/network/remote/woocommerce/payment_gateways/freezed_model/response/retrieve_payment_gateway_response.dart';
import 'package:apis/network/remote/woocommerce/payment_gateways/freezed_model/response/update_payment_gateway_response.dart';

abstract class PaymentGatewaysService {
  /// 📋 List all payment gateways
  Future<List<ListAllPaymentGatewaysResponse>> listAllPaymentGateways({
    String? apiVersion,
  });

  /// 🔍 Retrieve a specific payment gateway
  Future<RetrievePaymentGatewayResponse> retrievePaymentGateway({
    required String id,
    String? apiVersion,
  });

  /// ✏️ Update a payment gateway
  Future<UpdatePaymentGatewayResponse> updatePaymentGateway({
    required String id,
    required Map<String, dynamic> gatewayData,
    String? apiVersion,
  });
}
