import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/shipping_zones/shipping_zone/abstract/shipping_zones_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:get_it/get_it.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'dart:convert';

///*******************************************************************
///******************* 🔄 UPDATE SHIPPING ZONE HANDLER ******************
///*******************************************************************

class UpdateShippingZoneHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'PUT') {
      return {
        "status": "error",
        "message": "Method $method not supported for Update Shipping Zone API",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      // Parse required parameters
      final apiVersion = params['api_version'] ?? WooNetwork.apiVersion;
      final zoneId = int.parse(params['zone_id']!);

      // Parse optional parameters
      final name = params['name']?.isNotEmpty == true ? params['name'] : null;
      final order = params['order']?.isNotEmpty == true
          ? int.tryParse(params['order']!)
          : null;

      // Parse locations if provided
      List<Map<String, dynamic>>? locations;
      if (params['locations']?.isNotEmpty == true) {
        try {
          final locationsList = jsonDecode(params['locations']!) as List;
          locations = locationsList.map((location) {
            final locationMap = location as Map<String, dynamic>;
            return {
              'code': locationMap['code'],
              'type': locationMap['type'],
            };
          }).toList();
        } catch (e) {
          return {
            "status": "error",
            "message": "Invalid locations JSON format: $e",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }
      }

      // Create zone data map
      final zoneData = <String, dynamic>{};
      if (name != null) zoneData['name'] = name;
      if (order != null) zoneData['order'] = order;
      if (locations != null) zoneData['locations'] = locations;

      final response = await GetIt.I<ShippingZonesService>().updateShippingZone(
        apiVersion: apiVersion,
        zoneId: zoneId,
        zoneData: zoneData,
      );

      return {
        "status": "success",
        "shipping_zone": response.toJson(),
        "params": params,
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      return {
        "status": "error",
        "message": "Failed to update shipping zone: $e",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  @override
  List<String> get supportedMethods => ['PUT'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'PUT': [
          ApiField(
            name: 'api_version',
            label: 'API Version',
            hint: 'WooCommerce API version (e.g., v3)',
          ),
          ApiField(
            name: 'zone_id',
            label: 'Zone ID',
            hint: 'The ID of the shipping zone to update',
          ),
          ApiField(
            name: 'name',
            label: 'Name',
            hint: 'Shipping zone name (optional)',
          ),
          ApiField(
            name: 'order',
            label: 'Order',
            hint: 'Shipping zone sort order (optional)',
          ),
          ApiField(
            name: 'locations',
            label: 'Locations',
            hint: 'Shipping zone locations as JSON array (optional)',
          ),
        ],
      };
}
