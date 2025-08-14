import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/products/collect/abstract/collect_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///**************************************************************
///******************* 🗑️ DELETE COLLECT **********************
///**************************************************************

class DeleteCollectHandler implements ApiRequestHandler {
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
    if (method != 'DELETE') {
      return {
        "status": "error",
        "message": "Method $method not supported. Only DELETE is allowed.",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    // Extract and validate required parameter
    final collectId = _cleanParam(params['collect_id']);

    if (collectId == null || collectId.isEmpty) {
      return {
        "status": "error",
        "message": "Collect ID is required",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      // Call the API method
      await GetIt.I<CollectService>().deleteCollect(
        apiVersion: ApiNetwork.apiVersion,
        collectId: collectId,
      );

      // Return success response
      return {
        "status": "success",
        "message": "Collect deleted successfully",
        "params": {
          "collect_id": collectId,
        },
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      // Handle errors with enhanced error details
      String errorMessage = e.toString();
      int statusCode = 500;

      // Check for specific error types
      if (errorMessage.contains('404')) {
        statusCode = 404;
        return {
          "status": "error",
          "statusCode": 404,
          "message": "Collect not found",
          "collectId": collectId,
          "details": "The specified collect does not exist.",
          "timestamp": DateTime.now().toIso8601String(),
        };
      } else if (errorMessage.contains('403')) {
        statusCode = 403;
        return {
          "status": "error",
          "statusCode": 403,
          "message": "Access denied",
          "details":
              "Your API credentials don't have permission to delete this collect.",
          "timestamp": DateTime.now().toIso8601String(),
        };
      } else if (errorMessage.contains('429')) {
        statusCode = 429;
        return {
          "status": "error",
          "statusCode": 429,
          "message": "Rate limit exceeded. Please try again later.",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      // Default error response
      return {
        "status": "error",
        "statusCode": statusCode,
        "message": "Failed to delete collect: $errorMessage",
        "collectId": collectId,
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  @override
  List<String> get supportedMethods => ['DELETE'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'DELETE': [
          const ApiField(
            name: 'collect_id',
            label: 'Collect ID',
            hint: 'The ID of the collect to delete',
            isRequired: true,
          ),
        ],
      };
}
