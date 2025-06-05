import 'package:apis/apis.dart';
import 'package:apis/network/remote/products/product/abstract/product_service.dart';
import 'package:apis/network/remote/products/product/freezed_model/request/show_hidden_product_request.dart'
    as product_request;
import 'package:example/services/api_request_handler.dart';
import 'package:example/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///**************************************************************
///*************** 👁️ SHOW HIDDEN PRODUCT *********************
///**************************************************************

class ShowHiddenProductHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    // Only handle PUT requests for showing hidden products
    if (method != 'PUT') {
      return {
        "status": "error",
        "message": "Method $method not supported. Only PUT is allowed.",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    // Extract required parameters
    final productId = params['product_id'];

    // Validate required parameters
    if (productId == null || productId.isEmpty) {
      return {
        "status": "error",
        "message": "Product ID is required",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      // Create the request using the JSON structure that matches the API
      final requestJson = {
        "product": {"id": int.tryParse(productId), "published": true}
      };

      // Convert to proper request model
      final showRequest =
          product_request.ShowHiddenProductRequest.fromJson(requestJson);

      // Call the API method
      final response = await GetIt.I<ProductService>().showHiddenProduct(
        apiVersion: ApiNetwork.apiVersion,
        productId: productId,
        model: showRequest,
      );

      // Return success response
      return {
        "status": "success",
        "message": "Hidden product is now visible",
        "product": response.product?.toJson(),
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      // Handle errors
      return {
        "status": "error",
        "message": "Failed to show hidden product: ${e.toString()}",
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
            name: 'product_id',
            label: 'Product ID',
            hint: 'The ID of the hidden product to show',
            isRequired: true,
          ),
        ],
      };
}
