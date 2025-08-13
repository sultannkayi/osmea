import 'package:apis/network/remote/shopify/graphql/services/shop_graphql_service.dart';
import 'package:apis/network/remote/shopify/graphql/helpers/graphql_helper.dart';
import 'package:example/services/api_request_handler.dart';
import 'package:example/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///*******************************************************************
///********** 🏪 SHOP GRAPHQL HANDLER 🏪 ******************************
///*******************************************************************

class ShopGraphQLHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    final shopService = GetIt.instance<ShopGraphQLService>();

    switch (method) {
      case 'QUERY':
        return await _handleQueryShop(shopService, params);
      default:
        return {
          "error": "Operation $method not supported for Shop GraphQL API",
          "supportedMethods": supportedMethods,
        };
    }
  }

  Future<Map<String, dynamic>> _handleQueryShop(
      ShopGraphQLService service, Map<String, String> params) async {
    try {
      final result = await service.getShop();

      if (GraphQLHelper.isSuccess(result)) {
        final data = GraphQLHelper.extractData(result);
        return {
          "status": "success",
          "data": data?['shop'],
          "timestamp": DateTime.now().toIso8601String(),
        };
      } else {
        final errors = GraphQLHelper.extractErrors(result);
        return {
          "status": "error",
          "message": "Failed to fetch shop information",
          "errors": errors,
          "timestamp": DateTime.now().toIso8601String(),
        };
      }
    } catch (e) {
      return {
        "status": "error",
        "message": "Exception occurred while fetching shop information: $e",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  @override
  List<String> get supportedMethods => ['QUERY'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'GET': [
          // No parameters required for shop info
        ],
      };
}
