import 'package:apis/apis.dart';
import 'package:apis/dio_config/api_dio_client.dart';
import 'package:apis/network/remote/woocommerce/orders/abstract/orders_service.dart';
import 'package:apis/network/remote/woocommerce/orders/freezed_model/response/list_all_orders_response.dart';
import 'package:apis/network/remote/woocommerce/orders/freezed_model/request/create_order_request.dart';
import 'package:apis/network/remote/woocommerce/orders/freezed_model/response/create_order_response.dart';
import 'package:apis/network/remote/woocommerce/orders/freezed_model/response/retrieve_order_response.dart';
import 'package:apis/network/remote/woocommerce/orders/freezed_model/response/update_order_response.dart';
import 'package:apis/network/remote/woocommerce/orders/freezed_model/response/delete_order_response.dart';
import 'package:apis/network/remote/woocommerce/orders/freezed_model/response/send_order_details_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'api_orders_service.g.dart';

/// 🌐 OrdersServiceClient
/// Retrofit client for WooCommerce Orders API.
/// Make sure WooNetwork.storeUrl, username, and password are set before using! 🏬🔑
@RestApi()
@Injectable(as: OrdersService)
abstract class OrdersServiceClient implements OrdersService {
  /// 🏭 Factory for dependency injection
  @factoryMethod
  factory OrdersServiceClient(Dio dio) => _OrdersServiceClient(
        ApiDioClient.wooDio(),
        baseUrl: WooNetwork.baseUrl,
      );

  /// 📋 Get orders from WooCommerce API
  @override
  @GET('/wp-json/wc/{api_version}/orders')
  Future<List<ListAllOrdersResponse>> listAllOrders({
    @Path('api_version') required String apiVersion,
    @Query('context') String? context,
    @Query('page') int? page,
    @Query('per_page') int? perPage,
    @Query('search') String? search,
    @Query('after') String? after,
    @Query('before') String? before,
    @Query('exclude') List<String>? exclude,
    @Query('include') List<String>? include,
    @Query('offset') int? offset,
    @Query('order') String? order,
    @Query('orderby') String? orderBy,
    @Query('parent') int? parent,
    @Query('parent_exclude') List<String>? parentExclude,
    @Query('status') String? status,
    @Query('customer') int? customer,
    @Query('product') int? product,
    @Query('dp') String? dp,
  });

  /// ✨ Create a new order in WooCommerce API
  @override
  @POST('/wp-json/wc/{api_version}/orders')
  Future<CreateOrderResponse> createOrder({
    @Path('api_version') required String apiVersion,
    @Body() required CreateOrderRequest orderData,
  });

  /// 🎯 Get a specific order by ID from WooCommerce API
  @override
  @GET('/wp-json/wc/{api_version}/orders/{order_id}')
  Future<RetrieveOrderResponse> retrieveOrder({
    @Path('api_version') required String apiVersion,
    @Path('order_id') required int orderId,
    @Query('context') String? context,
  });

  /// 🔄 Update an existing order in WooCommerce API
  @override
  @PUT('/wp-json/wc/{api_version}/orders/{order_id}')
  Future<UpdateOrderResponse> updateOrder({
    @Path('api_version') required String apiVersion,
    @Path('order_id') required int orderId,
    @Body() required Map<String, dynamic> orderData,
  });

  /// 🗑️ Delete an order from WooCommerce API
  @override
  @DELETE('/wp-json/wc/{api_version}/orders/{order_id}')
  Future<DeleteOrderResponse> deleteOrder({
    @Path('api_version') required String apiVersion,
    @Path('order_id') required int orderId,
    @Query('force') bool? force,
  });

  /// 📧 Send order details email to customer in WooCommerce API
  @override
  @POST(
      '/wp-json/wc/{api_version}/orders/{order_id}/actions/send_order_details')
  Future<SendOrderDetailsResponse> sendOrderDetails({
    @Path('api_version') required String apiVersion,
    @Path('order_id') required int orderId,
    @Body() required Map<String, dynamic> actionData,
  });
}
