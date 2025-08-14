import 'package:apis/network/remote/woocommerce/taxes/rates/abstract/taxes_rates_service.dart';
import 'package:apis/network/remote/woocommerce/taxes/rates/freezed_model/request/batch_update_taxes_rates_request.dart'
    as req;
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:get_it/get_it.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'dart:convert';

///*******************************************************************
//************* 📦 BATCH UPDATE TAX RATES HANDLER ******************
///*******************************************************************

class BatchUpdateTaxesRatesHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'PATCH') {
      return {
        "status": "error",
        "message":
            "Method $method not supported for Batch Update Tax Rates API",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      // Parse create operations
      List<req.Create>? createOperations;
      if (params.containsKey('create_operations')) {
        createOperations = _parseCreateOperations(params['create_operations']!);
      }

      // Parse update operations
      List<req.Update>? updateOperations;
      if (params.containsKey('update_operations')) {
        updateOperations = _parseUpdateOperations(params['update_operations']!);
      }

      // Parse delete operations
      List<int>? deleteOperations;
      if (params.containsKey('delete_operations')) {
        deleteOperations = params['delete_operations']!
            .split(',')
            .map((e) => int.tryParse(e.trim()))
            .where((e) => e != null)
            .cast<int>()
            .toList();
      }

      // Create batch request
      final batchData = req.BatchUpdateTaxesRatesRequest(
        create: createOperations,
        update: updateOperations,
        delete: deleteOperations,
      );

      // Get the tax rates service instance
      final taxRatesService = GetIt.instance<TaxesRatesService>();

      // Execute the batch update request
      final response = await taxRatesService.batchUpdateTaxRates(
        apiVersion: params['api_version'] ?? 'v3',
        batchData: batchData,
      );

      // Convert response to Map
      return {
        "status": "success",
        "data": response.toJson(),
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      return {
        "status": "error",
        "message": "Failed to execute batch update tax rates request: $e",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'PATCH': [
          const ApiField(
            name: 'create_operations',
            label: 'Create Operations',
            hint: 'JSON array of tax rates to create',
            isRequired: false,
            type: ApiFieldType.text,
          ),
          const ApiField(
            name: 'update_operations',
            label: 'Update Operations',
            hint: 'JSON array of tax rates to update',
            isRequired: false,
            type: ApiFieldType.text,
          ),
          const ApiField(
            name: 'delete_operations',
            label: 'Delete Operations',
            hint: 'Comma-separated tax rate IDs to delete',
            isRequired: false,
            type: ApiFieldType.text,
          ),
          const ApiField(
            name: 'api_version',
            label: 'API Version',
            hint: 'WooCommerce API version (default: v3)',
            isRequired: false,
            type: ApiFieldType.text,
          ),
        ],
      };

  @override
  List<String> get supportedMethods => ['PATCH'];

  /// ✨ Parse create operations from parameter string
  List<req.Create> _parseCreateOperations(String operationsParam) {
    try {
      final List<dynamic> operationsList = json.decode(operationsParam);
      return operationsList.map((operation) {
        final operationMap = operation as Map<String, dynamic>;
        return req.Create(
          country: operationMap['country']?.toString(),
          state: operationMap['state']?.toString(),
          postcode: operationMap['postcode']?.toString(),
          city: operationMap['city']?.toString(),
          rate: operationMap['rate']?.toString(),
          name: operationMap['name']?.toString(),
          priority: int.tryParse(operationMap['priority']?.toString() ?? ''),
          compound: operationMap['compound'] == true ||
              operationMap['compound']?.toString().toLowerCase() == 'true',
          shipping: operationMap['shipping'] == true ||
              operationMap['shipping']?.toString().toLowerCase() == 'true',
          order: int.tryParse(operationMap['order']?.toString() ?? ''),
          createClass: operationMap['class']?.toString(),
        );
      }).toList();
    } catch (e) {
      throw Exception('Failed to parse create operations: $e');
    }
  }

  /// 🔄 Parse update operations from parameter string
  List<req.Update> _parseUpdateOperations(String operationsParam) {
    try {
      final List<dynamic> operationsList = json.decode(operationsParam);
      return operationsList.map((operation) {
        final operationMap = operation as Map<String, dynamic>;
        return req.Update(
          id: int.tryParse(operationMap['id']?.toString() ?? ''),
          rate: operationMap['rate']?.toString(),
          name: operationMap['name']?.toString(),
          shipping: operationMap['shipping'] == true ||
              operationMap['shipping']?.toString().toLowerCase() == 'true',
        );
      }).toList();
    } catch (e) {
      throw Exception('Failed to parse update operations: $e');
    }
  }
}
