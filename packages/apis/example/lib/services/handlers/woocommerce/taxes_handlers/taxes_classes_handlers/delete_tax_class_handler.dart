import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/taxes/classes/abstract/taxes_classes_service.dart';
import 'package:example/services/api_request_handler.dart';
import 'package:get_it/get_it.dart';
import 'package:example/services/api_service_registry.dart';

///*******************************************************************
///******************* 🗑️ DELETE TAX CLASS HANDLER *****************
///*******************************************************************

class DeleteTaxClassHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'DELETE') {
      return {
        "status": "error",
        "message": "Method $method not supported for Delete Tax Class API",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    // Validate required parameter
    if (!params.containsKey('slug') || params['slug']!.isEmpty) {
      return {
        "status": "error",
        "message": "Tax Class slug is required",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      final slug = params['slug']!;

      // Parse force parameter
      final force = params['force'] == 'true' ? true : null;

      final response = await GetIt.I<TaxesClassesService>().deleteTaxClass(
        apiVersion: WooNetwork.apiVersion,
        slug: slug,
        force: force,
      );

      return {
        "status": "success",
        "message": "Tax class deleted successfully",
        "tax_class": response.toJson(),
        "params": params,
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      return {
        "status": "error",
        "message": "Failed to delete tax class: ${e.toString()}",
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
            name: 'slug',
            label: 'Tax Class Slug',
            hint: 'Slug of the tax class to delete',
            type: ApiFieldType.text,
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
