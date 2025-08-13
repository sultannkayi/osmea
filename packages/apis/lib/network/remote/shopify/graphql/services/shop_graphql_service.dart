import 'package:graphql/client.dart';
import 'package:apis/dio_config/shopify_graphql_client.dart';
import 'package:apis/network/remote/shopify/graphql/queries/shop/get_shop.graphql.dart';
import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';

/// 🏪 Shopify Shop GraphQL Service
///
/// Handles all GraphQL operations related to shop information.
@Injectable(as: ShopGraphQLService)
class ShopGraphQLServiceImpl implements ShopGraphQLService {
  final ShopifyGraphQLClient _graphqlClient;

  ShopGraphQLServiceImpl()
      : _graphqlClient = GetIt.instance<ShopifyGraphQLClient>();

  @override
  Future<QueryResult> getShop() async {
    return await _graphqlClient.query(
      QueryOptions(
        document: documentNodeQueryGetShop,
      ),
    );
  }
}

/// Abstract interface for Shop GraphQL Service
abstract class ShopGraphQLService {
  Future<QueryResult> getShop();
}
