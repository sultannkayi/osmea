import 'package:apis/apis.dart';
import 'package:apis/dio_config/api_dio_client.dart';
import 'package:apis/network/remote/billing/application_charge/abstract/application_charge_service.dart';
import 'package:apis/network/remote/billing/application_charge/freezed_model/response/get_all_application_charges_response.dart';
import 'package:apis/network/remote/billing/application_charge/freezed_model/response/get_an_application_charge_response.dart';
import 'package:apis/network/remote/billing/application_charge/freezed_model/response/create_application_charge_response.dart';
import 'package:apis/network/remote/billing/application_charge/freezed_model/request/create_application_charge_request.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'api_application_charge_service.g.dart';

/// 🌐 ApplicationChargeServiceClient
/// Retrofit client for application charge operations.
/// Make sure ApiNetwork.storeName and shopifyAccessToken are set before using! 🏬🔑
@RestApi()
@Injectable(as: ApplicationChargeService)
abstract class ApplicationChargeServiceClient implements ApplicationChargeService {
  /// 🏭 Factory for dependency injection
  @factoryMethod
  factory ApplicationChargeServiceClient(Dio dio) => _ApplicationChargeServiceClient(
        ApiDioClient.starter(),
        baseUrl: ApiNetwork.baseUrl,
      );

  /// 📋 Get application charges from API
  @override
  @GET('/api/{api_version}/application_charges.json')
  Future<GetAllApplicationChargesResponse> getApplicationCharges({
    @Path('api_version') required String apiVersion,
    @Query('fields') String? fields,
    @Query('since_id') String? sinceId,
  });

  /// 🔍 Get a single application charge by ID
  @override
  @GET('/api/{api_version}/application_charges/{id}.json')
  Future<GetAnApplicationChargeResponse> getApplicationCharge({
    @Path('api_version') required String apiVersion,
    @Path('id') required int id,
    @Query('fields') String? fields,
  });

  /// 💵 Create a new application charge
  @override
  @POST('/api/{api_version}/application_charges.json')
  Future<CreateApplicationChargeResponse> createApplicationCharge({
    @Path('api_version') required String apiVersion,
    @Body() required CreateApplicationChargeRequest model,
  });
}