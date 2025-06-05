import 'package:apis/apis.dart';
import 'package:apis/dio_config/api_dio_client.dart';
import 'package:apis/network/remote/billing/recurring_application_charge/abstract/recurring_application_charge_service.dart';
import 'package:apis/network/remote/billing/recurring_application_charge/freezed_model/response/get_all_recurring_application_charges_response.dart';
import 'package:apis/network/remote/billing/recurring_application_charge/freezed_model/response/get_a_recurring_application_charge_response.dart';
import 'package:apis/network/remote/billing/recurring_application_charge/freezed_model/request/customize_recurring_application_charge_request.dart';
import 'package:apis/network/remote/billing/recurring_application_charge/freezed_model/request/create_basic_recurring_application_charge_request.dart';
import 'package:apis/network/remote/billing/recurring_application_charge/freezed_model/request/create_trial_recurring_application_charge_request.dart';
import 'package:apis/network/remote/billing/recurring_application_charge/freezed_model/request/create_capped_recurring_application_charge_request.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'api_recurring_application_charge_service.g.dart';

/// 🌐 RecurringApplicationChargeServiceClient
/// Retrofit client for recurring application charge operations.
/// Make sure ApiNetwork.storeName and shopifyAccessToken are set before using! 🏬🔑
@RestApi()
@Injectable(as: RecurringApplicationChargeService)
abstract class RecurringApplicationChargeServiceClient implements RecurringApplicationChargeService {
  /// 🏭 Factory for dependency injection
  @factoryMethod
  factory RecurringApplicationChargeServiceClient(Dio dio) => _RecurringApplicationChargeServiceClient(
        ApiDioClient.starter(),
        baseUrl: ApiNetwork.baseUrl,
      );

  /// 📋 Get recurring application charges from API
  @override
  @GET('/api/{api_version}/recurring_application_charges.json')
  Future<GetAllRecurringApplicationChargesResponse> getRecurringApplicationCharges({
    @Path('api_version') required String apiVersion,
    @Query('fields') String? fields,
    @Query('since_id') String? sinceId,
  });

  /// 🔍 Get a single recurring application charge by ID
  @override
  @GET('/api/{api_version}/recurring_application_charges/{id}.json')
  Future<GetARecurringApplicationChargeResponse> getRecurringApplicationCharge({
    @Path('api_version') required String apiVersion,
    @Path('id') required int id,
    @Query('fields') String? fields,
  });

  /// 🔧 Customize a recurring application charge (update capped_amount)
  @override
  @PUT('/api/{api_version}/recurring_application_charges/{id}/customize.json')
  Future<GetARecurringApplicationChargeResponse> customizeRecurringApplicationCharge({
    @Path('api_version') required String apiVersion,
    @Path('id') required int id,
    @Body() required CustomizeRecurringApplicationChargeRequest model,
  });

  /// 🗑️ Delete a recurring application charge by ID
  @override
  @DELETE('/api/{api_version}/recurring_application_charges/{id}.json')
  Future<void> deleteRecurringApplicationCharge({
    @Path('api_version') required String apiVersion,
    @Path('id') required int id,
  });

  /// 💳 Create a basic recurring application charge
  @override
  @POST('/api/{api_version}/recurring_application_charges.json')
  Future<GetARecurringApplicationChargeResponse> createBasicRecurringApplicationCharge({
    @Path('api_version') required String apiVersion,
    @Body() required CreateBasicRecurringApplicationChargeRequest model,
  });

  /// 🆓 Create a recurring application charge with trial period
  @override
  @POST('/api/{api_version}/recurring_application_charges.json')
  Future<GetARecurringApplicationChargeResponse> createTrialRecurringApplicationCharge({
    @Path('api_version') required String apiVersion,
    @Body() required CreateTrialRecurringApplicationChargeRequest model,
  });

  /// 🧢 Create a recurring application charge with terms and capped amount
  @override
  @POST('/api/{api_version}/recurring_application_charges.json')
  Future<GetARecurringApplicationChargeResponse> createCappedRecurringApplicationCharge({
    @Path('api_version') required String apiVersion,
    @Body() required CreateCappedRecurringApplicationChargeRequest model,
  });
}