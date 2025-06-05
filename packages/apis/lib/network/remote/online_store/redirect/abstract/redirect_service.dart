import 'package:apis/network/remote/online_store/redirect/freezed_model/request/create_redirect_full_url_request.dart';
import 'package:apis/network/remote/online_store/redirect/freezed_model/request/create_redirect_request.dart';
import 'package:apis/network/remote/online_store/redirect/freezed_model/request/update_redirect_path_and_target_request.dart';
import 'package:apis/network/remote/online_store/redirect/freezed_model/request/update_redirect_path_uri_request.dart';
import 'package:apis/network/remote/online_store/redirect/freezed_model/response/count_all_redirects_response.dart';
import 'package:apis/network/remote/online_store/redirect/freezed_model/response/create_redirect_full_url_response.dart';
import 'package:apis/network/remote/online_store/redirect/freezed_model/response/create_redirect_response.dart';
import 'package:apis/network/remote/online_store/redirect/freezed_model/response/get_single_redirect_response.dart';
import 'package:apis/network/remote/online_store/redirect/freezed_model/response/list_all_redirects_response.dart';
import 'package:apis/network/remote/online_store/redirect/freezed_model/response/update_redirect_path_and_target_response.dart';
import 'package:apis/network/remote/online_store/redirect/freezed_model/response/update_redirect_path_uri_response.dart';

abstract class RedirectService {
  
  /// 🔄 List all redirects
  Future<ListAllRedirectsResponse> listAllRedirects({
    required String apiVersion,
    int? limit,
    String? sinceId,
    String? path,
    String? target,
    String? fields,
  });

  /// 🔄 Get Single Redirect
  Future<GetSingleRedirectResponse> getSingleRedirect({
    required String apiVersion,
    required String redirectId,
    String? fields,
  });

  /// 🔄 Count All Redirects
  Future<CountAllRedirectsResponse> countAllRedirects({
    required String apiVersion,
    String? path,
    String? target,
  });

  /// 🆕 Create Redirect Full Url
  Future<CreateRedirectFullUrlResponse> createRedirectFullUrl({
    required String apiVersion,
    required CreateRedirectFullUrlRequest model,
  });

  /// 🆕 Create Redirect
  Future<CreateRedirectResponse> createRedirect({
    required String apiVersion,
    required CreateRedirectRequest model,
  });

  /// 🔄 Update Redirect Path URI
  Future<UpdateRedirectPathUriResponse> updateRedirectPathUri({
    required String apiVersion,
    required String redirectId,
    required UpdateRedirectPathUriRequest model,
  });

  /// 🔄 Update Redirect Path and Target
  Future<UpdateRedirectPathAndTargetResponse> updateRedirectPathAndTarget({
    required String apiVersion,
    required String redirectId,
    required UpdateRedirectPathAndTargetRequest model,
  });

  /// 🗑️ Delete Redirect
  Future<void> deleteRedirect({
    required String apiVersion,
    required String redirectId,
  });
}