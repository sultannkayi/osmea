import 'dart:io';

import 'package:apis/apis.dart';
import 'package:apis/dio_config/interceptors/api_interceptor_default.dart';
// ignore: depend_on_referenced_packages
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

/// 🌐 Provides Dio instance for dependency injection
@module
abstract class DioModule {
  @singleton
  Dio dio() => Dio();
}

/// 🚀 Main API Dio Client for handling network requests, cookies, and proxy settings
@singleton
class ApiDioClient {
  // 🍪 Cookie managers for different use-cases
  static CookieManager cookieJar = CookieManager(PersistCookieJar());
  static CookieManager cookieJarPersonaClick =
      CookieManager(PersistCookieJar());

  /// 🏁 Creates and configures a Dio instance with default options and interceptors
  static Dio starter() {
    final dio = Dio()
      ..options = BaseOptions()
      ..options.responseType = ResponseType.json
      ..interceptors.add(ApiInterceptorDefault(
        shopifyAccessToken: ApiNetwork.shopifyAccessToken,
      ));
    // ..interceptors.add(cookieJar); // Uncomment to enable cookie management
    _proxySettingsForQA(dio);
    return dio;
  }

  /// Creates a specialized Dio instance for WooCommerce API communication
  static Dio wooDio() {
    final dio = Dio()
      ..options = BaseOptions()
      ..options.responseType = ResponseType.json
      ..interceptors.add(WooInterceptor());
    _proxySettingsForQA(dio);
    return dio;
  }

  /// 🛡️ Sets up proxy settings for QA environments (if proxy IP is provided)
  static void _proxySettingsForQA(Dio dio) {
    final String proxyIp = ApiNetwork.proxyIp;

    if (proxyIp.isNotEmpty) {
      dio.httpClientAdapter = IOHttpClientAdapter(
        createHttpClient: () {
          final client = HttpClient();

          client.findProxy = (uri) {
            // 🖧 Route all requests through the specified proxy
            return 'PROXY $proxyIp';
          };

          // ⚠️ Disable certificate validation for QA/testing only!
          client.badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;

          return client;
        },
      );
    }
  }

  /// 📂 Prepares persistent cookie storage in the app's document directory
  static Future<void> prepareCookiesJar() async {
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    final String appDocPath = appDocDir.path;

    cookieJar = CookieManager(PersistCookieJar(
      ignoreExpires: true,
      storage: FileStorage("$appDocPath/.cookies/"),
    ));
    // 🍪 Now cookies will persist between app launches!
  }
}
