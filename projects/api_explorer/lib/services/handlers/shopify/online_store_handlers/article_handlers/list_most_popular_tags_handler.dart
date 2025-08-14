import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/online_store/article/abstract/article_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///*******************************************************************
///************** 🔝 LIST MOST POPULAR TAGS HANDLER 🔝 **************
///*******************************************************************

class ListMostPopularTagsHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    // 🔒 Only handle GET requests for popular tags
    if (method == 'GET') {
      try {
        // Extract optional query parameters
        final limit = params['limit'];
        final popular = params['popular'];

        // 📞 Call the article service API to get most popular tags
        final response =
            await GetIt.I.get<ArticleService>().listMostPopularTags(
                  apiVersion: ApiNetwork.apiVersion,
                  limit: limit != null && limit.isNotEmpty
                      ? int.tryParse(limit)
                      : null,
                  popular: popular == 'true',
                );

        // 📋 Return the popular tags data
        return {
          "status": "success",
          "tags": response.tags,
          "count": response.tags?.length ?? 0,
          "message": "Popular tags successfully retrieved",
          "timestamp": DateTime.now().toIso8601String(),
        };
      } catch (e) {
        // ❌ Error handling with status code detection
        String errorMessage = e.toString();
        int statusCode = 500;

        if (errorMessage.contains('404')) {
          statusCode = 404;
          return {
            "status": "error",
            "statusCode": statusCode,
            "message": "Resource not found",
            "timestamp": DateTime.now().toIso8601String(),
          };
        } else if (errorMessage.contains('429')) {
          statusCode = 429;
          return {
            "status": "error",
            "statusCode": statusCode,
            "message": "Rate limit exceeded. Please try again later.",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

        // Default error response
        return {
          "status": "error",
          "statusCode": statusCode,
          "message": "Failed to retrieve popular tags: $errorMessage",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }
    }

    // ⛔ Unsupported method error
    return {
      "error": "Method $method not supported for List Most Popular Tags API",
      "supportedMethods": supportedMethods,
    };
  }

  @override
  List<String> get supportedMethods => ['GET'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'GET': [
          // Optional query parameters
          const ApiField(
            name: 'limit',
            label: 'Limit',
            hint: 'Maximum number of popular tags to retrieve (default: 50)',
            isRequired: false,
          ),
          const ApiField(
            name: 'popular',
            label: 'Popular Only',
            hint: 'Set to true to retrieve only popular tags',
            isRequired: false,
          ),
        ],
      };
}
