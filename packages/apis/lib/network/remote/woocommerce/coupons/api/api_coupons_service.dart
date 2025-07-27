import 'package:apis/apis.dart';
import 'package:apis/dio_config/api_dio_client.dart';
import 'package:apis/network/remote/woocommerce/coupons/abstract/coupons_service.dart';
import 'package:apis/network/remote/woocommerce/coupons/freezed_model/response/list_all_coupons_response.dart';
import 'package:apis/network/remote/woocommerce/coupons/freezed_model/response/retrieve_coupon_response.dart';
import 'package:apis/network/remote/woocommerce/coupons/freezed_model/request/create_coupon_request.dart';
import 'package:apis/network/remote/woocommerce/coupons/freezed_model/response/create_coupon_response.dart';
import 'package:apis/network/remote/woocommerce/coupons/freezed_model/request/update_coupon_request.dart';
import 'package:apis/network/remote/woocommerce/coupons/freezed_model/response/update_coupon_response.dart';
import 'package:apis/network/remote/woocommerce/coupons/freezed_model/response/delete_coupon_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'api_coupons_service.g.dart';

/// 🌐 CouponsServiceClient
/// Retrofit client for WooCommerce Coupons API.
/// Make sure WooNetwork.storeUrl, username, and password are set before using! 🏬🔑
@RestApi()
@Injectable(as: CouponsService)
abstract class CouponsServiceClient implements CouponsService {
  /// 🏭 Factory for dependency injection
  @factoryMethod
  factory CouponsServiceClient(Dio dio) => _CouponsServiceClient(
        ApiDioClient.wooDio(),
        baseUrl: WooNetwork.baseUrl,
      );

  /// 🔓 Get coupons from WooCommerce API
  @override
  @GET('/wp-json/wc/{api_version}/coupons')
  Future<List<ListAllCouponsResponse>> listAllCoupons({
    @Path('api_version') required String apiVersion,
    @Query('context') String? context,
    @Query('page') int? page,
    @Query('per_page') int? perPage,
    @Query('search') String? search,
    @Query('after') String? after,
    @Query('before') String? before,
    @Query('exclude') List<String>? exclude,
    @Query('include') List<String>? include,
    @Query('offset') int? offset,
    @Query('order') String? order,
    @Query('orderby') String? orderBy,
    @Query('code') String? code,
  });

  /// 🎯 Get a specific coupon by ID from WooCommerce API
  @override
  @GET('/wp-json/wc/{api_version}/coupons/{coupon_id}')
  Future<RetrieveCouponResponse> retrieveCoupon({
    @Path('api_version') required String apiVersion,
    @Path('coupon_id') required int couponId,
    @Query('context') String? context,
  });

  /// ✨ Create a new coupon in WooCommerce API
  @override
  @POST('/wp-json/wc/{api_version}/coupons')
  Future<CreateCouponResponse> createCoupon({
    @Path('api_version') required String apiVersion,
    @Body() required CreateCouponRequest couponData,
  });

  /// 🔄 Update an existing coupon in WooCommerce API
  @override
  @PUT('/wp-json/wc/{api_version}/coupons/{coupon_id}')
  Future<UpdateCouponResponse> updateCoupon({
    @Path('api_version') required String apiVersion,
    @Path('coupon_id') required int couponId,
    @Body() required Map<String, dynamic> couponData,
  });

  /// 🗑️ Delete a coupon from WooCommerce API
  @override
  @DELETE('/wp-json/wc/{api_version}/coupons/{coupon_id}')
  Future<DeleteCouponResponse> deleteCoupon({
    @Path('api_version') required String apiVersion,
    @Path('coupon_id') required int couponId,
    @Query('force') bool? force,
  });
}
