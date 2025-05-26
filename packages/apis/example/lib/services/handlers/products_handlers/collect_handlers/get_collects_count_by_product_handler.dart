import 'package:apis/apis.dart';
import 'package:apis/network/remote/products/collect/abstract/collect_service.dart';
import 'package:example/services/api_request_handler.dart';
import 'package:example/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///*******************************************************************
///***** 🔢 GET COLLECTS COUNT BY PRODUCT (Product ID) *************
///*******************************************************************

class GetCollectsCountByProductHandler implements ApiRequestHandler {
  
  /// Helper method to clean and validate parameters
  String? _cleanParam(String? param) {
    if (param == null) return null;
    final trimmed = param.trim();
    return trimmed.isEmpty ? null : trimmed;
  }

  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'GET') {
      return {
        "status": "error",
        "message": "Method $method not supported. Only GET is allowed.",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    // Extract required product_id parameter
    final productId = _cleanParam(params['product_id']);
    if (productId == null) {
      return {
        "status": "error",
        "message": "Product ID is required",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      // Call the API method with product filter
      final response = await GetIt.I<CollectService>().getCollectsCountByProduct(
        apiVersion: ApiNetwork.apiVersion,
        productId: productId,
      );

      // Return success response
      return {
        "status": "success",
        "message": "Collects count by product retrieved successfully",
        "count": response.count,
        "params": {
          "product_id": productId,
        },
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      // Handle errors
      return {
        "status": "error",
        "message": "Failed to retrieve collects count by product: ${e.toString()}",
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
        name: 'product_id',
        label: 'Product ID',
        hint: 'The ID of the product to count collects for',
        isRequired: true,
      ),
    ],
  };
}
