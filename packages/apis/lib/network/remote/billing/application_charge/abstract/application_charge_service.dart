import 'package:apis/network/remote/billing/application_charge/freezed_model/response/get_all_application_charges_response.dart';
import 'package:apis/network/remote/billing/application_charge/freezed_model/response/get_an_application_charge_response.dart';
import 'package:apis/network/remote/billing/application_charge/freezed_model/response/create_application_charge_response.dart';
import 'package:apis/network/remote/billing/application_charge/freezed_model/request/create_application_charge_request.dart';

abstract class ApplicationChargeService {
  /// Gets all application charges
  Future<GetAllApplicationChargesResponse> getApplicationCharges({
    required String apiVersion,
    String? fields,     // Comma-separated list of fields to include in the response
    String? sinceId,    // Only return charges after this ID (for pagination)
  });

  /// Gets a single application charge by ID
  Future<GetAnApplicationChargeResponse> getApplicationCharge({
    required String apiVersion,
    required int id,
    String? fields,     // Comma-separated list of fields to include in the response
  });

  /// Creates a new application charge
  Future<CreateApplicationChargeResponse> createApplicationCharge({
    required String apiVersion,
    required CreateApplicationChargeRequest model,
  });
}