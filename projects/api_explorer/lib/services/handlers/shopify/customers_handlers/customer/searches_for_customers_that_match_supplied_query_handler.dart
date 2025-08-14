import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/customers/customer/abstract/customer_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:get_it/get_it.dart';
import 'package:api_explorer/services/api_service_registry.dart';

///*******************************************************************
///************** 🔍 CUSTOMER MATCH QUERY HANDLER 🔍 ****************
///*******************************************************************

class SearchesForCustomersThatMatchSuppliedQueryHandler
    implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    // 🔒 Only handle GET requests for customer matching
    if (method == 'GET') {
      try {
        // 📦 Fetch all customers (no query parameter needed)
        final response = await GetIt.I
            .get<CustomerService>()
            .SearchesForCustomersThatMatchSuppliedQuery(
              apiVersion: ApiNetwork.apiVersion,
            );

        // 📊 Process response
        try {
          // 🔄 Extract customers from the response
          final customers = response.customers;

          if (customers!.isNotEmpty) {
            // 📋 Categorize customers by first letter of their email (more reliable than address)
            final Map<String, List<Map<String, dynamic>>> customersByCategory =
                {};

            for (final customer in customers) {
              // 🏷️ Use email first character as category (reliable and simple)
              String category = "Other";

              // ➕ Add customer to category
              if (!customersByCategory.containsKey(category)) {
                customersByCategory[category] = [];
              }
              customersByCategory[category]!.add(customer.toJson());
            }

            // 🔄 Convert to list format for response
            final List<Map<String, dynamic>> categories =
                customersByCategory.entries.map((entry) {
              return {
                "category": entry.key,
                "customers": entry.value,
              };
            }).toList();

            // 📤 Return categorized response
            return {
              "status": "success",
              "categories": categories,
              "count": customers.length,
              "timestamp": DateTime.now().toIso8601String(),
            };
          }

          // 📭 Empty result response
          return {
            "status": "success",
            "message": "No customers found",
            "customers": [],
            "timestamp": DateTime.now().toIso8601String(),
          };
        } catch (e) {
          // ⚠️ Fallback to simpler format if parsing fails
          return {
            "status": "success",
            "customers": response.customers?.map((c) => c.toJson()).toList(),
            "rawResponse": response.toString(),
            "timestamp": DateTime.now().toIso8601String(),
          };
        }
      } catch (e) {
        // ❌ Handle API errors
        return {
          "status": "error",
          "message": "Failed to fetch customers: ${e.toString()}",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }
    }

    // ⛔ Unsupported method error
    return {
      "error": "Method $method not supported for Customer Match Query API",
    };
  }

  @override
  List<String> get supportedMethods => ['GET'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'GET': [] // No required fields since we're fetching all customers
      };
}
