import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/settings/abstract/settings_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:get_it/get_it.dart';
import 'package:api_explorer/services/api_service_registry.dart';

///*******************************************************************
///*************** 📋 LIST SETTINGS GROUPS HANDLER *******************
///*******************************************************************

class ListSettingsGroupsHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'GET') {
      return {
        "status": "error",
        "message": "Method $method not supported for List Settings Groups API",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
    try {
      // Parse query parameters
      final apiVersion = params['api_version'] ?? WooNetwork.apiVersion;

      final response = await GetIt.I<SettingsService>().listSettingsGroups(
        apiVersion: apiVersion,
      );

      return {
        "status": "success",
        "groups": response.map((e) => e.toJson()).toList(),
        "total": response.length,
        "params": params,
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      return {
        "status": "error",
        "message": "Failed to fetch settings groups: ${e.toString()}",
        "params": params,
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  @override
  List<String> get supportedMethods => ['GET'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'GET': [
          const ApiField(
            name: 'api_version',
            label: 'API Version',
            hint: 'WooCommerce API version (default: v3)',
          ),
        ],
      };
}
