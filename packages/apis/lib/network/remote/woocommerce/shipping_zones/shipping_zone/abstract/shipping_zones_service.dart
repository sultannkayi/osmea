import 'package:apis/network/remote/woocommerce/shipping_zones/shipping_zone/freezed_model/response/list_all_shipping_zones_response.dart';
import 'package:apis/network/remote/woocommerce/shipping_zones/shipping_zone/freezed_model/request/create_shipping_zone_request.dart';
import 'package:apis/network/remote/woocommerce/shipping_zones/shipping_zone/freezed_model/response/create_shipping_zone_response.dart';
import 'package:apis/network/remote/woocommerce/shipping_zones/shipping_zone/freezed_model/response/retrieve_shipping_zone_response.dart';
import 'package:apis/network/remote/woocommerce/shipping_zones/shipping_zone/freezed_model/response/update_shipping_zone_response.dart';
import 'package:apis/network/remote/woocommerce/shipping_zones/shipping_zone/freezed_model/response/delete_shipping_zone_response.dart';
import 'package:apis/network/remote/woocommerce/shipping_zones/shipping_zone/freezed_model/response/retrieve_shipping_zone_location_response.dart';

/// 🔑 Abstract contract for WooCommerce Shipping Zones Service
/// Defines the interface for all shipping zone-related operations in WooCommerce API
abstract class ShippingZonesService {
  /// 📋 Retrieves a list of all shipping zones from the WooCommerce API.
  Future<List<ListAllShippingZonesResponse>> listAllShippingZones({
    required String apiVersion,
    String? context,
    int? page,
    int? perPage,
  });

  /// ➕ Creates a new shipping zone in the WooCommerce API.
  Future<CreateShippingZoneResponse> createShippingZone({
    required String apiVersion,
    required CreateShippingZoneRequest zoneData,
  });

  /// 🎯 Retrieves a specific shipping zone by ID from the WooCommerce API.
  Future<RetrieveShippingZoneResponse> retrieveShippingZone({
    required String apiVersion,
    required int zoneId,
    String? context,
  });

  /// 🔄 Updates an existing shipping zone in the WooCommerce API.
  Future<UpdateShippingZoneResponse> updateShippingZone({
    required String apiVersion,
    required int zoneId,
    required Map<String, dynamic> zoneData,
  });

  /// 🗑️ Deletes a shipping zone in the WooCommerce API.
  Future<DeleteShippingZoneResponse> deleteShippingZone({
    required String apiVersion,
    required int zoneId,
    bool? force,
  });

  /// 📍 Retrieves shipping zone locations from the WooCommerce API.
  Future<List<RetrieveShippingZoneLocationResponse>>
      retrieveShippingZoneLocation({
    required String apiVersion,
    required int zoneId,
    String? context,
  });
}
