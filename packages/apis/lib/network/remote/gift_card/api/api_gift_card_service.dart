import 'package:apis/apis.dart';
import 'package:apis/dio_config/api_dio_client.dart';
import 'package:apis/network/remote/gift_card/abstract/gift_card_service.dart';
import 'package:apis/network/remote/gift_card/freezed_model/request/create_new_gift_card_request.dart';
import 'package:apis/network/remote/gift_card/freezed_model/request/disable_gift_card_request.dart';
import 'package:apis/network/remote/gift_card/freezed_model/request/updates_gift_card_request.dart';
import 'package:apis/network/remote/gift_card/freezed_model/request/automatically_create_gift_card_request.dart';
import 'package:apis/network/remote/gift_card/freezed_model/request/create_gift_card_with_custom_code_request.dart';
import 'package:apis/network/remote/gift_card/freezed_model/response/create_new_gift_card_response.dart';
import 'package:apis/network/remote/gift_card/freezed_model/response/disable_gift_card_response.dart';
import 'package:apis/network/remote/gift_card/freezed_model/response/retrieves_count_of_gift_card_response.dart';
import 'package:apis/network/remote/gift_card/freezed_model/response/retrieves_list_of_gift_cards_response.dart';
import 'package:apis/network/remote/gift_card/freezed_model/response/retrieves_single_gift_card_response.dart';
import 'package:apis/network/remote/gift_card/freezed_model/response/searches_for_gift_cards_response.dart';
import 'package:apis/network/remote/gift_card/freezed_model/response/updates_gift_card_response.dart';
import 'package:apis/network/remote/gift_card/freezed_model/response/create_gift_card_with_custom_code_response.dart';
import 'package:apis/network/remote/gift_card/freezed_model/response/automatically_create_gift_card_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'api_gift_card_service.g.dart';

@RestApi()
@Injectable(as: GiftCardService)
abstract class GiftCardServiceClient implements GiftCardService {
  @factoryMethod
  factory GiftCardServiceClient(Dio dio) => _GiftCardServiceClient(
        ApiDioClient.starter(),
        baseUrl: ApiNetwork.baseUrl,
      );

  /// 🎁 Create a new gift card
  @override
  @POST('/api/{api_version}/gift_cards.json')
  Future<CreateNewGiftCardResponse> createNewGiftCard({
    @Path('api_version') required String apiVersion,
    @Body() required CreateNewGiftCardRequest model,
  });

  /// 🎫 Create a gift card with custom code
  @override
  @POST('/api/{api_version}/gift_cards.json')
  Future<CreateGiftCardWithCustomCodeResponse> createGiftCardWithCustomCode({
    @Path('api_version') required String apiVersion,
    @Body() required CreateGiftCardWithCustomCodeRequest model,
  });

  /// ❌ Disable a gift card
  @override
  @PUT('/api/{api_version}/gift_cards/{gift_card_id}.json')
  Future<DisableGiftCardResponse> disableGiftCard({
    @Path('api_version') required String apiVersion,
    @Path('gift_card_id') required String giftCardId,
    @Body() required DisableGiftCardRequest model,
  });

  /// 🛠️ Update a gift card
  @override
  @PUT('/api/{api_version}/gift_cards/{gift_card_id}.json')
  Future<UpdatesGiftCardResponse> updateGiftCard({
    @Path('api_version') required String apiVersion,
    @Path('gift_card_id') required String giftCardId,
    @Body() required UpdatesGiftCardRequest model,
  });

  /// 🤖 Automatically create a gift card
  @override
  @POST('/api/{api_version}/gift_cards.json')
  Future<AutomaticallyCreateGiftCardResponse> automaticallyCreateGiftCard({
    @Path('api_version') required String apiVersion,
    @Body() required AutomaticallyCreateGiftCardRequest model,
  });

  /// 🔢 Retrieve count of all gift cards
  @override
  @GET('/api/{api_version}/gift_cards/count.json')
  Future<RetrievesCountOfGiftCardResponse> retrievesCountOfGiftCards({
    @Path('api_version') required String apiVersion,
  });

  /// 📋 Retrieve list of gift cards (with filters)
  @override
  @GET('/api/{api_version}/gift_cards.json')
  Future<RetrievesListOfGiftCardResponse> retrievesListOfGiftCards({
    @Path('api_version') required String apiVersion,
    @Query('limit') int? limit,
    @Query('page') int? page,
    @Query('fields') String? fields,
    @Query('status') String? status,
    @Query('since_id') String? sinceId,
    @Query('enabled') bool? enabled,
  });

  /// 🔍 Search for gift cards (advanced filters)
  @override
  @GET('/api/{api_version}/gift_cards/search.json')
  Future<SearchesForGiftCardResponse> searchesForGiftCards({
    @Path('api_version') required String apiVersion,
    @Query('query') required String query,
    @Query('limit') int? limit,
    @Query('order') String? order,
    @Query('fields') String? fields,
    @Query('created_at_min') String? createdAtMin,
    @Query('created_at_max') String? createdAtMax,
    @Query('updated_at_min') String? updatedAtMin,
    @Query('updated_at_max') String? updatedAtMax,
  });

  /// 🔎 Retrieve a single gift card
  @override
  @GET('/api/{api_version}/gift_cards/{gift_card_id}.json')
  Future<RetrievesSingleGiftCardResponse> retrievesSingleGiftCard({
    @Path('api_version') required String apiVersion,
    @Path('gift_card_id') required String giftCardId,
  });
}
