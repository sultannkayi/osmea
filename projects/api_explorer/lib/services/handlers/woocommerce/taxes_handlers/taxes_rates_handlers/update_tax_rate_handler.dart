import 'package:apis/network/remote/woocommerce/taxes/rates/abstract/taxes_rates_service.dart';
import 'package:apis/network/remote/woocommerce/taxes/rates/freezed_model/request/update_tax_rate_request.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:get_it/get_it.dart';
import 'package:api_explorer/services/api_service_registry.dart';

///*******************************************************************
//***************** 🔄 UPDATE TAX RATE HANDLER *********************
///*******************************************************************

class UpdateTaxRateHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'PUT') {
      return {
        "status": "error",
        "message": "Method $method not supported for Update Tax Rate API",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    // Validate required parameter
    if (!params.containsKey('tax_rate_id') || params['tax_rate_id']!.isEmpty) {
      return {
        "status": "error",
        "message": "Tax rate ID is required",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      // Parse tax rate ID
      final taxRateId = int.tryParse(params['tax_rate_id']!);
      if (taxRateId == null) {
        return {
          "status": "error",
          "message": "Invalid tax rate ID format",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      // Parse parameters
      final country = params['country'];
      final state = params['state'];
      final postcode = params['postcode'];
      final city = params['city'];
      final rate = params['rate'];
      final name = params['name'];
      final updateTaxRateRequestClass = params['class'];

      // Parse numeric values
      final priority =
          params['priority'] != null ? int.tryParse(params['priority']!) : null;
      final order =
          params['order'] != null ? int.tryParse(params['order']!) : null;

      // Parse boolean values
      final compound = params['compound'] == 'true';
      final shipping = params['shipping'] == 'true';

      // Parse lists
      final postcodes = params['postcodes']
          ?.split(',')
          .map((e) => e.trim())
          .where((e) => e.isNotEmpty)
          .toList();
      final cities = params['cities']
          ?.split(',')
          .map((e) => e.trim())
          .where((e) => e.isNotEmpty)
          .toList();

      // Create tax rate update request
      final taxRateData = UpdateTaxRateRequest(
        country: country,
        state: state,
        postcode: postcode,
        city: city,
        postcodes: postcodes,
        cities: cities,
        rate: rate,
        name: name,
        priority: priority,
        compound: compound,
        shipping: shipping,
        order: order,
        updateTaxRateRequestClass: updateTaxRateRequestClass,
      );

      final response = await GetIt.I<TaxesRatesService>().updateTaxRate(
        apiVersion: params['api_version'] ?? 'v3',
        taxRateId: taxRateId,
        taxRateData: taxRateData,
      );

      return {
        "status": "success",
        "message": "Tax rate updated successfully",
        "data": response,
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      return {
        "status": "error",
        "message": "Failed to update tax rate: ${e.toString()}",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  @override
  List<String> get supportedMethods => ['PUT'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'PUT': [
          const ApiField(
            name: 'tax_rate_id',
            label: 'Tax Rate ID',
            hint: 'The ID of the tax rate to update',
            isRequired: true,
            type: ApiFieldType.number,
          ),
          const ApiField(
            name: 'country',
            label: 'Country',
            hint: 'Country ISO 3166 alpha-2 code',
            isRequired: false,
          ),
          const ApiField(
            name: 'state',
            label: 'State',
            hint: 'State code',
            isRequired: false,
          ),
          const ApiField(
            name: 'postcode',
            label: 'Postcode',
            hint: 'Postcode / ZIP',
            isRequired: false,
          ),
          const ApiField(
            name: 'city',
            label: 'City',
            hint: 'City name',
            isRequired: false,
          ),
          const ApiField(
            name: 'postcodes',
            label: 'Postcodes',
            hint: 'List of postcodes (comma-separated)',
            isRequired: false,
          ),
          const ApiField(
            name: 'cities',
            label: 'Cities',
            hint: 'List of cities (comma-separated)',
            isRequired: false,
          ),
          const ApiField(
            name: 'rate',
            label: 'Tax Rate',
            hint: 'Tax rate percentage',
            isRequired: false,
          ),
          const ApiField(
            name: 'name',
            label: 'Name',
            hint: 'Tax rate name',
            isRequired: false,
          ),
          const ApiField(
            name: 'priority',
            label: 'Priority',
            hint: 'Tax priority',
            type: ApiFieldType.number,
            isRequired: false,
          ),
          const ApiField(
            name: 'compound',
            label: 'Compound',
            hint: 'Whether or not this is a compound rate',
            type: ApiFieldType.boolean,
            isRequired: false,
          ),
          const ApiField(
            name: 'shipping',
            label: 'Shipping',
            hint: 'Whether or not this tax rate also gets applied to shipping',
            type: ApiFieldType.boolean,
            isRequired: false,
          ),
          const ApiField(
            name: 'order',
            label: 'Order',
            hint: 'Indicates the order that will appear in queries',
            type: ApiFieldType.number,
            isRequired: false,
          ),
          const ApiField(
            name: 'class',
            label: 'Tax Class',
            hint: 'Tax class',
            isRequired: false,
          ),
          const ApiField(
            name: 'api_version',
            label: 'API Version',
            hint: 'WooCommerce API version (default: v3)',
            isRequired: false,
          ),
        ],
      };
}
