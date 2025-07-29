import 'package:apis/network/remote/woocommerce/shipping_zones/method/freezed_model/response/list_all_shipping_methods_from_shipping_zone_response.dart';
import 'package:apis/network/remote/woocommerce/shipping_zones/method/freezed_model/request/include_shipping_method_to_shipping_zone_request.dart';
import 'package:apis/network/remote/woocommerce/shipping_zones/method/freezed_model/response/include_shipping_method_to_shipping_zone_response.dart';
import 'package:apis/network/remote/woocommerce/shipping_zones/method/freezed_model/response/retrieve_shipping_method_from_shipping_zone_response.dart';
import 'package:apis/network/remote/woocommerce/shipping_zones/method/freezed_model/response/update_shipping_method_from_shipping_zone_response.dart';
import 'package:apis/network/remote/woocommerce/shipping_zones/method/freezed_model/response/delete_shipping_method_from_shipping_zone_response.dart';

/// 🔑 Abstract contract for WooCommerce Shipping Zone Methods Service
/// Defines the interface for all shipping zone method-related operations in WooCommerce API
abstract class ShippingZoneMethodsService {
  /// 📋 Retrieves a list of all shipping methods from a shipping zone from the WooCommerce API.
  Future<List<ListAllShippingMethodsFromShippingZoneResponse>>
      listAllShippingMethodsFromShippingZone({
    required String apiVersion,
    required int zoneId,
    String? context,
    int? page,
    int? perPage,
  });

  /// ➕ Includes a shipping method to a shipping zone in the WooCommerce API.
  Future<IncludeShippingMethodToShippingZoneResponse>
      includeShippingMethodToShippingZone({
    required String apiVersion,
    required int zoneId,
    required IncludeShippingMethodToShippingZoneRequest methodData,
  });

  /// 🎯 Retrieves a specific shipping method from a shipping zone by ID from the WooCommerce API.
  Future<RetrieveShippingMethodFromShippingZoneResponse>
      retrieveShippingMethodFromShippingZone({
    required String apiVersion,
    required int zoneId,
    required int methodId,
    String? context,
  });

  /// 🔄 Updates an existing shipping method in a shipping zone in the WooCommerce API.
  Future<UpdateShippingMethodFromShippingZoneResponse>
      updateShippingMethodFromShippingZone({
    required String apiVersion,
    required int zoneId,
    required int methodId,
    int? order,
    bool? enabled,
    Map<String, dynamic>? settings,
  });

  /// 🗑️ Deletes a shipping method from a shipping zone in the WooCommerce API.
  Future<DeleteShippingMethodFromShippingZoneResponse>
      deleteShippingMethodFromShippingZone({
    required String apiVersion,
    required int zoneId,
    required int methodId,
    bool? force,
  });
}
