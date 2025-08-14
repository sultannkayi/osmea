import 'package:apis/network/remote/woocommerce/coupons/freezed_model/response/list_all_coupons_response.dart';
import 'package:apis/network/remote/woocommerce/coupons/freezed_model/response/retrieve_coupon_response.dart';
import 'package:apis/network/remote/woocommerce/coupons/freezed_model/request/create_coupon_request.dart';
import 'package:apis/network/remote/woocommerce/coupons/freezed_model/response/create_coupon_response.dart';
import 'package:apis/network/remote/woocommerce/coupons/freezed_model/response/update_coupon_response.dart';
import 'package:apis/network/remote/woocommerce/coupons/freezed_model/request/batch_update_coupons_request.dart';
import 'package:apis/network/remote/woocommerce/coupons/freezed_model/response/batch_update_coupons_response.dart';
import 'package:apis/network/remote/woocommerce/coupons/freezed_model/response/delete_coupon_response.dart';

/// 🔑 Abstract contract for WooCommerce Coupons Service
/// Implement this to fetch coupons from WooCommerce API! 🌐
abstract class CouponsService {
  /// 🚀 Fetches the coupons from the WooCommerce API.
  Future<List<ListAllCouponsResponse>> listAllCoupons({
    required String apiVersion,
    String? context,
    int? page,
    int? perPage,
    String? search,
    String? after,
    String? before,
    List<String>? exclude,
    List<String>? include,
    int? offset,
    String? order,
    String? orderBy,
    String? code,
  });

  /// 🎯 Retrieves a specific coupon by ID from the WooCommerce API.
  Future<RetrieveCouponResponse> retrieveCoupon({
    required String apiVersion,
    required int couponId,
    String? context,
  });

  /// ✨ Creates a new coupon in the WooCommerce API.
  Future<CreateCouponResponse> createCoupon({
    required String apiVersion,
    required CreateCouponRequest couponData,
  });

  /// 🔄 Updates an existing coupon in the WooCommerce API.
  Future<UpdateCouponResponse> updateCoupon({
    required String apiVersion,
    required int couponId,
    required Map<String, dynamic> couponData,
  });

  /// 🗑️ Deletes a coupon from the WooCommerce API.
  Future<DeleteCouponResponse> deleteCoupon({
    required String apiVersion,
    required int couponId,
    bool? force,
  });

  /// 📦 Batch update coupons in the WooCommerce API.
  Future<BatchUpdateCouponsResponse> batchUpdateCoupons({
    required String apiVersion,
    required BatchUpdateCouponsRequest batchData,
  });
}
