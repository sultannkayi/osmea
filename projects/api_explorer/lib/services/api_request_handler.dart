import 'package:api_explorer/services/api_service_registry.dart';

/// 🧩 Abstract class for API request handlers
/// 🔄 Defines the contract that all API handlers must implement
abstract class ApiRequestHandler {
  /// 🔄 Handle the API request and return a response
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params);

  /// 📋 Get the available methods for this handler
  List<String> get supportedMethods;

  /// 📝 Get the required fields for each method
  Map<String, List<ApiField>> get requiredFields;
}
