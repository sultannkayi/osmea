import 'package:apis/apis.dart';
import 'package:apis/dio_config/api_dio_client.dart';
import 'package:apis/network/remote/woocommerce/settings/abstract/settings_service.dart';
import 'package:apis/network/remote/woocommerce/settings/freezed_model/response/list_settings_groups_response.dart';
import 'package:apis/network/remote/woocommerce/settings/freezed_model/response/retrieve_setting_option_response.dart';
import 'package:apis/network/remote/woocommerce/settings/freezed_model/request/update_settings_option_request.dart';
import 'package:apis/network/remote/woocommerce/settings/freezed_model/response/update_settings_option_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'api_settings_service.g.dart';

/// 🌐 SettingsServiceClient
/// Retrofit client for WooCommerce Settings API.
/// Make sure WooNetwork.storeUrl, username, and password are set before using! 🏬🔑
@RestApi()
@Injectable(as: SettingsService)
abstract class SettingsServiceClient implements SettingsService {
  /// 🏭 Factory for dependency injection
  @factoryMethod
  factory SettingsServiceClient(Dio dio) => _SettingsServiceClient(
        ApiDioClient.wooDio(),
        baseUrl: WooNetwork.baseUrl,
      );

  /// 📋 Get all settings groups from WooCommerce API
  @override
  @GET('/wp-json/wc/{api_version}/settings')
  Future<List<ListSettingsGroupsResponse>> listSettingsGroups({
    @Path('api_version') String? apiVersion,
  });

  /// 🎯 Get a specific setting option by group ID and option ID from WooCommerce API
  @override
  @GET('/wp-json/wc/{api_version}/settings/{group_id}/{option_id}')
  Future<RetrieveSettingOptionResponse> retrieveSettingOption({
    @Path('api_version') String? apiVersion,
    @Path('group_id') String? groupId,
    @Path('option_id') String? optionId,
  });

  /// 🔄 Update a setting option in WooCommerce API
  @override
  @PUT('/wp-json/wc/{api_version}/settings/{group_id}/{option_id}')
  Future<UpdateSettingsOptionResponse> updateSettingOption({
    @Path('api_version') String? apiVersion,
    @Path('group_id') String? groupId,
    @Path('option_id') String? optionId,
    @Body() UpdateSettingsOptionRequest? request,
  });

}
