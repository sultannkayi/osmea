import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/shipping_zones/shipping_zone/abstract/shipping_zones_service.dart';
import 'package:apis/network/remote/woocommerce/shipping_zones/shipping_zone/freezed_model/request/create_shipping_zone_request.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:get_it/get_it.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

///*******************************************************************
///******************* ➕ CREATE SHIPPING ZONE HANDLER ******************
///*******************************************************************

class CreateShippingZoneHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'POST') {
      return {
        "status": "error",
        "message": "Method $method not supported for Create Shipping Zone API",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      // Parse required parameters
      final apiVersion = params['api_version'] ?? WooNetwork.apiVersion;
      final name = params['name']!;

      // Parse optional parameters
      final order = params['order']?.isNotEmpty == true
          ? int.tryParse(params['order']!)
          : null;

      // Parse locations if provided
      List<Location>? locations;
      if (params['locations']?.isNotEmpty == true) {
        try {
          final locationsList = jsonDecode(params['locations']!) as List;
          locations = locationsList.map((location) {
            final locationMap = location as Map<String, dynamic>;
            return Location(
              code: locationMap['code'] as String?,
              type: locationMap['type'] as String?,
            );
          }).toList();
        } catch (e) {
          return {
            "status": "error",
            "message": "Invalid locations JSON format: $e",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }
      }

      // Create request object
      final zoneData = CreateShippingZoneRequest(
        name: name,
        order: order,
        locations: locations,
      );

      final response = await GetIt.I<ShippingZonesService>().createShippingZone(
        apiVersion: apiVersion,
        zoneData: zoneData,
      );

      return {
        "status": "success",
        "shipping_zone": response.toJson(),
        "params": params,
        "timestamp": DateTime.now().toIso8601String(),
      };
    } on DioException catch (e) {
      return {
        "status": "error",
        "message": _handleDioException(e),
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      return {
        "status": "error",
        "message": "Failed to create shipping zone: $e",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  @override
  List<String> get supportedMethods => ['POST'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'POST': [
          ApiField(
            name: 'api_version',
            label: 'API Version',
            hint: 'WooCommerce API version (e.g., v3)',
          ),
          ApiField(
            name: 'name',
            label: 'Name',
            hint: 'Shipping zone name (required)',
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

  String _handleDioException(DioException e) {
    switch (e.response?.statusCode) {
      case 400:
        return 'Bad request: Invalid parameters provided';
      case 401:
        return 'Unauthorized: Check your authentication credentials';
      case 403:
        return 'Forbidden: You do not have permission to access this resource';
      case 409:
        return 'Conflict: Shipping zone already exists';
      case 500:
        return 'Internal server error: WooCommerce server error';
      default:
        return 'Network error: ${e.message}';
    }
  }
}
