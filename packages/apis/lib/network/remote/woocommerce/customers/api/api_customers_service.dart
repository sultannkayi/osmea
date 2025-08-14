import 'package:apis/apis.dart';
import 'package:apis/dio_config/api_dio_client.dart';
import 'package:apis/network/remote/woocommerce/customers/abstract/customers_service.dart';
import 'package:apis/network/remote/woocommerce/customers/freezed_model/response/list_all_customers_response.dart';
import 'package:apis/network/remote/woocommerce/customers/freezed_model/response/retrieve_customer_response.dart';
import 'package:apis/network/remote/woocommerce/customers/freezed_model/request/create_customer_request.dart';
import 'package:apis/network/remote/woocommerce/customers/freezed_model/response/create_customer_response.dart';
import 'package:apis/network/remote/woocommerce/customers/freezed_model/response/update_customer_response.dart';
import 'package:apis/network/remote/woocommerce/customers/freezed_model/request/batch_update_customers_request.dart';
import 'package:apis/network/remote/woocommerce/customers/freezed_model/response/batch_update_customers_response.dart';
import 'package:apis/network/remote/woocommerce/customers/freezed_model/response/delete_customer_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'api_customers_service.g.dart';

/// 🌐 CustomersServiceClient
/// Retrofit client for WooCommerce Customers API.
/// Make sure WooNetwork.storeUrl, username, and password are set before using! 🏬🔑
@RestApi()
@Injectable(as: CustomersService)
abstract class CustomersServiceClient implements CustomersService {
  /// 🏭 Factory for dependency injection
  @factoryMethod
  factory CustomersServiceClient(Dio dio) => _CustomersServiceClient(
        ApiDioClient.wooDio(),
        baseUrl: WooNetwork.baseUrl,
      );

  /// 🔓 Get customers from WooCommerce API
  @override
  @GET('/wp-json/wc/{api_version}/customers')
  Future<List<ListAllCustomersResponse>> listAllCustomers({
    @Path('api_version') required String apiVersion,
    @Query('context') String? context,
    @Query('page') int? page,
    @Query('per_page') int? perPage,
    @Query('search') String? search,
    @Query('exclude') List<String>? exclude,
    @Query('include') List<String>? include,
    @Query('offset') int? offset,
    @Query('order') String? order,
    @Query('orderby') String? orderBy,
    @Query('email') String? email,
    @Query('role') String? role,
  });

  /// 🎯 Get a specific customer by ID from WooCommerce API
  @override
  @GET('/wp-json/wc/{api_version}/customers/{customer_id}')
  Future<RetrieveCustomerResponse> retrieveCustomer({
    @Path('api_version') required String apiVersion,
    @Path('customer_id') required int customerId,
    @Query('context') String? context,
  });

  /// ✨ Create a new customer in WooCommerce API
  @override
  @POST('/wp-json/wc/{api_version}/customers')
  Future<CreateCustomerResponse> createCustomer({
    @Path('api_version') required String apiVersion,
    @Body() required CreateCustomerRequest customerData,
  });

  /// 🔄 Update an existing customer in WooCommerce API
  @override
  @PUT('/wp-json/wc/{api_version}/customers/{customer_id}')
  Future<UpdateCustomerResponse> updateCustomer({
    @Path('api_version') required String apiVersion,
    @Path('customer_id') required int customerId,
    @Body() required Map<String, dynamic> customerData,
  });

  /// 🗑️ Delete a customer from WooCommerce API
  @override
  @DELETE('/wp-json/wc/{api_version}/customers/{customer_id}')
  Future<DeleteCustomerResponse> deleteCustomer({
    @Path('api_version') required String apiVersion,
    @Path('customer_id') required int customerId,
    @Query('force') bool? force,
    @Query('reassign') String? reassign,
  });

  /// 📦 Batch update customers in WooCommerce API
  @override
  @PATCH('/wp-json/wc/{api_version}/customers/batch')
  Future<BatchUpdateCustomersResponse> batchUpdateCustomers({
    @Path('api_version') required String apiVersion,
    @Body() required BatchUpdateCustomersRequest batchData,
  });

  @override
  @PATCH('/wp-json/wc/{api_version}/customers/batch')
  Future<BatchUpdateCustomersResponse> batchUpdateCustomerId({
    @Path('api_version') required String apiVersion,
    @Path('customer_id') required int customerId,
    @Body() required BatchUpdateCustomersRequest batchData,
  });
}
