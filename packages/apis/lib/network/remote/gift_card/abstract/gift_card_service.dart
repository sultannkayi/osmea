import 'package:apis/network/remote/gift_card/freezed_model/request/automatically_create_gift_card_request.dart';
import 'package:apis/network/remote/gift_card/freezed_model/request/create_new_gift_card_request.dart';
import 'package:apis/network/remote/gift_card/freezed_model/request/create_gift_card_with_custom_code_request.dart';
import 'package:apis/network/remote/gift_card/freezed_model/request/disable_gift_card_request.dart';
import 'package:apis/network/remote/gift_card/freezed_model/request/updates_gift_card_request.dart';
import 'package:apis/network/remote/gift_card/freezed_model/response/create_new_gift_card_response.dart';
import 'package:apis/network/remote/gift_card/freezed_model/response/create_gift_card_with_custom_code_response.dart';
import 'package:apis/network/remote/gift_card/freezed_model/response/automatically_create_gift_card_response.dart';
import 'package:apis/network/remote/gift_card/freezed_model/response/disable_gift_card_response.dart';
import 'package:apis/network/remote/gift_card/freezed_model/response/retrieves_count_of_gift_card_response.dart';
import 'package:apis/network/remote/gift_card/freezed_model/response/retrieves_list_of_gift_cards_response.dart';
import 'package:apis/network/remote/gift_card/freezed_model/response/retrieves_single_gift_card_response.dart';
import 'package:apis/network/remote/gift_card/freezed_model/response/searches_for_gift_cards_response.dart';
import 'package:apis/network/remote/gift_card/freezed_model/response/updates_gift_card_response.dart';

/// 🔑 Abstract contract for Gift Card Service
/// Implement this to interact with Shopify Gift Card API! 🎁
abstract class GiftCardService {
  /// 🎁 Create a new gift card
  Future<CreateNewGiftCardResponse> createNewGiftCard({
    required String apiVersion,
    required CreateNewGiftCardRequest model,
  });

  /// 🎫 Create a gift card with custom code
  Future<CreateGiftCardWithCustomCodeResponse> createGiftCardWithCustomCode({
    required String apiVersion,
    required CreateGiftCardWithCustomCodeRequest model,
  });

  /// 🤖 Automatically create a gift card
  Future<AutomaticallyCreateGiftCardResponse> automaticallyCreateGiftCard({
    required String apiVersion,
    required AutomaticallyCreateGiftCardRequest model,
  });

  /// ❌ Disable a gift card
  Future<DisableGiftCardResponse> disableGiftCard({
    required String apiVersion,
    required String giftCardId,
    required DisableGiftCardRequest model,
  });

  /// 🔧 Update a gift card
  Future<UpdatesGiftCardResponse> updateGiftCard({
    required String apiVersion,
    required String giftCardId,
    required UpdatesGiftCardRequest model,
  });

  /// 🔢 Retrieve count of all gift cards
  Future<RetrievesCountOfGiftCardResponse> retrievesCountOfGiftCards({
    required String apiVersion,
  });

  /// 📋 Retrieve list of gift cards
  Future<RetrievesListOfGiftCardResponse> retrievesListOfGiftCards({
    required String apiVersion,
    int? limit,
    int? page,
    String? fields,
    String? status,
    String? sinceId,
  });

  /// 🔍 Search for gift cards by query (supports advanced filters)
  Future<SearchesForGiftCardResponse> searchesForGiftCards({
    required String apiVersion,
    required String query,
    int? limit,
    String? order,
    String? fields,
    String? createdAtMin,
    String? createdAtMax,
    String? updatedAtMin,
    String? updatedAtMax,
  });

  /// 🔎 Retrieve a single gift card by ID
  Future<RetrievesSingleGiftCardResponse> retrievesSingleGiftCard({
    required String apiVersion,
    required String giftCardId,
  });
}
