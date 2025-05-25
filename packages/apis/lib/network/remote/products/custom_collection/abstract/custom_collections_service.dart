import 'package:apis/network/remote/products/custom_collection/freezed_model/request/create_collection_with_collect_request.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/request/create_custom_collection_base_image_request.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/request/create_custom_collection_request.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/request/create_custom_collection_uploaded_image_request.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/request/create_custom_collection_with_metafield_request.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/request/create_unpublished_custom_collection_request.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/request/update_custom_collection_description_request.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/request/update_custom_collection_alt_text_request.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/request/update_custom_collection_new_image_request.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/request/update_remove_image_request.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/response/count_custom_collections_response.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/response/create_collection_with_collect_response.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/response/create_custom_collection_base_image_response.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/response/create_custom_collection_response.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/response/create_custom_collection_uploaded_image_response.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/response/create_custom_collection_with_metafield_response.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/response/create_unpublished_custom_collection_response.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/response/list_all_custom_collections_response.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/response/specific_custom_collections_response.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/response/update_custom_collection_description_response.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/response/update_custom_collection_alt_text_response.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/response/update_custom_collection_new_image_response.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/response/update_remove_image_response.dart';

abstract class CustomCollectionsService {
  // 📋 List all custom collections
  Future<ListAllCustomCollectionsResponse> listAllCustomCollections({
    required String apiVersion,
    int? limit,
    String? fields,
    String? updatedAtMin,
    String? updatedAtMax,
    String? publishedAtMin,
    String? publishedAtMax,
    String? handle,
    String? ids,
    String? title,
    String? since_id,
    String? product_id,
    String? published_status,
  });

  // 📋 Get specific custom collection by ID
  Future<SpecificCustomCollectionsResponse> specificCustomCollections({
    required String apiVersion,
    required int custom_collection_id,
    String? fields,
  });

  // 📋 Count Custom Collections Response
  Future<CountCustomCollectionsResponse> countCustomCollections({
    required String apiVersion,
    String? title,
    String? updatedAtMin,
    String? updatedAtMax,
    String? publishedAtMin,
    String? publishedAtMax,
    String? product_id,
    String? published_status,
  });

  // ➕ Create Custom Collection
  Future<CreateCustomCollectionResponse> createCustomCollection(
      {required String apiVersion,
      required CreateCustomCollectionRequest model});

  // ➕ Create Unpublished Custom Collection
  Future<CreateUnpublishedCustomCollectionResponse>
      createUnpublishedCustomCollection(
          {required String apiVersion,
          required CreateUnpublishedCustomCollectionRequest model});

  // ➕ Create Collection With Collect
  Future<CreateCollectionWithCollectResponse> createCollectionWithCollect(
      {required String apiVersion,
      required CreateCollectionWithCollectRequest model});

  // ➕ Create Custom Collection Base Image
  Future<CreateCustomCollectionBaseImageResponse>
      createCustomCollectionBaseImage(
          {required String apiVersion,
          required CreateCustomCollectionBaseImageRequest model});

  // ➕ Create Custom Collection With Metafield
  Future<CreateCustomCollectionWithMetafieldResponse>
      createCustomCollectionWithMetafield(
          {required String apiVersion,
          required CreateCustomCollectionWithMetafieldRequest model});

  // ➕ Create Custom Collection Uploaded Image
  Future<CreateCustomCollectionUploadedImageResponse>
      createCustomCollectionUploadedImage(
          {required String apiVersion,
          required CreateCustomCollectionUploadedImageRequest model});

  // 📝 Update Custom Collection Description
  Future<UpdateCustomCollectionDescriptionResponse>
      updateCustomCollectionDescription({
    required String apiVersion,
    required int customCollectionId,
    required UpdateCustomCollectionDescriptionRequest model,
  });

  // 🗑️ Update Remove Image from Custom Collection
  Future<UpdateRemoveImageResponse> updateRemoveImage({
    required String apiVersion,
    required int customCollectionId,
    required UpdateRemoveImageRequest model,
  });

  // 🖼️ Update Custom Collection New Image
  Future<UpdateCustomCollectionNewImageResponse>
      updateCustomCollectionNewImage({
    required String apiVersion,
    required int customCollectionId,
    required UpdateCustomCollectionNewImageRequest model,
  });

  // 🏷️ Update Custom Collection Alt Text
  Future<UpdateCustomCollectionAltTextResponse> updateCustomCollectionAltText({
    required String apiVersion,
    required int customCollectionId,
    required UpdateCustomCollectionAltTextRequest model,
  });
}
