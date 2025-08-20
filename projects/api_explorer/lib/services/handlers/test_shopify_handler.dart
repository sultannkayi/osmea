import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/access/access_scope/abstract/access_scope_service.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

/// Test handler to debug Shopify API issues
class TestShopifyHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    try {
      // Debug: Print current network configuration
      debugPrint('🔍 [DEBUG] ApiNetwork.storeName: "${ApiNetwork.storeName}"');
      debugPrint(
          '🔍 [DEBUG] ApiNetwork.shopifyAccessToken: "${ApiNetwork.shopifyAccessToken.isNotEmpty ? "SET" : "EMPTY"}"');
      debugPrint('🔍 [DEBUG] ApiNetwork.apiVersion: "${ApiNetwork.apiVersion}"');
      debugPrint('🔍 [DEBUG] ApiNetwork.baseUrl: "${ApiNetwork.baseUrl}"');

      // Test a simple Shopify API call
      final response = await GetIt.I.get<AccessScopeService>().accessScope();

      return {
        "status": "success",
        "message": "Shopify API test successful",
        "data": response.toJson(),
        "debug": {
          "storeName": ApiNetwork.storeName,
          "hasToken": ApiNetwork.shopifyAccessToken.isNotEmpty,
          "apiVersion": ApiNetwork.apiVersion,
          "baseUrl": ApiNetwork.baseUrl,
        },
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      debugPrint('❌ [DEBUG] Shopify API test failed: $e');

      return {
        "status": "error",
        "message": "Shopify API test failed: $e",
        "debug": {
          "storeName": ApiNetwork.storeName,
          "hasToken": ApiNetwork.shopifyAccessToken.isNotEmpty,
          "apiVersion": ApiNetwork.apiVersion,
          "baseUrl": ApiNetwork.baseUrl,
          "error": e.toString(),
        },
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  @override
  List<String> get supportedMethods => ['GET'];

  @override
  Map<String, List<ApiField>> get requiredFields => {};
}
