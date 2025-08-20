import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/shipping_zones/method/abstract/shipping_zone_methods_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:get_it/get_it.dart';
import 'package:api_explorer/services/api_service_registry.dart';

///*******************************************************************
///******************* 🗑️ DELETE SHIPPING METHOD FROM SHIPPING ZONE HANDLER ******************
///*******************************************************************

class DeleteShippingMethodFromShippingZoneHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'DELETE') {
      return {
        "status": "error",
        "message":
            "Method $method not supported for Delete Shipping Method from Shipping Zone API",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      // Parse required parameters
      final apiVersion = params['api_version'] ?? WooNetwork.apiVersion;
      final zoneId = int.parse(params['zone_id']!);
      final methodId = int.parse(params['method_id']!);

      // Parse optional parameters
      final force = params['force']?.isNotEmpty == true
          ? params['force'] == 'true'
          : null;

      final response = await GetIt.I<ShippingZoneMethodsService>()
          .deleteShippingMethodFromShippingZone(
        apiVersion: apiVersion,
        zoneId: zoneId,
        methodId: methodId,
        force: force,
      );

      return {
        "status": "success",
        "shipping_method": response.toJson(),
        "params": params,
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      return {
        "status": "error",
        "message": "Failed to delete shipping method from shipping zone: $e",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  @override
  List<String> get supportedMethods => ['DELETE'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'DELETE': [
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
            name: 'method_id',
            label: 'Method ID',
            hint: 'The ID of the shipping method to delete',
          ),
          ApiField(
            name: 'force',
            label: 'Force',
            hint:
                'Whether to bypass trash and force deletion (true/false, optional)',
          ),
        ],
      };
}
