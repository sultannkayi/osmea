import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/shipping_zones/method/abstract/shipping_zone_methods_service.dart';
import 'package:apis/network/remote/woocommerce/shipping_zones/method/freezed_model/request/include_shipping_method_to_shipping_zone_request.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:get_it/get_it.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

///*******************************************************************
///******************* ➕ INCLUDE SHIPPING METHOD TO SHIPPING ZONE HANDLER ******************
///*******************************************************************

class IncludeShippingMethodToShippingZoneHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'POST') {
      return {
        "status": "error",
        "message":
            "Method $method not supported for Include Shipping Method to Shipping Zone API",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      // Parse required parameters
      final apiVersion = params['api_version'] ?? WooNetwork.apiVersion;
      final zoneId = int.parse(params['zone_id']!);
      final methodId = params['method_id']!;

      // Parse optional parameters
      final enabled = params['enabled']?.isNotEmpty == true
          ? params['enabled'] == 'true'
          : null;
      final order = params['order']?.isNotEmpty == true
          ? int.tryParse(params['order']!)
          : null;

      // Parse settings if provided
      Map<String, dynamic>? settings;
      if (params['settings']?.isNotEmpty == true) {
        try {
          settings = Map<String, dynamic>.from(
            jsonDecode(params['settings']!),
          );
        } catch (e) {
          return {
            "status": "error",
            "message": "Invalid settings JSON format: $e",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }
      } else {
        // Check for individual settings parameters
        final title = params['settings_title']?.isNotEmpty == true
            ? params['settings_title']
            : null;
        final taxStatus = params['settings_tax_status']?.isNotEmpty == true
            ? params['settings_tax_status']
            : null;
        final cost = params['settings_cost']?.isNotEmpty == true
            ? params['settings_cost']
            : null;
        final classCosts = params['settings_class_costs']?.isNotEmpty == true
            ? params['settings_class_costs']
            : null;
        final classCost91 = params['settings_class_cost_91']?.isNotEmpty == true
            ? params['settings_class_cost_91']
            : null;
        final classCost92 = params['settings_class_cost_92']?.isNotEmpty == true
            ? params['settings_class_cost_92']
            : null;
        final noClassCost = params['settings_no_class_cost']?.isNotEmpty == true
            ? params['settings_no_class_cost']
            : null;
        final type = params['settings_type']?.isNotEmpty == true
            ? params['settings_type']
            : null;

        // Only create settings if at least one parameter is provided
        if (title != null ||
            taxStatus != null ||
            cost != null ||
            classCosts != null ||
            classCost91 != null ||
            classCost92 != null ||
            noClassCost != null ||
            type != null) {
          settings = <String, dynamic>{};
          if (title != null) settings['title'] = title;
          if (taxStatus != null) settings['tax_status'] = taxStatus;
          if (cost != null) settings['cost'] = cost;
          if (classCosts != null) settings['class_costs'] = classCosts;
          if (classCost91 != null) settings['class_cost_91'] = classCost91;
          if (classCost92 != null) settings['class_cost_92'] = classCost92;
          if (noClassCost != null) settings['no_class_cost'] = noClassCost;
          if (type != null) settings['type'] = type;
        }
      }

      // Create request object
      final methodData = IncludeShippingMethodToShippingZoneRequest(
        methodId: methodId,
        enabled: enabled,
        order: order,
        settings: settings != null ? _parseSettings(settings) : null,
      );

      final response = await GetIt.I<ShippingZoneMethodsService>()
          .includeShippingMethodToShippingZone(
        apiVersion: apiVersion,
        zoneId: zoneId,
        methodData: methodData,
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
        "message": "Failed to include shipping method to shipping zone: $e",
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
            name: 'zone_id',
            label: 'Zone ID',
            hint: 'The ID of the shipping zone',
          ),
          ApiField(
            name: 'method_id',
            label: 'Method ID',
            hint: 'The ID of the shipping method to include',
          ),
          ApiField(
            name: 'enabled',
            label: 'Enabled',
            hint: 'Shipping method enabled status (true/false, optional)',
          ),
          ApiField(
            name: 'order',
            label: 'Order',
            hint: 'Shipping method sort order (optional)',
          ),
          ApiField(
            name: 'settings',
            label: 'Settings (JSON)',
            hint: 'Shipping method settings as JSON string (optional)',
          ),
          ApiField(
            name: 'settings_title',
            label: 'Settings Title',
            hint: 'Shipping method title (optional)',
          ),
          ApiField(
            name: 'settings_tax_status',
            label: 'Settings Tax Status',
            hint: 'Tax status (taxable, shipping, none) (optional)',
          ),
          ApiField(
            name: 'settings_cost',
            label: 'Settings Cost',
            hint: 'Shipping cost (optional)',
          ),
          ApiField(
            name: 'settings_class_costs',
            label: 'Settings Class Costs',
            hint: 'Shipping class costs (optional)',
          ),
          ApiField(
            name: 'settings_class_cost_91',
            label: 'Settings Class Cost 91',
            hint: 'Shipping class cost for class 91 (optional)',
          ),
          ApiField(
            name: 'settings_class_cost_92',
            label: 'Settings Class Cost 92',
            hint: 'Shipping class cost for class 92 (optional)',
          ),
          ApiField(
            name: 'settings_no_class_cost',
            label: 'Settings No Class Cost',
            hint: 'Cost when no shipping class (optional)',
          ),
          ApiField(
            name: 'settings_type',
            label: 'Settings Type',
            hint: 'Settings type (order, class) (optional)',
          ),
        ],
      };

  Settings? _parseSettings(Map<String, dynamic> settingsMap) {
    try {
      return Settings(
        title: settingsMap['title'] as String?,
        taxStatus: settingsMap['tax_status'] as String?,
        cost: settingsMap['cost'] as String?,
        classCosts: settingsMap['class_costs'] as String?,
        classCost91: settingsMap['class_cost_91'] as String?,
        classCost92: settingsMap['class_cost_92'] as String?,
        noClassCost: settingsMap['no_class_cost'] as String?,
        type: settingsMap['type'] as String?,
      );
    } catch (e) {
      throw Exception('Invalid settings structure: $e');
    }
  }

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
        return 'Conflict: Shipping method already exists in this zone';
      case 500:
        return 'Internal server error: WooCommerce server error';
      default:
        return 'Network error: ${e.message}';
    }
  }
}
