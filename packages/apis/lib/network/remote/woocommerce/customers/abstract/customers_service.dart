import 'package:apis/network/remote/woocommerce/customers/freezed_model/response/list_all_customers_response.dart';
import 'package:apis/network/remote/woocommerce/customers/freezed_model/response/retrieve_customer_response.dart';
import 'package:apis/network/remote/woocommerce/customers/freezed_model/request/create_customer_request.dart';
import 'package:apis/network/remote/woocommerce/customers/freezed_model/response/create_customer_response.dart';
import 'package:apis/network/remote/woocommerce/customers/freezed_model/response/update_customer_response.dart';
import 'package:apis/network/remote/woocommerce/customers/freezed_model/request/batch_update_customers_request.dart';
import 'package:apis/network/remote/woocommerce/customers/freezed_model/response/batch_update_customers_response.dart';
import 'package:apis/network/remote/woocommerce/customers/freezed_model/response/delete_customer_response.dart';

/// 🔑 Abstract contract for WooCommerce Customers Service
/// Implement this to fetch customers from WooCommerce API! 🌐
abstract class CustomersService {
  /// 🚀 Fetches the customers from the WooCommerce API.
  Future<List<ListAllCustomersResponse>> listAllCustomers({
    required String apiVersion,
    String? context,
    int? page,
    int? perPage,
    String? search,
    List<String>? exclude,
    List<String>? include,
    int? offset,
    String? order,
    String? orderBy,
    String? email,
    String? role,
  });

  /// 🎯 Retrieves a specific customer by ID from the WooCommerce API.
  Future<RetrieveCustomerResponse> retrieveCustomer({
    required String apiVersion,
    required int customerId,
    String? context,
  });

  /// ✨ Creates a new customer in the WooCommerce API.
  Future<CreateCustomerResponse> createCustomer({
    required String apiVersion,
    required CreateCustomerRequest customerData,
  });

  /// 🔄 Updates an existing customer in the WooCommerce API.
  Future<UpdateCustomerResponse> updateCustomer({
    required String apiVersion,
    required int customerId,
    required Map<String, dynamic> customerData,
  });

  /// 🗑️ Deletes a customer from the WooCommerce API.
  Future<DeleteCustomerResponse> deleteCustomer({
    required String apiVersion,
    required int customerId,
    bool? force,
    String? reassign,
  });

  /// 📦 Batch update customers in the WooCommerce API.
  Future<BatchUpdateCustomersResponse> batchUpdateCustomers({
    required String apiVersion,
    required BatchUpdateCustomersRequest batchData,
  });

  Future<BatchUpdateCustomersResponse> batchUpdateCustomerId({
    required String apiVersion,
    required int customerId,
    required BatchUpdateCustomersRequest batchData,
  });
}
