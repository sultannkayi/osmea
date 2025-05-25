import 'package:apis/network/remote/products/collection/freezed_model/products_belonging_to_collection_response.dart';
import 'package:apis/network/remote/products/collection/freezed_model/single_collection_response.dart';

abstract class CollectionService {
  Future<SingleCollectionResponse>singleCollectionResponse({
    required String apiVersion,
    required String collectionId,
    String? fields,
  });

  Future<ProductsBelongingToCollectionResponse> productsBelongingToCollection({
    required String apiVersion,
    required String collectionId,
  });
}