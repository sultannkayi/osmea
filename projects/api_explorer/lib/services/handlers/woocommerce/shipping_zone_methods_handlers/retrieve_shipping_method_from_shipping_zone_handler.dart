import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/shipping_zones/method/abstract/shipping_zone_methods_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:get_it/get_it.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:dio/dio.dart';

///*******************************************************************
///******************* 🎯 RETRIEVE SHIPPING METHOD FROM SHIPPING ZONE HANDLER ******************
///*******************************************************************

class RetrieveShippingMethodFromShippingZoneHandler
    implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'GET') {
      return {
        "status": "error",
        "message":
            "Method $method not supported for Retrieve Shipping Method from Shipping Zone API",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      // Parse required parameters
      final apiVersion = params['api_version'] ?? WooNetwork.apiVersion;
      final zoneId = int.parse(params['zone_id']!);
      final methodId = int.parse(params['method_id']!);

      // Parse optional parameters
      final context =
          params['context']?.isNotEmpty == true ? params['context'] : null;

      final response = await GetIt.I<ShippingZoneMethodsService>()
          .retrieveShippingMethodFromShippingZone(
        apiVersion: apiVersion,
        zoneId: zoneId,
        methodId: methodId,
        context: context,
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
        "message": "Failed to retrieve shipping method from shipping zone: $e",
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
            name: 'method_id',
            label: 'Method ID',
            hint: 'The ID of the shipping method to retrieve',
          ),
          ApiField(
            name: 'context',
            label: 'Context',
            hint: 'Scope under which the request is made (optional)',
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
      case 500:
        return 'Internal server error: WooCommerce server error';
      default:
        return 'Network error: ${e.message}';
    }
  }
}
