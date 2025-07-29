import 'package:apis/network/remote/woocommerce/taxes/rates/freezed_model/response/retrieve_tax_rate_response.dart';
import 'package:apis/network/remote/woocommerce/taxes/rates/freezed_model/response/delete_tax_rate_response.dart';
import 'package:apis/network/remote/woocommerce/taxes/rates/freezed_model/response/list_tax_rates_response.dart';
import 'package:apis/network/remote/woocommerce/taxes/rates/freezed_model/request/create_tax_rate_request.dart';
import 'package:apis/network/remote/woocommerce/taxes/rates/freezed_model/response/create_tax_rate_response.dart';
import 'package:apis/network/remote/woocommerce/taxes/rates/freezed_model/request/update_tax_rate_request.dart';
import 'package:apis/network/remote/woocommerce/taxes/rates/freezed_model/response/update_tax_rate_response.dart';
import 'package:apis/network/remote/woocommerce/taxes/rates/freezed_model/request/batch_update_taxes_rates_request.dart';
import 'package:apis/network/remote/woocommerce/taxes/rates/freezed_model/response/batch_update_taxes_rates_response.dart';

/// 🔑 Abstract contract for WooCommerce Tax Rates Service
/// Implement this to fetch tax rates from WooCommerce API! 🌐
abstract class TaxesRatesService {
  /// 🚀 Fetches the tax rates from the WooCommerce API.
  Future<List<RetrieveTaxRateResponse>> listTaxRates({
    String? apiVersion,
    String? context,
    int? page,
    int? perPage,
    String? search,
    String? after,
    String? before,
    List<String>? exclude,
    List<String>? include,
    int? offset,
    String? order,
    String? orderBy,
    String? taxClass,
  });

  /// 🚀 Fetches all tax rates from the WooCommerce API.
  Future<List<ListTaxRatesResponse>> listAllTaxRates({
    String? apiVersion,
    String? context,
    int? page,
    int? perPage,
    String? search,
    String? after,
    String? before,
    List<String>? exclude,
    List<String>? include,
    int? offset,
    String? order,
    String? orderBy,
    String? taxClass,
  });

  /// 🎯 Retrieves a specific tax rate by ID from the WooCommerce API.
  Future<RetrieveTaxRateResponse> retrieveTaxRate({
    String? apiVersion,
    int? taxRateId,
    String? context,
  });

  /// ✨ Creates a new tax rate in the WooCommerce API.
  Future<CreateTaxRateResponse> createTaxRate({
    String? apiVersion,
    CreateTaxRateRequest? taxRateData,
  });

  /// � Updates an existing tax rate in the WooCommerce API.
  Future<UpdateTaxRateResponse> updateTaxRate({
    String? apiVersion,
    int? taxRateId,
    UpdateTaxRateRequest? taxRateData,
  });

  /// �🗑️ Deletes a tax rate from the WooCommerce API.
  Future<DeleteTaxRateResponse> deleteTaxRate({
    String? apiVersion,
    int? taxRateId,
    bool? force,
  });

  /// 📦 Batch update tax rates in the WooCommerce API.
  Future<BatchUpdateTaxesRatesResponse> batchUpdateTaxRates({
    required String apiVersion,
    required BatchUpdateTaxesRatesRequest batchData,
  });
}

