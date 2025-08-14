import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/coupons/abstract/coupons_service.dart';
import 'package:apis/network/remote/woocommerce/coupons/freezed_model/request/update_coupon_request.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:get_it/get_it.dart';
import 'package:api_explorer/services/api_service_registry.dart';

///*******************************************************************
///******************* 🔄 UPDATE COUPON HANDLER *********************
///*******************************************************************

class UpdateCouponHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'PUT') {
      return {
        "status": "error",
        "message": "Method $method not supported for Update Coupon API",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    // Validate required parameter
    if (!params.containsKey('coupon_id') || params['coupon_id']!.isEmpty) {
      return {
        "status": "error",
        "message": "Coupon ID is required",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      // Parse coupon ID
      final couponId = int.tryParse(params['coupon_id']!);
      if (couponId == null) {
        return {
          "status": "error",
          "message": "Coupon ID must be a valid integer",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      // Parse parameters
      final code = params['code']?.isNotEmpty == true ? params['code'] : null;
      final amount =
          params['amount']?.isNotEmpty == true ? params['amount'] : null;
      final discountType = params['discount_type']?.isNotEmpty == true
          ? params['discount_type']
          : null;
      final description = params['description']?.isNotEmpty == true
          ? params['description']
          : null;
      final dateExpires = params['date_expires']?.isNotEmpty == true
          ? params['date_expires']
          : null;
      final individualUse = params['individual_use'] == 'true'
          ? true
          : (params['individual_use'] == 'false' ? false : null);
      final freeShipping = params['free_shipping'] == 'true'
          ? true
          : (params['free_shipping'] == 'false' ? false : null);
      final excludeSaleItems = params['exclude_sale_items'] == 'true'
          ? true
          : (params['exclude_sale_items'] == 'false' ? false : null);
      final minimumAmount = params['minimum_amount']?.isNotEmpty == true
          ? params['minimum_amount']
          : null;
      final maximumAmount = params['maximum_amount']?.isNotEmpty == true
          ? params['maximum_amount']
          : null;

      // Parse numeric values
      final usageLimit =
          params['usage_limit'] != null && params['usage_limit']!.isNotEmpty
              ? int.tryParse(params['usage_limit']!)
              : null;
      final usageLimitPerUser = params['usage_limit_per_user'] != null &&
              params['usage_limit_per_user']!.isNotEmpty
          ? int.tryParse(params['usage_limit_per_user']!)
          : null;
      final limitUsageToXItems = params['limit_usage_to_x_items'] != null &&
              params['limit_usage_to_x_items']!.isNotEmpty
          ? int.tryParse(params['limit_usage_to_x_items']!)
          : null;

      // Parse lists (only if not empty)
      final productIds =
          params['product_ids'] != null && params['product_ids']!.isNotEmpty
              ? params['product_ids']!
                  .split(',')
                  .map((e) => int.tryParse(e.trim()))
                  .where((e) => e != null)
                  .cast<int>()
                  .toList()
              : null;
      final excludedProductIds = params['excluded_product_ids'] != null &&
              params['excluded_product_ids']!.isNotEmpty
          ? params['excluded_product_ids']!
              .split(',')
              .map((e) => int.tryParse(e.trim()))
              .where((e) => e != null)
              .cast<int>()
              .toList()
          : null;
      final productCategories = params['product_categories'] != null &&
              params['product_categories']!.isNotEmpty
          ? params['product_categories']!
              .split(',')
              .map((e) => int.tryParse(e.trim()))
              .where((e) => e != null)
              .cast<int>()
              .toList()
          : null;
      final excludedProductCategories =
          params['excluded_product_categories'] != null &&
                  params['excluded_product_categories']!.isNotEmpty
              ? params['excluded_product_categories']!
                  .split(',')
                  .map((e) => int.tryParse(e.trim()))
                  .where((e) => e != null)
                  .cast<int>()
                  .toList()
              : null;
      final emailRestrictions = params['email_restrictions'] != null &&
              params['email_restrictions']!.isNotEmpty
          ? params['email_restrictions']!
              .split(',')
              .map((e) => e.trim())
              .where((e) => e.isNotEmpty)
              .toList()
          : null;

      // Create coupon update request (only include non-null fields)
      final couponData = UpdateCouponRequest(
        code: code,
        amount: amount,
        discountType: discountType,
        description: description,
        dateExpires: dateExpires,
        individualUse: individualUse,
        productIds: productIds,
        excludedProductIds: excludedProductIds,
        usageLimit: usageLimit,
        usageLimitPerUser: usageLimitPerUser,
        limitUsageToXItems: limitUsageToXItems,
        freeShipping: freeShipping,
        productCategories: productCategories,
        excludedProductCategories: excludedProductCategories,
        excludeSaleItems: excludeSaleItems,
        minimumAmount: minimumAmount,
        maximumAmount: maximumAmount,
        emailRestrictions: emailRestrictions,
      );

      // Remove null values from the request
      final jsonData = couponData.toJson();
      jsonData.removeWhere((key, value) => value == null);

      final response = await GetIt.I<CouponsService>().updateCoupon(
        apiVersion: WooNetwork.apiVersion,
        couponId: couponId,
        couponData: jsonData,
      );

      return {
        "status": "success",
        "coupon": response.toJson(),
        "params": params,
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      return {
        "status": "error",
        "message": "Failed to update coupon: ${e.toString()}",
        "params": params,
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  @override
  List<String> get supportedMethods => ['PUT'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'PUT': [
          const ApiField(
            name: 'coupon_id',
            label: 'Coupon ID',
            hint: 'ID of the coupon to update',
            isRequired: true,
            type: ApiFieldType.number,
          ),
          const ApiField(
            name: 'code',
            label: 'Coupon Code',
            hint: 'Unique coupon code',
          ),
          const ApiField(
            name: 'amount',
            label: 'Amount',
            hint: 'The amount of discount',
          ),
          const ApiField(
            name: 'discount_type',
            label: 'Discount Type',
            hint:
                'Type of discount (fixed_cart, percent, fixed_product, percent_product)',
          ),
          const ApiField(
            name: 'description',
            label: 'Description',
            hint: 'Coupon description',
          ),
          const ApiField(
            name: 'date_expires',
            label: 'Date Expires',
            hint: 'Expiry date in ISO 8601 format (YYYY-MM-DD)',
            type: ApiFieldType.date,
          ),
          const ApiField(
            name: 'individual_use',
            label: 'Individual Use',
            hint:
                'If true, the coupon can only be used individually (true/false)',
            type: ApiFieldType.boolean,
          ),
          const ApiField(
            name: 'product_ids',
            label: 'Product IDs',
            hint: 'List of product IDs (comma-separated)',
          ),
          const ApiField(
            name: 'excluded_product_ids',
            label: 'Excluded Product IDs',
            hint: 'List of excluded product IDs (comma-separated)',
          ),
          const ApiField(
            name: 'usage_limit',
            label: 'Usage Limit',
            hint: 'How many times the coupon can be used in total',
            type: ApiFieldType.number,
          ),
          const ApiField(
            name: 'usage_limit_per_user',
            label: 'Usage Limit Per User',
            hint: 'How many times the coupon can be used per customer',
            type: ApiFieldType.number,
          ),
          const ApiField(
            name: 'limit_usage_to_x_items',
            label: 'Limit Usage to X Items',
            hint:
                'Max number of items in the cart the coupon can be applied to',
            type: ApiFieldType.number,
          ),
          const ApiField(
            name: 'free_shipping',
            label: 'Free Shipping',
            hint:
                'If true and if the free shipping method is enabled, coupon grants free shipping (true/false)',
            type: ApiFieldType.boolean,
          ),
          const ApiField(
            name: 'product_categories',
            label: 'Product Categories',
            hint: 'List of category IDs (comma-separated)',
          ),
          const ApiField(
            name: 'excluded_product_categories',
            label: 'Excluded Product Categories',
            hint: 'List of excluded category IDs (comma-separated)',
          ),
          const ApiField(
            name: 'exclude_sale_items',
            label: 'Exclude Sale Items',
            hint:
                'If true, the coupon will not apply to items on sale (true/false)',
            type: ApiFieldType.boolean,
          ),
          const ApiField(
            name: 'minimum_amount',
            label: 'Minimum Amount',
            hint:
                'Minimum order amount that needs to be in the cart before coupon applies',
          ),
          const ApiField(
            name: 'maximum_amount',
            label: 'Maximum Amount',
            hint: 'Maximum order amount allowed when using the coupon',
          ),
          const ApiField(
            name: 'email_restrictions',
            label: 'Email Restrictions',
            hint: 'List of allowed email addresses (comma-separated)',
          ),
        ],
      };
}
