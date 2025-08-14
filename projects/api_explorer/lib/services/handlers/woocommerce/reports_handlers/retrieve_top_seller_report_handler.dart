import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/reports/abstract/reports_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:get_it/get_it.dart';
import 'package:api_explorer/services/api_service_registry.dart';

///*******************************************************************
///******************* ✨ RETRIEVE TOP SELLER REPORT HANDLER *********
///*******************************************************************

class RetrieveTopSellerReportHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'GET') {
      return {
        "status": "error",
        "message":
            "Method $method not supported for Retrieve Top Seller Report API",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      // Parse parameters
      final dateMin = params['date_min'];
      final dateMax = params['date_max'];
      final limitStr = params['limit'];

      // Parse numeric values
      final limit = limitStr != null ? int.tryParse(limitStr) : null;

      final response = await GetIt.I<ReportsService>().retrieveTopSellersReport(
        apiVersion: WooNetwork.apiVersion,
        dateMin: dateMin,
        dateMax: dateMax,
        limit: limit,
      );

      return {
        "status": "success",
        "data": response.map((seller) => seller.toJson()).toList(),
        "params": params,
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      return {
        "status": "error",
        "message": "Failed to retrieve top seller report: ${e.toString()}",
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
            name: 'date_min',
            label: 'Start Date',
            hint: 'Start date for the report (YYYY-MM-DD)',
          ),
          const ApiField(
            name: 'date_max',
            label: 'End Date',
            hint: 'End date for the report (YYYY-MM-DD)',
          ),
          const ApiField(
            name: 'limit',
            label: 'Limit',
            hint: 'Maximum number of top sellers to retrieve',
            type: ApiFieldType.number,
          ),
        ],
      };
}
