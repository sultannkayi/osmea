import 'package:apis/network/remote/woocommerce/orders/freezed_model/response/list_all_orders_response.dart';
import 'package:apis/network/remote/woocommerce/orders/freezed_model/request/create_order_request.dart';
import 'package:apis/network/remote/woocommerce/orders/freezed_model/response/create_order_response.dart';
import 'package:apis/network/remote/woocommerce/orders/freezed_model/response/retrieve_order_response.dart';
import 'package:apis/network/remote/woocommerce/orders/freezed_model/response/update_order_response.dart';
import 'package:apis/network/remote/woocommerce/orders/freezed_model/response/delete_order_response.dart';
import 'package:apis/network/remote/woocommerce/orders/freezed_model/response/send_order_details_response.dart';

/// 🔑 Abstract contract for WooCommerce Orders Service
/// Defines the interface for all order-related operations in WooCommerce API
abstract class OrdersService {
  /// 📋 Retrieves a list of all orders from the WooCommerce API.
  Future<List<ListAllOrdersResponse>> listAllOrders({
    required String apiVersion,
    String? context,
    int? page,
    int? perPage,
    String? search,
    String? after,
    String? before,
    List<String>? exclude,
    List<String>? include,
    int? offset,
    String? order,
    String? orderBy,
    int? parent,
    List<String>? parentExclude,
    String? status,
    int? customer,
    int? product,
    String? dp,
  });

  /// ✨ Creates a new order in the WooCommerce API.
  Future<CreateOrderResponse> createOrder({
    required String apiVersion,
    required CreateOrderRequest orderData,
  });

  /// 🎯 Retrieves a specific order by ID from the WooCommerce API.
  Future<RetrieveOrderResponse> retrieveOrder({
    required String apiVersion,
    required int orderId,
    String? context,
  });

  /// 🔄 Updates an existing order in the WooCommerce API.
  Future<UpdateOrderResponse> updateOrder({
    required String apiVersion,
    required int orderId,
    required Map<String, dynamic> orderData,
  });

  /// 🗑️ Deletes an order from the WooCommerce API.
  Future<DeleteOrderResponse> deleteOrder({
    required String apiVersion,
    required int orderId,
    bool? force,
  });

  /// 📧 Sends order details email to customer in the WooCommerce API.
  Future<SendOrderDetailsResponse> sendOrderDetails({
    required String apiVersion,
    required int orderId,
    required Map<String, dynamic> actionData,
  });
}
