import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/settings/abstract/settings_service.dart';
import 'package:apis/network/remote/woocommerce/settings/freezed_model/request/update_settings_option_request.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:get_it/get_it.dart';
import 'package:api_explorer/services/api_service_registry.dart';

///*******************************************************************
///******************* 🔄 UPDATE SETTINGS OPTION HANDLER *************
///*******************************************************************

class UpdateSettingsOptionHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'PUT') {
      return {
        "status": "error",
        "message":
            "Method $method not supported for Update Settings Option API",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    // Validate required parameter
    if (!params.containsKey('group_id') ||
        params['group_id']!.isEmpty ||
        !params.containsKey('option_id') ||
        params['option_id']!.isEmpty) {
      return {
        "status": "error",
        "message": "group_id and option_id are required",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      // Parse parameters
      final groupId = params['group_id']!;
      final optionId = params['option_id']!;
      final apiVersion = params['api_version'] ?? WooNetwork.apiVersion;

      // Only include non-empty fields
      final request = UpdateSettingsOptionRequest(
        id: params['id'],
        label: params['label'],
        description: params['description'],
        type: params['type'],
        updateSettingsOptionRequestDefault: params['default'],
        tip: params['tip'],
        value: params['value'],
        groupId: params['group_id'],
      );
      final jsonData = request.toJson();
      jsonData.removeWhere(
          (key, value) => value == null || (value is String && value.isEmpty));

      final response = await GetIt.I<SettingsService>().updateSettingOption(
        apiVersion: apiVersion,
        groupId: groupId,
        optionId: optionId,
        request: UpdateSettingsOptionRequest.fromJson(jsonData),
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
        "message": "Failed to update setting option: ${e.toString()}",
        "params": params,
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  @override
  List<String> get supportedMethods => ['PUT'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'PUT': [
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
            name: 'id',
            label: 'ID',
            hint: 'ID of the setting option',
          ),
          const ApiField(
            name: 'label',
            label: 'Label',
            hint: 'Label of the setting option',
          ),
          const ApiField(
            name: 'description',
            label: 'Description',
            hint: 'Description of the setting option',
          ),
          const ApiField(
            name: 'type',
            label: 'Type',
            hint: 'Type of the setting option',
          ),
          const ApiField(
            name: 'default',
            label: 'Default',
            hint: 'Default value of the setting option',
          ),
          const ApiField(
            name: 'tip',
            label: 'Tip',
            hint: 'Tip for the setting option',
          ),
          const ApiField(
            name: 'value',
            label: 'Value',
            hint: 'Value of the setting option',
          ),
          const ApiField(
            name: 'api_version',
            label: 'API Version',
            hint: 'WooCommerce API version (default: v3)',
          ),
        ],
      };
}
