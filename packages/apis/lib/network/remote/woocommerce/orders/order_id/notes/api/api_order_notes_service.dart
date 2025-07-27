import 'package:apis/apis.dart';
import 'package:apis/dio_config/api_dio_client.dart';
import 'package:apis/network/remote/woocommerce/orders/order_id/notes/abstract/order_notes_service.dart';
import 'package:apis/network/remote/woocommerce/orders/order_id/notes/freezed_model/response/list_all_order_notes_response.dart';
import 'package:apis/network/remote/woocommerce/orders/order_id/notes/freezed_model/response/create_order_note_response.dart';
import 'package:apis/network/remote/woocommerce/orders/order_id/notes/freezed_model/response/retrieve_order_note_response.dart';
import 'package:apis/network/remote/woocommerce/orders/order_id/notes/freezed_model/response/delete_order_note_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'api_order_notes_service.g.dart';

/// 🌐 OrderNotesServiceClient
/// Retrofit client for WooCommerce Order Notes API.
/// Make sure WooNetwork.storeUrl, username, and password are set before using! 🏬🔑
@RestApi()
@Injectable(as: OrderNotesService)
abstract class OrderNotesServiceClient implements OrderNotesService {
  /// 🏭 Factory for dependency injection
  @factoryMethod
  factory OrderNotesServiceClient(Dio dio) => _OrderNotesServiceClient(
        ApiDioClient.wooDio(),
        baseUrl: WooNetwork.baseUrl,
      );

  /// 📋 Get order notes from WooCommerce API
  @override
  @GET('/wp-json/wc/{api_version}/orders/{order_id}/notes')
  Future<List<ListAllOrderNotesResponse>> listAllOrderNotes({
    @Path('api_version') required String apiVersion,
    @Path('order_id') required int orderId,
    @Query('context') String? context,
    @Query('type') String? type,
  });

  /// ➕ Create a new order note in WooCommerce API
  @override
  @POST('/wp-json/wc/{api_version}/orders/{order_id}/notes')
  Future<CreateOrderNoteResponse> createOrderNote({
    @Path('api_version') required String apiVersion,
    @Path('order_id') required int orderId,
    @Body() required Map<String, dynamic> noteData,
  });

  /// 🔍 Retrieve a single order note from WooCommerce API
  @override
  @GET('/wp-json/wc/{api_version}/orders/{order_id}/notes/{note_id}')
  Future<RetrieveOrderNoteResponse> retrieveOrderNote({
    @Path('api_version') required String apiVersion,
    @Path('order_id') required int orderId,
    @Path('note_id') required int noteId,
    @Query('context') String? context,
  });

  /// 🗑️ Delete an order note from WooCommerce API
  @override
  @DELETE('/wp-json/wc/{api_version}/orders/{order_id}/notes/{note_id}')
  Future<DeleteOrderNoteResponse> deleteOrderNote({
    @Path('api_version') required String apiVersion,
    @Path('order_id') required int orderId,
    @Path('note_id') required int noteId,
    @Query('force') bool? force,
  });
}
