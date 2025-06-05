import 'package:apis/apis.dart';
import 'package:apis/dio_config/api_dio_client.dart';
import 'package:apis/network/remote/billing/usage_charge/abstract/usage_charge_service.dart';
import 'package:apis/network/remote/billing/usage_charge/freezed_model/response/get_all_usage_charges_response.dart';
import 'package:apis/network/remote/billing/usage_charge/freezed_model/response/get_a_usage_charge_response.dart';
import 'package:apis/network/remote/billing/usage_charge/freezed_model/request/create_usage_charge_request.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'api_usage_charge_service.g.dart';

/// 🌐 UsageChargeServiceClient
/// Retrofit client for usage charge operations.
@RestApi()
@Injectable(as: UsageChargeService)
abstract class UsageChargeServiceClient implements UsageChargeService {
  /// 🏭 Factory for dependency injection
  @factoryMethod
  factory UsageChargeServiceClient(Dio dio) => _UsageChargeServiceClient(
        ApiDioClient.starter(),
        baseUrl: ApiNetwork.baseUrl,
      );

  /// 📋 Get usage charges from API
  @override
  @GET('/api/{api_version}/recurring_application_charges/{recurring_application_charge_id}/usage_charges.json')
  Future<GetAllUsageChargesResponse> getUsageCharges({
    @Path('api_version') required String apiVersion,
    @Path('recurring_application_charge_id') required int recurringApplicationChargeId,
    @Query('fields') String? fields,
  });

  /// 🔍 Get a single usage charge by ID
  @override
  @GET('/api/{api_version}/recurring_application_charges/{recurring_application_charge_id}/usage_charges/{id}.json')
  Future<GetAUsageChargeResponse> getUsageCharge({
    @Path('api_version') required String apiVersion,
    @Path('recurring_application_charge_id') required int recurringApplicationChargeId,
    @Path('id') required int id,
    @Query('fields') String? fields,
  });

  /// 🆕 Create a new usage charge
  @override
  @POST('/api/{api_version}/recurring_application_charges/{recurring_application_charge_id}/usage_charges.json')
  Future<GetAUsageChargeResponse> createUsageCharge({
    @Path('api_version') required String apiVersion,
    @Path('recurring_application_charge_id') required int recurringApplicationChargeId,
    @Body() required CreateUsageChargeRequest model,
  });
}