import 'package:apis/network/remote/woocommerce/shipping_methods/freezed_model/response/list_all_shipping_methods_response.dart';
import 'package:apis/network/remote/woocommerce/shipping_methods/freezed_model/response/retrieve_shipping_method_response.dart';

abstract class ShippingMethodsService {
  /// 📋 List all shipping methods
  Future<List<ListAllShippingMethodsResponse>> listAllShippingMethods({
    String? apiVersion,
  });

  /// 🔍 Retrieve a specific shipping method
  Future<RetrieveShippingMethodResponse> retrieveShippingMethod({
    required String id,
    String? apiVersion,
  });
}
