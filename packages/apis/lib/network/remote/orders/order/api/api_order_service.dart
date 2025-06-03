import 'package:apis/apis.dart';
import 'package:apis/dio_config/api_dio_client.dart';
import 'package:apis/network/remote/orders/order/abstract/order_service.dart';
import 'package:apis/network/remote/orders/order/freezed_model/request/create_cancel_order_request.dart';
import 'package:apis/network/remote/orders/order/freezed_model/request/create_close_order_request.dart';
import 'package:apis/network/remote/orders/order/freezed_model/request/create_order_comprehensive_request.dart';
import 'package:apis/network/remote/orders/order/freezed_model/request/create_order_fulfill_request.dart';
import 'package:apis/network/remote/orders/order/freezed_model/request/create_order_partially_paid_request.dart';
import 'package:apis/network/remote/orders/order/freezed_model/request/create_order_request.dart';
import 'package:apis/network/remote/orders/order/freezed_model/request/create_order_risk_request.dart';
import 'package:apis/network/remote/orders/order/freezed_model/request/create_order_sending_order_confirmation_request.dart';
import 'package:apis/network/remote/orders/order/freezed_model/request/create_order_with_pending_customer_request.dart';
import 'package:apis/network/remote/orders/order/freezed_model/request/create_order_with_product_id_request.dart';
import 'package:apis/network/remote/orders/order/freezed_model/request/create_order_with_tax_lines_request.dart';
import 'package:apis/network/remote/orders/order/freezed_model/request/create_order_without_order_receipt_request.dart';
import 'package:apis/network/remote/orders/order/freezed_model/request/create_reopen_order_request.dart';
import 'package:apis/network/remote/orders/order/freezed_model/request/update_add_metafield_request.dart';
import 'package:apis/network/remote/orders/order/freezed_model/request/update_change_whether_request.dart';
import 'package:apis/network/remote/orders/order/freezed_model/request/update_email_address_request.dart';
import 'package:apis/network/remote/orders/order/freezed_model/request/update_order_request.dart';
import 'package:apis/network/remote/orders/order/freezed_model/request/update_order_risk_request.dart';
import 'package:apis/network/remote/orders/order/freezed_model/request/update_note_attributes_request.dart';
import 'package:apis/network/remote/orders/order/freezed_model/request/update_order_tag_request.dart';
import 'package:apis/network/remote/orders/order/freezed_model/request/update_phone_number_request.dart';
import 'package:apis/network/remote/orders/order/freezed_model/request/update_shipping_address_request.dart';
import 'package:apis/network/remote/orders/order/freezed_model/request/update_add_note_request.dart';
import 'package:apis/network/remote/orders/order/freezed_model/response/create_cancel_order_response.dart';
import 'package:apis/network/remote/orders/order/freezed_model/response/create_close_order_response.dart';
import 'package:apis/network/remote/orders/order/freezed_model/response/create_order_comprehensive_response.dart';
import 'package:apis/network/remote/orders/order/freezed_model/response/create_order_fulfill_response.dart';
import 'package:apis/network/remote/orders/order/freezed_model/response/create_order_partially_paid_response.dart';
import 'package:apis/network/remote/orders/order/freezed_model/response/create_order_response.dart';
import 'package:apis/network/remote/orders/order/freezed_model/response/create_order_risk_response.dart';
import 'package:apis/network/remote/orders/order/freezed_model/response/create_order_sending_order_confirmation_response.dart';
import 'package:apis/network/remote/orders/order/freezed_model/response/create_order_with_pending_customer_response.dart';
import 'package:apis/network/remote/orders/order/freezed_model/response/create_order_with_product_id_response.dart';
import 'package:apis/network/remote/orders/order/freezed_model/response/create_order_with_tax_lines_response.dart';
import 'package:apis/network/remote/orders/order/freezed_model/response/create_order_without_order_receipt_response.dart';
import 'package:apis/network/remote/orders/order/freezed_model/response/create_reopen_order_response.dart';
import 'package:apis/network/remote/orders/order/freezed_model/response/get_count_order_response.dart';
import 'package:apis/network/remote/orders/order/freezed_model/response/get_list_order_response.dart';
import 'package:apis/network/remote/orders/order/freezed_model/response/get_list_order_risks_response.dart';
import 'package:apis/network/remote/orders/order/freezed_model/response/get_order_after_timestamp_response.dart';
import 'package:apis/network/remote/orders/order/freezed_model/response/get_orders_with_properties_response.dart';
import 'package:apis/network/remote/orders/order/freezed_model/response/get_single_order_response.dart';
import 'package:apis/network/remote/orders/order/freezed_model/response/get_single_order_risk_response.dart';
import 'package:apis/network/remote/orders/order/freezed_model/response/update_change_whether_response.dart';
import 'package:apis/network/remote/orders/order/freezed_model/response/update_order_response.dart';
import 'package:apis/network/remote/orders/order/freezed_model/response/update_order_risk_response.dart';
import 'package:apis/network/remote/orders/order/freezed_model/response/update_note_attributes_response.dart';
import 'package:apis/network/remote/orders/order/freezed_model/response/update_order_tag_response.dart';
import 'package:apis/network/remote/orders/order/freezed_model/response/update_shipping_address_response.dart';
import 'package:apis/network/remote/orders/order/freezed_model/response/update_add_note_response.dart';
import 'package:apis/network/remote/orders/order/freezed_model/response/update_phone_number_response.dart';
import 'package:apis/network/remote/orders/order/freezed_model/response/update_add_metafield_response.dart';
import 'package:apis/network/remote/orders/order/freezed_model/response/update_email_address_response.dart';
import 'package:apis/network/remote/orders/order/freezed_model/request/update_remove_customer_order_request.dart';
import 'package:apis/network/remote/orders/order/freezed_model/response/update_remove_customer_order_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'api_order_service.g.dart';

@RestApi()
@Injectable(as: OrderService)

/// 🏭 Factory for dependency injection
abstract class OrderServiceClient implements OrderService {
  @factoryMethod
  factory OrderServiceClient(Dio dio) => _OrderServiceClient(
        ApiDioClient.starter(),
        baseUrl: ApiNetwork.baseUrl,
      );

  @override
  @POST('/api/{api_version}/orders.json')
  Future<CreateOrderResponse> createOrder({
    @Path('api_version') required String apiVersion,
    @Body() required CreateOrderRequest model,
  });

  @override
  @POST('/api/{api_version}/orders.json')
  Future<CreateOrderWithTaxLinesResponse> createOrderWithTaxLines({
    @Path('api_version') required String apiVersion,
    @Body() required CreateOrderWithTaxLinesRequest model,
  });

  @override
  @POST('/api/{api_version}/orders.json')
  Future<CreateOrderPartiallyPaidResponse> createOrderPartiallyPaid({
    @Path('api_version') required String apiVersion,
    @Body() required CreateOrderPartiallyPaidRequest model,
  });

  @override
  @POST('/api/{api_version}/orders.json')
  Future<CreateOrderComprehensiveResponse> createOrderComprehensive({
    @Path('api_version') required String apiVersion,
    @Body() required CreateOrderComprehensiveRequest model,
  });

  @override
  @POST('/api/{api_version}/orders.json')
  Future<CreateOrderWithProductIdResponse> createOrderWithProductId({
    @Path('api_version') required String apiVersion,
    @Body() required CreateOrderWithProductIdRequest model,
  });

  @override
  @POST('/api/{api_version}/orders.json')
  Future<CreateOrderWithoutOrderReceiptResponse>
      createOrderWithoutOrderReceipt({
    @Path('api_version') required String apiVersion,
    @Body() required CreateOrderWithoutOrderReceiptRequest model,
  });

  @override
  @POST('/api/{api_version}/orders.json')
  Future<CreateOrderSendingOrderConfirmationResponse>
      createOrderSendingOrderConfirmation({
    @Path('api_version') required String apiVersion,
    @Body() required CreateOrderSendingOrderConfirmationRequest model,
  });

  @override
  @POST('/api/{api_version}/orders.json')
  Future<CreateOrderWithPendingCustomerResponse>
      createOrderWithPendingCustomer({
    @Path('api_version') required String apiVersion,
    @Body() required CreateOrderWithPendingCustomerRequest model,
  });

  @override
  @POST('/api/{api_version}/orders.json')
  Future<CreateOrderFulfillResponse> createOrderFulfill({
    @Path('api_version') required String apiVersion,
    @Body() required CreateOrderFulfillRequest model,
  });

  @override
  @POST('/api/{api_version}/orders/{order_id}/risks.json')
  Future<CreateOrderRiskResponse> createOrderRisk({
    @Path('api_version') required String apiVersion,
    @Path('order_id') required String orderId,
    @Body() required CreateOrderRiskRequest model,
  });

  @GET('/api/{api_version}/orders/{order_id}/risks.json')
  Future<GetListOrderRisksResponse> getListOrderRisks({
    @Path('api_version') required String apiVersion,
    @Path('order_id') required String orderId,
  });

  @GET('/api/{api_version}/orders/{order_id}/risks/{risk_id}.json')
  Future<GetSingleOrderRiskResponse> getSingleOrderRisk({
    @Path('api_version') required String apiVersion,
    @Path('order_id') required String orderId,
    @Path('risk_id') required String riskId,
  });

  @PUT('/api/{api_version}/orders/{order_id}/risks/{risk_id}.json')
  Future<UpdateOrderRiskResponse> updateOrderRisk({
    @Path('api_version') required String apiVersion,
    @Path('order_id') required String orderId,
    @Path('risk_id') required String riskId,
    @Body() required UpdateOrderRiskRequest model,
  });

  @DELETE('/api/{api_version}/orders/{order_id}/risks/{risk_id}.json')
  Future<void> deleteOrderRisk({
    @Path('api_version') required String apiVersion,
    @Path('risk_id') required String riskId,
    @Path('order_id') required String orderId,
  });
  @override
  @GET('/api/{api_version}/orders/{order_id}.json')
  Future<GetSingleOrderResponse> getSingleOrder({
    @Path('api_version') required String apiVersion,
    @Path('order_id') required String orderId,
  });

  @override
  @PUT('/api/{api_version}/orders/{order_id}.json')
  Future<UpdateOrderResponse> updateOrder({
    @Path('api_version') required String apiVersion,
    @Path('order_id') required String orderId,
    @Body() required UpdateOrderRequest model,
  });

  @override
  @DELETE('/api/{api_version}/orders/{order_id}.json')
  Future<void> deleteOrder({
    @Path('api_version') required String apiVersion,
    @Path('order_id') required String orderId,
  });

  @override
  @GET('/api/{api_version}/orders.json')
  Future<GetListOrderResponse> getListOrders({
    @Path('api_version') required String apiVersion,
    @Query('ids') String? ids,
    @Query('name') String? name,
    @Query('limit') int? limit,
    @Query('since_id') String? since_id,
    @Query('created_at_min') String? created_at_min,
    @Query('created_at_max') String? created_at_max,
    @Query('updated_at_min') String? updated_at_min,
    @Query('updated_at_max') String? updated_at_max,
    @Query('processed_at_min') String? processed_at_min,
    @Query('processed_at_max') String? processed_at_max,
    @Query('attribution_app_id') String? attribution_app_id,
    @Query('status') String? status,
    @Query('financial_status') String? financial_status,
    @Query('fulfillment_status') String? fulfillment_status,
    @Query('fields') String? fields,
  });

  @override
  @GET('/api/{api_version}/orders/count.json')
  Future<GetCountOrderResponse> getCountOrders({
    @Path('api_version') required String apiVersion,
    @Query('since_id') String? since_id,
    @Query('created_at_min') String? created_at_min,
    @Query('created_at_max') String? created_at_max,
    @Query('updated_at_min') String? updated_at_min,
    @Query('updated_at_max') String? updated_at_max,
    @Query('processed_at_min') String? processed_at_min,
    @Query('processed_at_max') String? processed_at_max,
    @Query('attribution_app_id') String? attribution_app_id,
    @Query('status') String? status,
    @Query('financial_status') String? financial_status,
    @Query('fulfillment_status') String? fulfillment_status,
  });

  @override
  @POST('/api/{api_version}/orders/{order_id}/cancel.json')
  Future<CreateCancelOrderResponse> createCancelOrder({
    @Path('api_version') required String apiVersion,
    @Path('order_id') required String orderId,
    @Body() required CreateCancelOrderRequest model,
  });

  @override
  @POST('/api/{api_version}/orders/{order_id}/close.json')
  Future<CreateCloseOrderResponse> createCloseOrder({
    @Path('api_version') required String apiVersion,
    @Path('order_id') required String orderId,
    @Body() required CreateCloseOrderRequest model,
  });

  @override
  @POST('/api/{api_version}/orders/{order_id}/open.json')
  Future<CreateReopenOrderResponse> createReopenOrder({
    @Path('api_version') required String apiVersion,
    @Path('order_id') required String orderId,
    @Body() required CreateReopenOrderRequest model,
  });

  @override
  @PUT('/api/{api_version}/orders/{order_id}.json')
  Future<UpdateNoteAttributesResponse> updateNoteAttributes({
    @Path('api_version') required String apiVersion,
    @Path('order_id') required String orderId,
    @Body() required UpdateNoteAttributesRequest model,
  });

  @override
  @PUT('/api/{api_version}/orders/{order_id}.json')
  Future<UpdateShippingAddressResponse> updateShippingAddress({
    @Path('api_version') required String apiVersion,
    @Path('order_id') required String orderId,
    @Body() required UpdateShippingAddressRequest model,
  });

  @override
  @PUT('/api/{api_version}/orders/{order_id}.json')
  Future<UpdateOrderTagResponse> updateOrderTags({
    @Path('api_version') required String apiVersion,
    @Path('order_id') required String orderId,
    @Body() required UpdateOrderTagRequest model,
  });

  @override
  @PUT('/api/{api_version}/orders/{order_id}.json')
  Future<UpdateAddNoteResponse> updateAddNote({
    @Path('api_version') required String apiVersion,
    @Path('order_id') required String orderId,
    @Body() required UpdateAddNoteRequest model,
  });

  @override
  @PUT('/api/{api_version}/orders/{order_id}.json')
  Future<UpdatePhoneNumberResponse> updatePhoneNumber({
    @Path('api_version') required String apiVersion,
    @Path('order_id') required String orderId,
    @Body() required UpdatePhoneNumberRequest model,
  });

  @override
  @PUT('/api/{api_version}/orders/{order_id}.json')
  Future<UpdateAddMetafieldResponse> updateAddMetafield({
    @Path('api_version') required String apiVersion,
    @Path('order_id') required String orderId,
    @Body() required UpdateAddMetafieldRequest model,
  });

  @override
  @PUT('/api/{api_version}/orders/{order_id}.json')
  Future<UpdateEmailAddressResponse> updateEmailAddress({
    @Path('api_version') required String apiVersion,
    @Path('order_id') required String orderId,
    @Body() required UpdateEmailAddressRequest model,
  });

  @override
  @PUT('/api/{api_version}/orders/{order_id}.json')
  Future<UpdateRemoveCustomerOrderResponse> updateRemoveCustomer({
    @Path('api_version') required String apiVersion,
    @Path('order_id') required String orderId,
    @Body() required UpdateRemoveCustomerOrderRequest model,
  });

  @override
  @PUT('/api/{api_version}/orders/{order_id}.json')
  Future<UpdateChangeWhetherResponse> updateChangeWhether({
    @Path('api_version') required String apiVersion,
    @Path('order_id') required String orderId,
    @Body() required UpdateChangeWhetherRequest model,
  });

  @override
  @GET('/api/{api_version}/orders.json')
  Future<GetOrdersWithPropertiesResponse> getOrdersWithProperties({
    @Path('api_version') required String apiVersion,
    @Query('created_at_min') String? createdAtMin,
    @Query('created_at_max') String? createdAtMax,
    @Query('updated_at_min') String? updatedAtMin,
    @Query('updated_at_max') String? updatedAtMax,
    @Query('processed_at_min') String? processedAtMin,
    @Query('processed_at_max') String? processedAtMax,
    @Query('attribution_app_id') String? attributionAppId,
    @Query('status') String? status,
    @Query('financial_status') String? financialStatus,
    @Query('fulfillment_status') String? fulfillmentStatus,
    @Query('fields') String? fields,
  });

  @override
  @GET('/api/{api_version}/orders.json')
  Future<GetOrdersWithPropertiesResponse> getOrdersAuthorized({
    @Path('api_version') required String apiVersion,
    @Query('created_at_min') String? createdAtMin,
    @Query('created_at_max') String? createdAtMax,
    @Query('updated_at_min') String? updatedAtMin,
    @Query('updated_at_max') String? updatedAtMax,
    @Query('processed_at_min') String? processedAtMin,
    @Query('processed_at_max') String? processedAtMax,
    @Query('fields') String? fields,
  });

  @override
  @GET('/api/{api_version}/orders.json')
  Future<GetOrderAfterTimestampResponse> getOrderAfterTimestamp({
    @Path('api_version') required String apiVersion,
    @Query('ids') String? ids,
    @Query('limit') int? limit,
    @Query('since_id') String? sinceId,
    @Query('created_at_min') String? createdAtMin,
    @Query('created_at_max') String? createdAtMax,
    @Query('updated_at_min') String? updatedAtMin,
    @Query('updated_at_max') String? updatedAtMax,
    @Query('processed_at_min') String? processedAtMin,
    @Query('processed_at_max') String? processedAtMax,
    @Query('attribution_app_id') String? attributionAppId,
    @Query('status') String? status,
    @Query('financial_status') String? financialStatus,
    @Query('fulfillment_status') String? fulfillmentStatus,
    @Query('fields') String? fields,
  });
}
