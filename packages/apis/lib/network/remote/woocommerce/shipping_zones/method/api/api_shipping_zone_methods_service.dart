import 'package:apis/apis.dart';
import 'package:apis/dio_config/api_dio_client.dart';
import 'package:apis/network/remote/woocommerce/shipping_zones/method/abstract/shipping_zone_methods_service.dart';
import 'package:apis/network/remote/woocommerce/shipping_zones/method/freezed_model/response/list_all_shipping_methods_from_shipping_zone_response.dart';
import 'package:apis/network/remote/woocommerce/shipping_zones/method/freezed_model/request/include_shipping_method_to_shipping_zone_request.dart';
import 'package:apis/network/remote/woocommerce/shipping_zones/method/freezed_model/response/include_shipping_method_to_shipping_zone_response.dart';
import 'package:apis/network/remote/woocommerce/shipping_zones/method/freezed_model/response/retrieve_shipping_method_from_shipping_zone_response.dart';
import 'package:apis/network/remote/woocommerce/shipping_zones/method/freezed_model/response/update_shipping_method_from_shipping_zone_response.dart';
import 'package:apis/network/remote/woocommerce/shipping_zones/method/freezed_model/response/delete_shipping_method_from_shipping_zone_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'api_shipping_zone_methods_service.g.dart';

/// 🌐 ShippingZoneMethodsServiceClient
/// Retrofit client for WooCommerce Shipping Zone Methods API.
/// Make sure WooNetwork.storeUrl, username, and password are set before using! 🏬🔑
@RestApi()
@Injectable(as: ShippingZoneMethodsService)
abstract class ShippingZoneMethodsServiceClient
    implements ShippingZoneMethodsService {
  /// 🏭 Factory for dependency injection
  @factoryMethod
  factory ShippingZoneMethodsServiceClient(Dio dio) =>
      _ShippingZoneMethodsServiceClient(
        ApiDioClient.wooDio(),
        baseUrl: WooNetwork.baseUrl,
      );

  /// 📋 Get shipping methods from a shipping zone in WooCommerce API
  @override
  @GET('/wp-json/wc/{api_version}/shipping/zones/{zoneId}/methods')
  Future<List<ListAllShippingMethodsFromShippingZoneResponse>>
      listAllShippingMethodsFromShippingZone({
    @Path('api_version') required String apiVersion,
    @Path('zoneId') required int zoneId,
    @Query('context') String? context,
    @Query('page') int? page,
    @Query('per_page') int? perPage,
  });

  /// ➕ Include a shipping method to a shipping zone in WooCommerce API
  @override
  @POST('/wp-json/wc/{api_version}/shipping/zones/{zoneId}/methods')
  Future<IncludeShippingMethodToShippingZoneResponse>
      includeShippingMethodToShippingZone({
    @Path('api_version') required String apiVersion,
    @Path('zoneId') required int zoneId,
    @Body() required IncludeShippingMethodToShippingZoneRequest methodData,
  });

  /// 🎯 Get a specific shipping method from a shipping zone by ID from WooCommerce API
  @override
  @GET('/wp-json/wc/{api_version}/shipping/zones/{zoneId}/methods/{methodId}')
  Future<RetrieveShippingMethodFromShippingZoneResponse>
      retrieveShippingMethodFromShippingZone({
    @Path('api_version') required String apiVersion,
    @Path('zoneId') required int zoneId,
    @Path('methodId') required int methodId,
    @Query('context') String? context,
  });

  /// 🔄 Update an existing shipping method in a shipping zone in WooCommerce API
  @override
  @PUT('/wp-json/wc/{api_version}/shipping/zones/{zoneId}/methods/{methodId}')
  Future<UpdateShippingMethodFromShippingZoneResponse>
      updateShippingMethodFromShippingZone({
    @Path('api_version') required String apiVersion,
    @Path('zoneId') required int zoneId,
    @Path('methodId') required int methodId,
    @Query('order') int? order,
    @Query('enabled') bool? enabled,
    @Query('settings') Map<String, dynamic>? settings,
  });

  /// 🗑️ Delete a shipping method from a shipping zone in WooCommerce API
  @override
  @DELETE(
      '/wp-json/wc/{api_version}/shipping/zones/{zoneId}/methods/{methodId}')
  Future<DeleteShippingMethodFromShippingZoneResponse>
      deleteShippingMethodFromShippingZone({
    @Path('api_version') required String apiVersion,
    @Path('zoneId') required int zoneId,
    @Path('methodId') required int methodId,
    @Query('force') bool? force,
  });
}
