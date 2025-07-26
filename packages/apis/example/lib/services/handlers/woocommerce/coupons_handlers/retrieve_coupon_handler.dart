import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/coupons/abstract/coupons_service.dart';
import 'package:example/services/api_request_handler.dart';
import 'package:get_it/get_it.dart';
import 'package:example/services/api_service_registry.dart';

///*******************************************************************
///******************* 🎯 RETRIEVE COUPON HANDLER *******************
///*******************************************************************

class RetrieveCouponHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'GET') {
      return {
        "status": "error",
        "message": "Method $method not supported for Retrieve Coupon API",
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
      // Parse parameters
      final couponId = int.tryParse(params['coupon_id']!);
      if (couponId == null) {
        return {
          "status": "error",
          "message": "Coupon ID must be a valid integer",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      final context = params['context'];

      final response = await GetIt.I<CouponsService>().retrieveCoupon(
        apiVersion: WooNetwork.apiVersion,
        couponId: couponId,
        context: context,
      );

      return {
        "status": "success",
        "coupon": response.toJson(),
        "params": params,
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      return {
        "status": "error",
        "message": "Failed to retrieve coupon: ${e.toString()}",
        "params": params,
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  @override
  List<String> get supportedMethods => ['GET'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'GET': [
          const ApiField(
            name: 'coupon_id',
            label: 'Coupon ID',
            hint: 'The ID of the coupon to retrieve',
            isRequired: true,
            type: ApiFieldType.number,
          ),
          const ApiField(
            name: 'context',
            label: 'Context',
            hint: 'Scope under which the request is made (view/edit)',
          ),
        ],
      };
}
