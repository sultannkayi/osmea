import 'package:apis/network/remote/billing/recurring_application_charge/freezed_model/response/get_all_recurring_application_charges_response.dart';
import 'package:apis/network/remote/billing/recurring_application_charge/freezed_model/response/get_a_recurring_application_charge_response.dart';
import 'package:apis/network/remote/billing/recurring_application_charge/freezed_model/request/customize_recurring_application_charge_request.dart';
import 'package:apis/network/remote/billing/recurring_application_charge/freezed_model/request/create_basic_recurring_application_charge_request.dart';
import 'package:apis/network/remote/billing/recurring_application_charge/freezed_model/request/create_trial_recurring_application_charge_request.dart';
import 'package:apis/network/remote/billing/recurring_application_charge/freezed_model/request/create_capped_recurring_application_charge_request.dart';

abstract class RecurringApplicationChargeService {
  /// Gets all recurring application charges
  Future<GetAllRecurringApplicationChargesResponse> getRecurringApplicationCharges({
    required String apiVersion,
    String? fields,
    String? sinceId,
  });

  /// Gets a single recurring application charge by ID
  Future<GetARecurringApplicationChargeResponse> getRecurringApplicationCharge({
    required String apiVersion,
    required int id,
    String? fields,
  });

  /// Customizes a recurring application charge
  Future<GetARecurringApplicationChargeResponse> customizeRecurringApplicationCharge({
    required String apiVersion,
    required int id,
    required CustomizeRecurringApplicationChargeRequest model,
  });

  /// Deletes a recurring application charge
  Future<void> deleteRecurringApplicationCharge({
    required String apiVersion,
    required int id,
  });

  /// Creates a basic recurring application charge
  Future<GetARecurringApplicationChargeResponse> createBasicRecurringApplicationCharge({
    required String apiVersion,
    required CreateBasicRecurringApplicationChargeRequest model,
  });

  /// Creates a recurring application charge with trial period
  Future<GetARecurringApplicationChargeResponse> createTrialRecurringApplicationCharge({
    required String apiVersion,
    required CreateTrialRecurringApplicationChargeRequest model,
  });

  /// Creates a recurring application charge with terms and capped amount
  Future<GetARecurringApplicationChargeResponse> createCappedRecurringApplicationCharge({
    required String apiVersion,
    required CreateCappedRecurringApplicationChargeRequest model,
  });
}