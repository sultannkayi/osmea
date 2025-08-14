import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/coupons/abstract/coupons_service.dart';
import 'package:apis/network/remote/woocommerce/coupons/freezed_model/request/create_coupon_request.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:get_it/get_it.dart';
import 'package:api_explorer/services/api_service_registry.dart';

///*******************************************************************
///******************* ✨ CREATE COUPON HANDLER *********************
///*******************************************************************

class CreateCouponHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'POST') {
      return {
        "status": "error",
        "message": "Method $method not supported for Create Coupon API",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    // Validate required parameter
    if (!params.containsKey('code') || params['code']!.isEmpty) {
      return {
        "status": "error",
        "message": "Coupon code is required",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      // Parse parameters
      final code = params['code']!;
      final amount = params['amount'];
      final discountType = params['discount_type'] ?? 'fixed_cart';
      final description = params['description'];
      final individualUse = params['individual_use'] == 'true';
      final freeShipping = params['free_shipping'] == 'true';
      final excludeSaleItems = params['exclude_sale_items'] == 'true';
      final minimumAmount = params['minimum_amount'];
      final maximumAmount = params['maximum_amount'];

      // Parse numeric values
      final usageLimit = params['usage_limit'] != null
          ? int.tryParse(params['usage_limit']!)
          : null;
      final usageLimitPerUser = params['usage_limit_per_user'] != null
          ? int.tryParse(params['usage_limit_per_user']!)
          : null;
      final limitUsageToXItems = params['limit_usage_to_x_items'] != null
          ? int.tryParse(params['limit_usage_to_x_items']!)
          : null;

      // Parse lists
      final productIds = params['product_ids']
          ?.split(',')
          .map((e) => int.tryParse(e.trim()))
          .where((e) => e != null)
          .cast<int>()
          .toList();
      final excludedProductIds = params['excluded_product_ids']
          ?.split(',')
          .map((e) => int.tryParse(e.trim()))
          .where((e) => e != null)
          .cast<int>()
          .toList();
      final productCategories = params['product_categories']
          ?.split(',')
          .map((e) => int.tryParse(e.trim()))
          .where((e) => e != null)
          .cast<int>()
          .toList();
      final excludedProductCategories = params['excluded_product_categories']
          ?.split(',')
          .map((e) => int.tryParse(e.trim()))
          .where((e) => e != null)
          .cast<int>()
          .toList();
      final emailRestrictions = params['email_restrictions']
          ?.split(',')
          .map((e) => e.trim())
          .where((e) => e.isNotEmpty)
          .toList();

      // Create coupon request
      final couponData = CreateCouponRequest(
        code: code,
        amount: amount,
        discountType: discountType,
        description: description,
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

      final response = await GetIt.I<CouponsService>().createCoupon(
        apiVersion: WooNetwork.apiVersion,
        couponData: couponData,
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
        "message": "Failed to create coupon: ${e.toString()}",
        "params": params,
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  @override
  List<String> get supportedMethods => ['POST'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'POST': [
          const ApiField(
            name: 'code',
            label: 'Coupon Code',
            hint: 'Unique coupon code',
            isRequired: true,
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
