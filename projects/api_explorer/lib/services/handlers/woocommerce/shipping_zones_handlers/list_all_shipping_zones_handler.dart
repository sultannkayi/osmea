import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/shipping_zones/shipping_zone/abstract/shipping_zones_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:get_it/get_it.dart';
import 'package:api_explorer/services/api_service_registry.dart';

///*******************************************************************
///******************* 📋 LIST ALL SHIPPING ZONES HANDLER ******************
///*******************************************************************

class ListAllShippingZonesHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'GET') {
      return {
        "status": "error",
        "message":
            "Method $method not supported for List All Shipping Zones API",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      // Parse required parameters
      final apiVersion = params['api_version'] ?? WooNetwork.apiVersion;

      // Parse optional parameters
      final context =
          params['context']?.isNotEmpty == true ? params['context'] : null;
      final page = params['page']?.isNotEmpty == true
          ? int.tryParse(params['page']!)
          : null;
      final perPage = params['per_page']?.isNotEmpty == true
          ? int.tryParse(params['per_page']!)
          : null;

      final response =
          await GetIt.I<ShippingZonesService>().listAllShippingZones(
        apiVersion: apiVersion,
        context: context,
        page: page,
        perPage: perPage,
      );

      return {
        "status": "success",
        "shipping_zones": response.map((e) => e.toJson()).toList(),
        "count": response.length,
        "params": params,
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      return {
        "status": "error",
        "message": "Failed to list shipping zones: $e",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  @override
  List<String> get supportedMethods => ['GET'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'GET': [
          ApiField(
            name: 'api_version',
            label: 'API Version',
            hint: 'WooCommerce API version (e.g., v3)',
          ),
          ApiField(
            name: 'context',
            label: 'Context',
            hint: 'Scope under which the request is made (optional)',
          ),
          ApiField(
            name: 'page',
            label: 'Page',
            hint: 'Current page of the collection (optional)',
          ),
          ApiField(
            name: 'per_page',
            label: 'Per Page',
            hint:
                'Maximum number of items to be returned in result set (optional)',
          ),
        ],
      };
}
