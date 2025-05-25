import 'package:apis/network/remote/smart_collections/freezed_model/response/retrieves_list_of_smart_collections_response.dart';

/// 🌐 SmartCollectionService
abstract class SmartCollectionService {
  /// 📥 Retrieves all smart collections
  Future<RetrievesListOfSmartCollectionsResponse> listSmartCollections({
    required String apiVersion,
    int? limit,
    String? sinceId,
    String? fields,
  });
}
