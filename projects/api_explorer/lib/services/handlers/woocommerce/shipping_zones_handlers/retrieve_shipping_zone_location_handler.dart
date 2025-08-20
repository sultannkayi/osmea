import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/shipping_zones/shipping_zone/abstract/shipping_zones_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:get_it/get_it.dart';
import 'package:api_explorer/services/api_service_registry.dart';

///*******************************************************************
///******************* 📍 RETRIEVE SHIPPING ZONE LOCATION HANDLER ******************
///*******************************************************************

class RetrieveShippingZoneLocationHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'GET') {
      return {
        "status": "error",
        "message":
            "Method $method not supported for Retrieve Shipping Zone Location API",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      // Parse required parameters
      final apiVersion = params['api_version'] ?? WooNetwork.apiVersion;
      final zoneId = int.parse(params['zone_id']!);

      // Parse optional parameters
      final context =
          params['context']?.isNotEmpty == true ? params['context'] : null;

      final response =
          await GetIt.I<ShippingZonesService>().retrieveShippingZoneLocation(
        apiVersion: apiVersion,
        zoneId: zoneId,
        context: context,
      );

      return {
        "status": "success",
        "shipping_zone_locations": response.map((e) => e.toJson()).toList(),
        "count": response.length,
        "params": params,
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      return {
        "status": "error",
        "message": "Failed to retrieve shipping zone location: $e",
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
            name: 'zone_id',
            label: 'Zone ID',
            hint: 'The ID of the shipping zone',
          ),
          ApiField(
            name: 'context',
            label: 'Context',
            hint: 'Scope under which the request is made (optional)',
          ),
        ],
      };
}
