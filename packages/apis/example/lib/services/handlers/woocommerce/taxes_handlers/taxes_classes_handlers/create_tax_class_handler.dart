import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/taxes/classes/abstract/taxes_classes_service.dart';
import 'package:apis/network/remote/woocommerce/taxes/classes/freezed_model/request/create_tax_class_request.dart';
import 'package:example/services/api_request_handler.dart';
import 'package:get_it/get_it.dart';
import 'package:example/services/api_service_registry.dart';

///*******************************************************************
///******************* ✨ CREATE TAX CLASS HANDLER *******************
///*******************************************************************

class CreateTaxClassHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'POST') {
      return {
        "status": "error",
        "message": "Method $method not supported for Create Tax Class API",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }


    try {
      // Parse parameters
      final name = params['name'];
      final slug = params['slug'];

      // Create tax class request
      final taxClassData = CreateTaxClassRequest(
        name: name,
        slug: slug,
      );

      final response = await GetIt.I<TaxesClassesService>().createTaxClass(
        apiVersion: WooNetwork.apiVersion,
        taxClassData: taxClassData,
      );

      return {
        "status": "success",
        "tax_class": response.toJson(),
        "params": params,
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      return {
        "status": "error",
        "message": "Failed to create tax class: ${e.toString()}",
        "params": params,
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  @override
  List<String> get supportedMethods => ['POST'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'POST': [
          const ApiField(
            name: 'name',
            label: 'Tax Class Name',
            hint: 'Name of the tax class',
          ),
          const ApiField(
            name: 'slug',
            label: 'Slug',
            hint: 'Unique slug for the tax class',
          ),
        ],
      };
}
