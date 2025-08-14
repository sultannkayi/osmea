import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/customers/customer/abstract/customer_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:get_it/get_it.dart';
import 'package:api_explorer/services/api_service_registry.dart';

///*******************************************************************
///************** 🔢 CUSTOMER COUNT API HANDLER 🔢 *****************
///*******************************************************************

class RetrievesCountOfCustomersHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    // 🔒 Only handle GET requests for customer count
    if (method == 'GET') {
      try {
        // 📞 Call the customer service API to get count
        final customersCount =
            await GetIt.I.get<CustomerService>().RetrievesCountOfCustomers(
                  apiVersion: ApiNetwork.apiVersion,
                );

        // 📋 Return just the count value
        return {
          "count": customersCount,
        };
      } catch (e) {
        // ❌ Generic error handling
        return {
          "error": "Failed to retrieve customer count: ${e.toString()}",
        };
      }
    }

    // ⛔ Unsupported method error
    return {
      "error": "Method $method not supported for Customer Count API",
    };
  }

  @override
  List<String> get supportedMethods => ['GET'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'GET': [], // No required fields for simple count
      };
}
