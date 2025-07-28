import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/taxes/classes/abstract/taxes_classes_service.dart';
import 'package:example/services/api_request_handler.dart';
import 'package:get_it/get_it.dart';
import 'package:example/services/api_service_registry.dart';

///*******************************************************************
///************** 📋 LIST TAX CLASSES HANDLER ***********************
///*******************************************************************

class ListTaxClassesHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'GET') {
      return {
        "status": "error",
        "message": "Method $method not supported for List Tax Classes API",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
    try {
      // Parse query parameters
      final context = params['context'];

      final response = await GetIt.I<TaxesClassesService>().listTaxClasses(
        apiVersion: WooNetwork.apiVersion,
        context: context,
      );

      return {
        "status": "success",
        "tax_classes": response.map((e) => e.toJson()).toList(),
        "total": response.length,
        "params": params,
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      return {
        "status": "error",
        "message": "Failed to fetch tax classes: ${e.toString()}",
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
            name: 'context',
            label: 'Context',
            hint: 'Scope under which the request is made (view/edit)',
          ),
        ],
      };
}
