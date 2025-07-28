import 'package:apis/network/remote/woocommerce/settings/freezed_model/response/list_settings_groups_response.dart';
import 'package:apis/network/remote/woocommerce/settings/freezed_model/response/retrieve_setting_option_response.dart';
import 'package:apis/network/remote/woocommerce/settings/freezed_model/request/update_settings_option_request.dart';
import 'package:apis/network/remote/woocommerce/settings/freezed_model/response/update_settings_option_response.dart';

/// 🔑 Abstract contract for WooCommerce Settings Service
/// Implement this to fetch and update settings from WooCommerce API! 🌐
abstract class SettingsService {
  /// 📋 Fetches all settings groups from the WooCommerce API.
  Future<List<ListSettingsGroupsResponse>> listSettingsGroups({
    String? apiVersion,
  });

  /// 🎯 Retrieves a specific setting option by group and option ID from the WooCommerce API.
  Future<RetrieveSettingOptionResponse> retrieveSettingOption({
    String? apiVersion,
    String? groupId,
    String? optionId,
  });

  /// 🔄 Updates a specific setting option in the WooCommerce API.
  Future<UpdateSettingsOptionResponse> updateSettingOption({
    String? apiVersion,
    String? groupId,
    String? optionId,
    UpdateSettingsOptionRequest? request,
  });


}
