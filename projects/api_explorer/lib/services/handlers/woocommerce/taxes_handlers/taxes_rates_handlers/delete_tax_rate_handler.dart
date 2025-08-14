import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/taxes/rates/abstract/taxes_rates_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:get_it/get_it.dart';
import 'package:api_explorer/services/api_service_registry.dart';

///*******************************************************************
///******************* 🗑️ DELETE TAX RATE HANDLER ********************
///*******************************************************************

class DeleteTaxRateHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'DELETE') {
      return {
        "status": "error",
        "message": "Method $method not supported for Delete Tax Rate API",
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
      // Parse tax rate ID
      final taxRateId = int.tryParse(params['tax_rate_id']!);
      if (taxRateId == null) {
        return {
          "status": "error",
          "message": "Tax Rate ID must be a valid integer",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      // Parse force parameter
      final force = params['force'] == 'true' ? true : null;

      final response = await GetIt.I<TaxesRatesService>().deleteTaxRate(
        apiVersion: WooNetwork.apiVersion,
        taxRateId: taxRateId,
        force: force,
      );

      return {
        "status": "success",
        "message": "Tax rate deleted successfully",
        "tax_rate": response.toJson(),
        "params": params,
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      return {
        "status": "error",
        "message": "Failed to delete tax rate: ${e.toString()}",
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
            name: 'tax_rate_id',
            label: 'Tax Rate ID',
            hint: 'ID of the tax rate to delete',
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
