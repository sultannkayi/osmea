import 'package:apis/network/remote/products/collect/freezed_model/request/create_collect_request.dart';
import 'package:apis/network/remote/products/collect/freezed_model/response/get_collects_response.dart';
import 'package:apis/network/remote/products/collect/freezed_model/response/get_single_collect_response.dart';
import 'package:apis/network/remote/products/collect/freezed_model/response/get_collects_count_response.dart';
import 'package:apis/network/remote/products/collect/freezed_model/response/create_collect_response.dart';

/// 🔑 Abstract contract for Collect Service
/// Implement this to fetch collects from Shopify API! 🌐
abstract class CollectService {
  /// 📋 Retrieve list of collects
  Future<GetCollectsResponse> getCollects({
    required String apiVersion,
    int? limit,
    String? sinceId,
    String? fields,
    String? productId,
    String? collectionId,
  });

  /// 📋 Retrieve list of collects filtered by collection
  Future<GetCollectsResponse> getCollectsByCollection({
    required String apiVersion,
    required String collectionId,
    int? limit,
    String? sinceId,
    String? fields,
  });

  /// 📋 Retrieve list of collects filtered by product
  Future<GetCollectsResponse> getCollectsByProduct({
    required String apiVersion,
    required String productId,
    int? limit,
    String? sinceId,
    String? fields,
  });

  /// 🔍 Retrieve a single collect
  Future<GetSingleCollectResponse> getSingleCollect({
    required String apiVersion,
    required String collectId,
    String? fields,
  });

  /// 🔢 Retrieve count of collects
  Future<GetCollectsCountResponse> getCollectsCount({
    required String apiVersion,
    String? productId,
    String? collectionId,
  });

  /// 🔢 Retrieve count of collects filtered by collection
  Future<GetCollectsCountResponse> getCollectsCountByCollection({
    required String apiVersion,
    required String collectionId,
  });

  /// 🔢 Retrieve count of collects filtered by product
  Future<GetCollectsCountResponse> getCollectsCountByProduct({
    required String apiVersion,
    required String productId,
  });

  /// ➕ Create a new collect (associate product with collection)
  Future<CreateCollectResponse> createCollect({
    required String apiVersion,
    required CreateCollectRequest model,
  });

  /// 🗑️ Delete a collect by ID
  Future<void> deleteCollect({
    required String apiVersion,
    required String collectId,
  });
}