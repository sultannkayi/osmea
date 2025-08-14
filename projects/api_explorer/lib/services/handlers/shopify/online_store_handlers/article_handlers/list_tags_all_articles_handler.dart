import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/online_store/article/abstract/article_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///*******************************************************************
///************** 🏷️ LIST TAGS ALL ARTICLES HANDLER 🏷️ *************
///*******************************************************************

class ListTagsAllArticlesHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    // 🔒 Only handle GET requests for article tags
    if (method == 'GET') {
      try {
        // Extract optional query parameters
        final limit = params['limit'];
        final popular = params['popular'];

        // 📞 Call the article service API to get tags from all articles
        final response =
            await GetIt.I.get<ArticleService>().listTagsAllArticles(
                  apiVersion: ApiNetwork.apiVersion,
                  limit: limit != null && limit.isNotEmpty
                      ? int.tryParse(limit)
                      : null,
                  popular: popular != null ? popular == 'true' : null,
                );

        // 📋 Return the article tags data
        return {
          "status": "success",
          "tags": response.tags,
          "count": response.tags?.length ?? 0,
          "message": "Article tags successfully retrieved",
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
          "message": "Failed to retrieve article tags: $errorMessage",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }
    }

    // ⛔ Unsupported method error
    return {
      "error": "Method $method not supported for List Tags All Articles API",
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
            hint: 'Maximum number of tags to retrieve (default: 50)',
            isRequired: false,
            type: ApiFieldType.number,
          ),
          const ApiField(
            name: 'popular',
            label: 'Popular',
            hint: 'Set to true to retrieve only popular tags',
            isRequired: false,
            type: ApiFieldType.boolean,
          ),
        ],
      };
}
