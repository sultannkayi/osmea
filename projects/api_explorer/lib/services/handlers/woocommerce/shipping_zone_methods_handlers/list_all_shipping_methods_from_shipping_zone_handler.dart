import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/shipping_zones/method/abstract/shipping_zone_methods_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:get_it/get_it.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:dio/dio.dart';

///*******************************************************************
///******************* 📋 LIST ALL SHIPPING METHODS FROM SHIPPING ZONE HANDLER ******************
///*******************************************************************

class ListAllShippingMethodsFromShippingZoneHandler
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
            "Method $method not supported for List All Shipping Methods from Shipping Zone API",
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
      final page = params['page']?.isNotEmpty == true
          ? int.tryParse(params['page']!)
          : null;
      final perPage = params['per_page']?.isNotEmpty == true
          ? int.tryParse(params['per_page']!)
          : null;

      final response = await GetIt.I<ShippingZoneMethodsService>()
          .listAllShippingMethodsFromShippingZone(
        apiVersion: apiVersion,
        zoneId: zoneId,
        context: context,
        page: page,
        perPage: perPage,
      );

      return {
        "status": "success",
        "shipping_methods": response.map((e) => e.toJson()).toList(),
        "count": response.length,
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
        "message": "Failed to list shipping methods from shipping zone: $e",
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

  String _handleDioException(DioException e) {
    switch (e.response?.statusCode) {
      case 400:
        return 'Bad request: Invalid parameters provided';
      case 401:
        return 'Unauthorized: Check your authentication credentials';
      case 403:
        return 'Forbidden: You do not have permission to access this resource';
      case 404:
        return 'Not found: Shipping zone not found';
      case 500:
        return 'Internal server error: WooCommerce server error';
      default:
        return 'Network error: ${e.message}';
    }
  }
}
