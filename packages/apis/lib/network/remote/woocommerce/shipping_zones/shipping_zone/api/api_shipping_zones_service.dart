import 'package:apis/apis.dart';
import 'package:apis/dio_config/api_dio_client.dart';
import 'package:apis/network/remote/woocommerce/shipping_zones/shipping_zone/abstract/shipping_zones_service.dart';
import 'package:apis/network/remote/woocommerce/shipping_zones/shipping_zone/freezed_model/response/list_all_shipping_zones_response.dart';
import 'package:apis/network/remote/woocommerce/shipping_zones/shipping_zone/freezed_model/request/create_shipping_zone_request.dart';
import 'package:apis/network/remote/woocommerce/shipping_zones/shipping_zone/freezed_model/response/create_shipping_zone_response.dart';
import 'package:apis/network/remote/woocommerce/shipping_zones/shipping_zone/freezed_model/response/retrieve_shipping_zone_response.dart';
import 'package:apis/network/remote/woocommerce/shipping_zones/shipping_zone/freezed_model/response/update_shipping_zone_response.dart';
import 'package:apis/network/remote/woocommerce/shipping_zones/shipping_zone/freezed_model/response/delete_shipping_zone_response.dart';
import 'package:apis/network/remote/woocommerce/shipping_zones/shipping_zone/freezed_model/response/retrieve_shipping_zone_location_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'api_shipping_zones_service.g.dart';

/// 🌐 ShippingZonesServiceClient
/// Retrofit client for WooCommerce Shipping Zones API.
/// Make sure WooNetwork.storeUrl, username, and password are set before using! 🏬🔑
@RestApi()
@Injectable(as: ShippingZonesService)
abstract class ShippingZonesServiceClient implements ShippingZonesService {
  /// 🏭 Factory for dependency injection
  @factoryMethod
  factory ShippingZonesServiceClient(Dio dio) => _ShippingZonesServiceClient(
        ApiDioClient.wooDio(),
        baseUrl: WooNetwork.baseUrl,
      );

  /// 📋 Get all shipping zones from WooCommerce API
  @override
  @GET('/wp-json/wc/{api_version}/shipping/zones')
  Future<List<ListAllShippingZonesResponse>> listAllShippingZones({
    @Path('api_version') required String apiVersion,
    @Query('context') String? context,
    @Query('page') int? page,
    @Query('per_page') int? perPage,
  });

  /// ➕ Create a new shipping zone in WooCommerce API
  @override
  @POST('/wp-json/wc/{api_version}/shipping/zones')
  Future<CreateShippingZoneResponse> createShippingZone({
    @Path('api_version') required String apiVersion,
    @Body() required CreateShippingZoneRequest zoneData,
  });

  /// 🎯 Get a specific shipping zone by ID from WooCommerce API
  @override
  @GET('/wp-json/wc/{api_version}/shipping/zones/{zone_id}')
  Future<RetrieveShippingZoneResponse> retrieveShippingZone({
    @Path('api_version') required String apiVersion,
    @Path('zone_id') required int zoneId,
    @Query('context') String? context,
  });

  /// 🔄 Update an existing shipping zone in WooCommerce API
  @override
  @PUT('/wp-json/wc/{api_version}/shipping/zones/{zone_id}')
  Future<UpdateShippingZoneResponse> updateShippingZone({
    @Path('api_version') required String apiVersion,
    @Path('zone_id') required int zoneId,
    @Body() required Map<String, dynamic> zoneData,
  });

  /// 🗑️ Delete a shipping zone in WooCommerce API
  @override
  @DELETE('/wp-json/wc/{api_version}/shipping/zones/{zone_id}')
  Future<DeleteShippingZoneResponse> deleteShippingZone({
    @Path('api_version') required String apiVersion,
    @Path('zone_id') required int zoneId,
    @Query('force') bool? force,
  });

  /// 📍 Get shipping zone locations from WooCommerce API
  @override
  @GET('/wp-json/wc/{api_version}/shipping/zones/{zone_id}/locations')
  Future<List<RetrieveShippingZoneLocationResponse>>
      retrieveShippingZoneLocation({
    @Path('api_version') required String apiVersion,
    @Path('zone_id') required int zoneId,
    @Query('context') String? context,
  });
}
