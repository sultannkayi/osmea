import 'package:apis/network/remote/smart_collections/freezed_model/request/create_smart_collection_request.dart';
import 'package:apis/network/remote/smart_collections/freezed_model/request/updates_existing_smart_collection_request.dart';
import 'package:apis/network/remote/smart_collections/freezed_model/request/updates_ordering_type_of_products_smart_collection_request.dart';
import 'package:apis/network/remote/smart_collections/freezed_model/response/retrieves_list_of_smart_collections_response.dart';
import 'package:apis/network/remote/smart_collections/freezed_model/response/retrieves_single_smart_collection_response.dart';
import 'package:apis/network/remote/smart_collections/freezed_model/response/retrieves_count_of_smart_collections_response.dart';
import 'package:apis/network/remote/smart_collections/freezed_model/response/updates_existing_smart_collection_response.dart';
import 'package:apis/network/remote/smart_collections/freezed_model/response/updates_ordering_type_of_products_smart_collection_response.dart';

/// 🌐 SmartCollectionService
abstract class SmartCollectionService {
  /// 📥 Retrieves all smart collections
  Future<RetrievesListOfSmartCollectionsResponse> listSmartCollections({
    required String apiVersion,
    int? limit,
    String? sinceId,
    String? fields,
    String? ids,
    String? title,
    String? handle,
    String? productId,
    String? updatedAtMin,
    String? updatedAtMax,
    String? publishedAtMin,
    String? publishedAtMax,
    String? publishedStatus,
  });

  /// 📄 Retrieves a single smart collection by ID
  Future<RetrievesSingleSmartCollectionsResponse>
      retrieveSingleSmartCollection({
    required String apiVersion,
    required String id,
    String? fields,
  });

  /// 🔢 Retrieves count of smart collections
  Future<RetrievesCountOfSmartCollectionsResponse> countSmartCollections({
    required String apiVersion,
    String? title,
    String? productId,
    String? updatedAtMin,
    String? updatedAtMax,
    String? publishedAtMin,
    String? publishedAtMax,
    String? publishedStatus,
  });

  /// 🆕 Creates a new smart collection
  Future<RetrievesSingleSmartCollectionsResponse> createSmartCollection({
    required String apiVersion,
    required CreateSmartCollectionRequest model,
  });

  /// ❌ Deletes a smart collection by ID
  Future<void> deleteSmartCollection({
    required String apiVersion,
    required String id,
  });

  /// ✏ Updates an existing smart collection
  Future<UpdatesExistingSmartCollectionResponse> updateSmartCollection({
    required String apiVersion,
    required String id,
    required UpdateSmartCollectionRequest model,
  });

  /// 🔀 Updates product order of a smart collection
  Future<UpdatesOrderingTypeOfProductsSmartCollection> updateProductOrder({
    required String apiVersion,
    required String id,
    required UpdateOrderingTypeOfProductsRequest model,
  });
}