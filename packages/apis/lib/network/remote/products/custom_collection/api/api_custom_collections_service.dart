import 'package:apis/apis.dart';
import 'package:apis/dio_config/api_dio_client.dart';
import 'package:apis/network/remote/products/custom_collection/abstract/custom_collections_service.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/request/add_collect_to_collection_by_product_id_request.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/request/add_metafield_to_custom_collection_request.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/request/create_collection_with_collect_request.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/request/create_custom_collection_base_image_request.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/request/create_custom_collection_request.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/request/create_custom_collection_uploaded_image_request.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/request/create_custom_collection_with_metafield_request.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/request/create_unpublished_custom_collection_request.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/request/hide_published_custom_collection_request.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/request/publish_hidden_custom_collection_request.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/request/update_custom_collection_alt_text_request.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/request/update_custom_collection_description_request.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/request/update_custom_collection_new_image_request.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/request/update_remove_image_request.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/response/add_collect_to_collection_by_product_id_response.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/response/add_metafield_to_custom_collection_response.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/response/count_custom_collections_response.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/response/create_collection_with_collect_response.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/response/create_custom_collection_base_image_response.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/response/create_custom_collection_response.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/response/create_custom_collection_uploaded_image_response.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/response/create_custom_collection_with_metafield_response.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/response/create_unpublished_custom_collection_response.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/response/hide_published_custom_collection_response.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/response/list_all_custom_collections_response.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/response/publish_hidden_custom_collection_response.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/response/specific_custom_collections_response.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/response/update_custom_collection_alt_text_response.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/response/update_custom_collection_description_response.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/response/update_custom_collection_new_image_response.dart';
import 'package:apis/network/remote/products/custom_collection/freezed_model/response/update_remove_image_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'api_custom_collections_service.g.dart';

@RestApi()
@Injectable(as: CustomCollectionsService)

/// 🌐 CustomCollectionsService
abstract class CustomCollectionsServiceClient
    implements CustomCollectionsService {
  /// 🏭 Factory for dependency injection
  @factoryMethod
  factory CustomCollectionsServiceClient(Dio dio) =>
      _CustomCollectionsServiceClient(
        ApiDioClient.starter(),
        baseUrl: ApiNetwork.baseUrl,
      );

  /// 🔄 List all custom collections
  @GET('/api/{api_version}/custom_collections.json')
  Future<ListAllCustomCollectionsResponse> listAllCustomCollections({
    @Path('api_version') required String apiVersion,
    @Query('fields') String? fields,
    @Query('handle') String? handle,
    @Query('ids') String? ids,
    @Query('limit') int? limit,
    @Query('product_id') String? product_id,
    @Query('published_at_max') String? publishedAtMax,
    @Query('published_at_min') String? publishedAtMin,
    @Query('published_status') String? published_status,
    @Query('since_id') String? since_id,
    @Query('title') String? title,
    @Query('updated_at_max') String? updatedAtMax,
    @Query('updated_at_min') String? updatedAtMin,
  });

  /// 🔄 Get specific custom collection by ID
  @GET('/api/{api_version}/custom_collections/{custom_collection_id}.json')
  Future<SpecificCustomCollectionsResponse> specificCustomCollections({
    @Path('api_version') required String apiVersion,
    @Path('custom_collection_id') required int custom_collection_id,
    @Query('fields') String? fields,
  });

  /// 🔄 Count Custom Collections Response
  @GET('/api/{api_version}/custom_collections/count.json')
  Future<CountCustomCollectionsResponse> countCustomCollections({
    @Path('api_version') required String apiVersion,
    @Query('title') String? title,
    @Query('updated_at_min') String? updatedAtMin,
    @Query('updated_at_max') String? updatedAtMax,
    @Query('published_at_min') String? publishedAtMin,
    @Query('published_at_max') String? publishedAtMax,
    @Query('product_id') String? product_id,
    @Query('published_status') String? published_status,
  });

  // ➕ Create Custom Collection
  @POST('/api/{api_version}/custom_collections.json')
  Future<CreateCustomCollectionResponse> createCustomCollection({
    @Path('api_version') required String apiVersion,
    @Body() required CreateCustomCollectionRequest model,
  });

  // ➕ Create Unpublished Custom Collection
  @POST('/api/{api_version}/custom_collections.json')
  Future<CreateUnpublishedCustomCollectionResponse>
      createUnpublishedCustomCollection({
    @Path('api_version') required String apiVersion,
    @Body() required CreateUnpublishedCustomCollectionRequest model,
  });

  // ➕ Create Collection With Collect
  @POST('/api/{api_version}/custom_collections.json')
  Future<CreateCollectionWithCollectResponse> createCollectionWithCollect({
    @Path('api_version') required String apiVersion,
    @Body() required CreateCollectionWithCollectRequest model,
  });

  // ➕ Create Custom Collection Base Image
  @POST('/api/{api_version}/custom_collections.json')
  Future<CreateCustomCollectionBaseImageResponse>
      createCustomCollectionBaseImage({
    @Path('api_version') required String apiVersion,
    @Body() required CreateCustomCollectionBaseImageRequest model,
  });

  // ➕ Create Custom Collection With Metafield
  @POST('/api/{api_version}/custom_collections.json')
  Future<CreateCustomCollectionWithMetafieldResponse>
      createCustomCollectionWithMetafield({
    @Path('api_version') required String apiVersion,
    @Body() required CreateCustomCollectionWithMetafieldRequest model,
  });

  // ➕ Create Custom Collection Uploaded Image
  @POST('/api/{api_version}/custom_collections.json')
  Future<CreateCustomCollectionUploadedImageResponse>
      createCustomCollectionUploadedImage({
    @Path('api_version') required String apiVersion,
    @Body() required CreateCustomCollectionUploadedImageRequest model,
  });

  // 📝 Update Custom Collection Description
  @PUT('/api/{api_version}/custom_collections/{custom_collection_id}.json')
  Future<UpdateCustomCollectionDescriptionResponse>
      updateCustomCollectionDescription({
    @Path('api_version') required String apiVersion,
    @Path('custom_collection_id') required int customCollectionId,
    @Body() required UpdateCustomCollectionDescriptionRequest model,
  });

  // 🗑️ Update Remove Image from Custom Collection
  @PUT('/api/{api_version}/custom_collections/{custom_collection_id}.json')
  Future<UpdateRemoveImageResponse> updateRemoveImage({
    @Path('api_version') required String apiVersion,
    @Path('custom_collection_id') required int customCollectionId,
    @Body() required UpdateRemoveImageRequest model,
  });

  // 🖼️ Update Custom Collection New Image
  @PUT('/api/{api_version}/custom_collections/{custom_collection_id}.json')
  Future<UpdateCustomCollectionNewImageResponse>
      updateCustomCollectionNewImage({
    @Path('api_version') required String apiVersion,
    @Path('custom_collection_id') required int customCollectionId,
    @Body() required UpdateCustomCollectionNewImageRequest model,
  });

  // 🏷️ Update Custom Collection Alt Text
  @PUT('/api/{api_version}/custom_collections/{custom_collection_id}.json')
  Future<UpdateCustomCollectionAltTextResponse> updateCustomCollectionAltText({
    @Path('api_version') required String apiVersion,
    @Path('custom_collection_id') required int customCollectionId,
    @Body() required UpdateCustomCollectionAltTextRequest model,
  });

  // 📢 Publish Hidden Custom Collection
  @PUT('/api/{api_version}/custom_collections/{custom_collection_id}.json')
  Future<PublishHiddenCustomCollectionResponse> publishHiddenCustomCollection({
    @Path('api_version') required String apiVersion,
    @Path('custom_collection_id') required int customCollectionId,
    @Body() required PublishHiddenCustomCollectionRequest model,
  });

  // 🫥 Hide Published Custom Collection
  @PUT('/api/{api_version}/custom_collections/{custom_collection_id}.json')
  Future<HidePublishedCustomCollectionResponse> hidePublishedCustomCollection({
    @Path('api_version') required String apiVersion,
    @Path('custom_collection_id') required int customCollectionId,
    @Body() required HidePublishedCustomCollectionRequest model,
  });

  // ➕ Add Collect to Collection by Product ID
  @PUT('/api/{api_version}/custom_collections/{custom_collection_id}.json')
  Future<AddCollectToCollectionByProductIdResponse>
      addCollectToCollectionByProductId({
    @Path('api_version') required String apiVersion,
    @Path('custom_collection_id') required int customCollectionId,
    @Body() required AddCollectToCollectionByProductIdRequest model,
  });

  // 🏷️ Add Metafield to Custom Collection
  @PUT('/api/{api_version}/custom_collections/{custom_collection_id}.json')
  Future<AddMetafieldToCustomCollectionResponse>
      addMetafieldToCustomCollection({
    @Path('api_version') required String apiVersion,
    @Path('custom_collection_id') required int customCollectionId,
    @Body() required AddMetafieldToCustomCollectionRequest model,
  });

  // 🗑️ Delete Custom Collection
  @DELETE('/api/{api_version}/custom_collections/{custom_collection_id}.json')
  Future<void> deleteCustomCollection({
    @Path('api_version') required String apiVersion,
    @Path('custom_collection_id') required int customCollectionId,
  });
}
