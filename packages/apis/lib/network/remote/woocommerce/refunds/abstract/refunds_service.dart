import 'package:apis/network/remote/woocommerce/refunds/freezed_model/response/list_all_refunds_response.dart';

abstract class RefundsService {
  /// List all refunds
  ///
  /// Returns a list of all refunds for a specific order.
  Future<List<ListAllRefundsResponse>> listAllRefunds({
    required int orderId,
    String? apiVersion,
  });
}
