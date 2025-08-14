import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/shipping_zones/method/abstract/shipping_zone_methods_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:get_it/get_it.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

///*******************************************************************
///******************* 🔄 UPDATE SHIPPING METHOD FROM SHIPPING ZONE HANDLER ******************
///*******************************************************************

class UpdateShippingMethodFromShippingZoneHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'PUT') {
      return {
        "status": "error",
        "message":
            "Method $method not supported for Update Shipping Method from Shipping Zone API",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      // Parse required parameters
      final apiVersion = params['api_version'] ?? WooNetwork.apiVersion;
      final zoneId = int.parse(params['zone_id']!);
      final methodId = int.parse(params['method_id']!);

      // Parse optional query parameters
      final order = params['order']?.isNotEmpty == true
          ? int.tryParse(params['order']!)
          : null;
      final enabled = params['enabled']?.isNotEmpty == true
          ? params['enabled'] == 'true'
          : null;

      // Parse settings if provided
      Map<String, dynamic>? settings;
      if (params['settings']?.isNotEmpty == true) {
        try {
          settings = Map<String, dynamic>.from(jsonDecode(params['settings']!));
        } catch (e) {
          return {
            "status": "error",
            "message": "Invalid settings JSON format: $e",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }
      }

      final response = await GetIt.I<ShippingZoneMethodsService>()
          .updateShippingMethodFromShippingZone(
        apiVersion: apiVersion,
        zoneId: zoneId,
        methodId: methodId,
        order: order,
        enabled: enabled,
        settings: settings,
      );

      return {
        "status": "success",
        "shipping_method": response.toJson(),
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
        "message": "Failed to update shipping method from shipping zone: $e",
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
            hint: 'The ID of the shipping zone',
          ),
          ApiField(
            name: 'method_id',
            label: 'Method ID',
            hint: 'The ID of the shipping method to update',
          ),
          ApiField(
            name: 'order',
            label: 'Order',
            hint: 'Shipping method sort order (optional)',
          ),
          ApiField(
            name: 'enabled',
            label: 'Enabled',
            hint: 'Shipping method enabled status (true/false, optional)',
          ),
          ApiField(
            name: 'settings',
            label: 'Settings',
            hint: 'Shipping method settings as JSON string (optional)',
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
      case 404:
        return 'Not found: Shipping zone or method not found';
      case 409:
        return 'Conflict: Shipping method configuration conflict';
      case 500:
        return 'Internal server error: WooCommerce server error';
      default:
        return 'Network error: ${e.message}';
    }
  }
}
