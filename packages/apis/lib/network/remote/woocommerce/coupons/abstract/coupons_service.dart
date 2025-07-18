import 'package:apis/network/remote/woocommerce/coupons/freezed_model/list_all_coupons_response.dart';

/// 🔑 Abstract contract for WooCommerce Coupons Service
/// Implement this to fetch coupons from WooCommerce API! 🌐
abstract class CouponsService {
  /// 🚀 Fetches the coupons from the WooCommerce API.
  Future<List<ListAllCouponsResponse>> listAllCoupons({
    required String apiVersion,
  });
}
