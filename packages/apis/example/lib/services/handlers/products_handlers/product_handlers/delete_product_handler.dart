import 'package:apis/apis.dart';
import 'package:apis/network/remote/products/product/abstract/product_service.dart';
import 'package:get_it/get_it.dart';
import '../../../api_service_registry.dart';
import '../../../api_request_handler.dart';
import 'dart:convert';

///*******************************************************************
///******************* 🗑️ PRODUCT DELETE HANDLER 🗑️ ******************
///*******************************************************************

class DeleteProductHandler implements ApiRequestHandler {
  @override
  List<String> get supportedMethods => ['DELETE'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'DELETE': [
          const ApiField(
            name: 'id',
            label: 'Product ID',
            hint: 'ID of the product to delete',
            isRequired: true,
          ),
        ],
      };

  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    switch (method) {
      case 'DELETE':
        // ✅ Delete an existing product
        try {
          // 🔍 Validate required parameters
          final productId = params['id'] ?? '';
          if (productId.isEmpty) {
            return {
              "status": "error",
              "message": "Product ID is required",
              "timestamp": DateTime.now().toIso8601String(),
            };
          }

          // 📞 Call the API to delete the product
          await GetIt.I.get<ProductService>().deleteProduct(
                apiVersion: ApiNetwork.apiVersion,
                productId: productId,
              );

          // 🎉 Return successful response
          return {
            "status": "success",
            "message": "Product deleted successfully",
            "id": productId,
            "timestamp": DateTime.now().toIso8601String(),
          };
        } catch (e) {
          // ❌ Handle specific error patterns
          String errorMessage = e.toString();
          int statusCode = 500;

          // Extract status code if available
          if (errorMessage.contains("status code of")) {
            final regex = RegExp(r"status code of (\d+)");
            final match = regex.firstMatch(errorMessage);
            if (match != null) {
              statusCode = int.tryParse(match.group(1) ?? "500") ?? 500;
            }
          }

          // Parse error JSON if present
          if (errorMessage.contains('"errors"')) {
            try {
              // Extract JSON part from error message
              final jsonStart = errorMessage.indexOf('{');
              final jsonEnd = errorMessage.lastIndexOf('}') + 1;

              if (jsonStart >= 0 && jsonEnd > jsonStart) {
                final jsonStr = errorMessage.substring(jsonStart, jsonEnd);
                final errorJson = json.decode(jsonStr);

                if (errorJson.containsKey('errors')) {
                  final errors = errorJson['errors'];
                  String specificError = "Product deletion failed";

                  if (errors is Map) {
                    // Handle different error structures
                    final errorEntries = errors.entries.toList();
                    if (errorEntries.isNotEmpty) {
                      final firstError = errorEntries.first;
                      if (firstError.value is List &&
                          (firstError.value as List).isNotEmpty) {
                        specificError =
                            "${firstError.key}: ${(firstError.value as List).first}";
                      } else {
                        specificError =
                            "${firstError.key}: ${firstError.value}";
                      }
                    }
                  } else if (errors is List && errors.isNotEmpty) {
                    specificError = errors.first.toString();
                  }

                  return {
                    "status": "error",
                    "message": specificError,
                    "statusCode": statusCode,
                    "timestamp": DateTime.now().toIso8601String(),
                  };
                }
              }
            } catch (parseError) {
              // If JSON parsing fails, continue with generic error handling
            }
          }

          // Generic error handling
          return {
            "status": "error",
            "message": "Failed to delete product: $errorMessage",
            "statusCode": statusCode,
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

      default:
        return {
          "status": "error",
          "message": "Method $method not supported for product deletion",
          "timestamp": DateTime.now().toIso8601String(),
        };
    }
  }
}
