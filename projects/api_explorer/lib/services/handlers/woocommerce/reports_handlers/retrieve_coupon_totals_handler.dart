import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/reports/abstract/reports_service.dart';
import 'package:apis/network/remote/woocommerce/reports/freezed_model/response/retrieve_coupon_totals_response.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:flutter/foundation.dart';

class RetrieveCouponTotalsHandler implements ApiRequestHandler {
  @override
  List<String> get supportedMethods => ['GET'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'GET': [
          const ApiField(
            name: 'api_version',
            label: 'API Version',
            hint: 'WooCommerce API version (default: v3)',
            isRequired: false,
          ),
        ],
      };

  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, dynamic> params,
  ) async {
    try {
      // Parse API version
      final apiVersion = params['api_version']?.toString() ?? 'v3';

      debugPrint('🎫 Retrieve Coupon Totals Parameters:');
      debugPrint('  API Version: $apiVersion');

      // Get service and call API
      final service = WooNetwork.getIt.get<ReportsService>();
      final List<RetrieveCouponTotalsResponse> response =
          await service.retrieveCouponTotals(
        apiVersion: apiVersion,
      );

      debugPrint(
          '✅ Retrieve Coupon Totals Success: Found ${response.length} coupon totals');

      return {
        'success': true,
        'data': response.map((coupon) => coupon.toJson()).toList(),
        'message': 'Coupon totals retrieved successfully',
        'count': response.length,
      };
    } catch (e) {
      debugPrint('❌ Error: $e');

      return {
        'success': false,
        'message': 'Failed to retrieve coupon totals: $e',
        'error_details': e.toString(),
      };
    }
  }
}
