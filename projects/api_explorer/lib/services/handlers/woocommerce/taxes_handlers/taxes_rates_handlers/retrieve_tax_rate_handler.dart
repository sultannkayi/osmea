import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/taxes/rates/abstract/taxes_rates_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:get_it/get_it.dart';
import 'package:api_explorer/services/api_service_registry.dart';

///*******************************************************************
///******************* 🎯 RETRIEVE TAX RATE HANDLER *****************
///*******************************************************************

class RetrieveTaxRateHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'GET') {
      return {
        "status": "error",
        "message": "Method $method not supported for Retrieve Tax Rate API",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    // Validate required parameter
    if (!params.containsKey('tax_rate_id') || params['tax_rate_id']!.isEmpty) {
      return {
        "status": "error",
        "message": "Tax Rate ID is required",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      // Parse parameters
      final taxRateId = int.tryParse(params['tax_rate_id']!);
      if (taxRateId == null) {
        return {
          "status": "error",
          "message": "Tax Rate ID must be a valid integer",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      final context = params['context'];

      final response = await GetIt.I<TaxesRatesService>().retrieveTaxRate(
        apiVersion: WooNetwork.apiVersion,
        taxRateId: taxRateId,
        context: context,
      );

      return {
        "status": "success",
        "tax_rate": response.toJson(),
        "params": params,
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      return {
        "status": "error",
        "message": "Failed to retrieve tax rate: ${e.toString()}",
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
            name: 'tax_rate_id',
            label: 'Tax Rate ID',
            hint: 'The ID of the tax rate to retrieve',
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
