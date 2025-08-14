import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/coupons/abstract/coupons_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:get_it/get_it.dart';
import 'package:api_explorer/services/api_service_registry.dart';

///*******************************************************************
///******************* 🗑️ DELETE COUPON HANDLER ********************
///*******************************************************************

class DeleteCouponHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'DELETE') {
      return {
        "status": "error",
        "message": "Method $method not supported for Delete Coupon API",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    // Validate required parameter
    if (!params.containsKey('coupon_id') || params['coupon_id']!.isEmpty) {
      return {
        "status": "error",
        "message": "Coupon ID is required",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      // Parse coupon ID
      final couponId = int.tryParse(params['coupon_id']!);
      if (couponId == null) {
        return {
          "status": "error",
          "message": "Coupon ID must be a valid integer",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      // Parse force parameter
      final force = params['force'] == 'true' ? true : null;

      final response = await GetIt.I<CouponsService>().deleteCoupon(
        apiVersion: WooNetwork.apiVersion,
        couponId: couponId,
        force: force,
      );

      return {
        "status": "success",
        "message": "Coupon deleted successfully",
        "coupon": response.toJson(),
        "params": params,
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      return {
        "status": "error",
        "message": "Failed to delete coupon: ${e.toString()}",
        "params": params,
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  @override
  List<String> get supportedMethods => ['DELETE'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'DELETE': [
          const ApiField(
            name: 'coupon_id',
            label: 'Coupon ID',
            hint: 'ID of the coupon to delete',
            isRequired: true,
            type: ApiFieldType.number,
          ),
          const ApiField(
            name: 'force',
            label: 'Force Delete',
            hint: 'Whether to bypass trash and force deletion (true/false)',
            type: ApiFieldType.boolean,
          ),
        ],
      };
}
