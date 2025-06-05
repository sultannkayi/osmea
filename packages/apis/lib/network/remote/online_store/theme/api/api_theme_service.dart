import 'package:apis/apis.dart';
import 'package:apis/dio_config/api_dio_client.dart';
import 'package:apis/network/remote/online_store/theme/abstract/theme_service.dart';
import 'package:apis/network/remote/online_store/theme/freezed_model/request/create_theme_request.dart';
import 'package:apis/network/remote/online_store/theme/freezed_model/request/publish_unpublished_theme_request.dart';
import 'package:apis/network/remote/online_store/theme/freezed_model/request/update_theme_name_request.dart';
import 'package:apis/network/remote/online_store/theme/freezed_model/response/create_theme_response.dart';
import 'package:apis/network/remote/online_store/theme/freezed_model/response/get_single_theme_response.dart';
import 'package:apis/network/remote/online_store/theme/freezed_model/response/list_themes_response.dart';
import 'package:apis/network/remote/online_store/theme/freezed_model/response/publish_unpublished_theme_response.dart';
import 'package:apis/network/remote/online_store/theme/freezed_model/response/update_theme_name_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'api_theme_service.g.dart';

@RestApi()
@Injectable(as: ThemeService)
/// 🌐 ThemeService
abstract class ThemeServiceClient implements ThemeService {
  /// 🏭 Factory for dependency injection
  @factoryMethod
  factory ThemeServiceClient(Dio dio) => _ThemeServiceClient(
        ApiDioClient.starter(),
        baseUrl: ApiNetwork.baseUrl,
      );

  /// 🔄 List all themes
  @GET('/api/{api_version}/themes.json')
  Future<ListThemesResponse> listAllThemes({
    @Path('api_version') required String apiVersion,
    @Query('fields') String? fields,
  });

  /// 🔄 Get single theme
  @GET('/api/{api_version}/themes/{theme_id}.json')
  Future<GetSingleThemeResponse> getSingleTheme({
    @Path('api_version') required String apiVersion,
    @Path('theme_id') required String themeId,
    @Query('fields') String? fields,
  });

  // ✔️ Publish Unpublished Theme
  @PUT('/api/{api_version}/themes/{theme_id}.json')
  Future<PublishUnpublishedThemeResponse> publishUnpublishedTheme({
    @Path('api_version') required String apiVersion,
    @Path('theme_id') required String themeId,
    @Body() required PublishUnpublishedThemeRequest model,
  });

  // 🔄 Update Theme Name
  @PUT('/api/{api_version}/themes/{theme_id}.json')
  Future<UpdateThemeNameResponse> updateThemeName({
    @Path('api_version') required String apiVersion,
    @Path('theme_id') required String themeId,
    @Body() required UpdateThemeNameRequest model,
  });

  // 🆕 Create Theme
  @POST('/api/{api_version}/themes.json')
  Future<CreateThemeResponse> createTheme({
    @Path('api_version') required String apiVersion,
    @Body() required CreateThemeRequest model,
  });

  // 🗑️ Delete Theme
  @DELETE('/api/{api_version}/themes/{theme_id}.json')
  Future<void> deleteTheme({
    @Path('api_version') required String apiVersion,
    @Path('theme_id') required String themeId,
  });

}
