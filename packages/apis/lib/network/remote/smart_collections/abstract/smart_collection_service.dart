import 'package:apis/network/remote/smart_collections/freezed_model/response/retrieves_list_of_smart_collections_response.dart';
import 'package:apis/network/remote/smart_collections/freezed_model/response/retrieves_single_smart_collection_response.dart';
import 'package:apis/network/remote/smart_collections/freezed_model/response/retrieves_count_of_smart_collections_response.dart';
import 'package:apis/network/remote/smart_collections/freezed_model/request/updates_existing_smart_collection_request.dart';
import 'package:apis/network/remote/smart_collections/freezed_model/response/updates_existing_smart_collection_response.dart';
import 'package:apis/network/remote/smart_collections/freezed_model/request/updates_ordering_type_of_products_smart_collection_request.dart';
import 'package:apis/network/remote/smart_collections/freezed_model/response/updates_ordering_type_of_products_smart_collection_response.dart';


/// 🌐 SmartCollectionService
abstract class SmartCollectionService {
  /// 📥 Retrieves all smart collections
  Future<RetrievesListOfSmartCollectionsResponse> listSmartCollections({
    required String apiVersion,
    int? limit,
    String? sinceId,
    String? fields,
  });

  /// 📥 Retrieves a single smart collection by ID
  Future<RetrievesSingleSmartCollectionsResponse>
      retrieveSingleSmartCollection({
    required String apiVersion,
    required String id,
  });

  /// 🔢 Retrieves count of smart collections
  Future<RetrievesCountOfSmartCollectionsResponse> countSmartCollections({
    required String apiVersion,
  });

  /// ✏ Updates an existing smart collection
  Future<UpdatesExistingSmartCollectionResponse> updateSmartCollection({
    required String apiVersion,
    required String id,
    required UpdateSmartCollectionRequest request,
  });

  /// 🔀 Updates product order of a smart collection
  Future<UpdatesOrderingTypeOfProductsSmartCollection> updateProductOrder({
    required String apiVersion,
    required String id,
    required UpdateOrderingTypeOfProductsRequest request,
  });

 

}
