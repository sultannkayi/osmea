import 'package:apis/network/remote/smart_collections/freezed_model/response/retrieves_list_of_smart_collections_response.dart';
import 'package:apis/network/remote/smart_collections/freezed_model/response/retrieves_single_smart_collection_response.dart';
import 'package:apis/network/remote/smart_collections/freezed_model/response/retrieves_count_of_smart_collections_response.dart';


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
}
