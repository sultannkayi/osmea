import 'package:apis/network/remote/billing/usage_charge/freezed_model/response/get_all_usage_charges_response.dart';
import 'package:apis/network/remote/billing/usage_charge/freezed_model/response/get_a_usage_charge_response.dart';
import 'package:apis/network/remote/billing/usage_charge/freezed_model/request/create_usage_charge_request.dart';

abstract class UsageChargeService {
  /// Gets all usage charges for a recurring application charge
  Future<GetAllUsageChargesResponse> getUsageCharges({
    required String apiVersion,
    required int recurringApplicationChargeId,
    String? fields,
  });

  /// Gets a single usage charge by ID
  Future<GetAUsageChargeResponse> getUsageCharge({
    required String apiVersion,
    required int recurringApplicationChargeId,
    required int id,
    String? fields,
  });

  /// Creates a usage charge
  Future<GetAUsageChargeResponse> createUsageCharge({
    required String apiVersion,
    required int recurringApplicationChargeId,
    required CreateUsageChargeRequest model,
  });
}