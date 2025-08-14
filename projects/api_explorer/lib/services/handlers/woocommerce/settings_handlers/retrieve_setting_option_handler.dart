import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/settings/abstract/settings_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:get_it/get_it.dart';
import 'package:api_explorer/services/api_service_registry.dart';

///*******************************************************************
///*************** 🎯 RETRIEVE SETTING OPTION HANDLER ****************
///*******************************************************************

class RetrieveSettingOptionHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'GET') {
      return {
        "status": "error",
        "message":
            "Method $method not supported for Retrieve Setting Option API",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
    try {
      // Parse query parameters
      final groupId = params['group_id'];
      final optionId = params['option_id'];
      final apiVersion = params['api_version'] ?? WooNetwork.apiVersion;

      if (groupId == null ||
          groupId.isEmpty ||
          optionId == null ||
          optionId.isEmpty) {
        return {
          "status": "error",
          "message": "group_id and option_id are required",
          "params": params,
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      final response = await GetIt.I<SettingsService>().retrieveSettingOption(
        apiVersion: apiVersion,
        groupId: groupId,
        optionId: optionId,
      );

      return {
        "status": "success",
        "setting": response.toJson(),
        "params": params,
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      return {
        "status": "error",
        "message": "Failed to retrieve setting option: ${e.toString()}",
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
            name: 'group_id',
            label: 'Group ID',
            hint: 'ID of the settings group',
          ),
          const ApiField(
            name: 'option_id',
            label: 'Option ID',
            hint: 'ID of the setting option',
          ),
          const ApiField(
            name: 'api_version',
            label: 'API Version',
            hint: 'WooCommerce API version (default: v3)',
          ),
        ],
      };
}
