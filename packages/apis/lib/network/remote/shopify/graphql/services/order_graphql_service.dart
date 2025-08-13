import 'package:graphql/client.dart';
import 'package:apis/dio_config/shopify_graphql_client.dart';
import 'package:apis/network/remote/shopify/graphql/queries/orders/get_orders.graphql.dart';
import 'package:apis/network/remote/shopify/graphql/schema.graphql.dart';
import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';

/// 📦 Shopify Order GraphQL Service
///
/// Handles all GraphQL operations related to orders.
@Injectable(as: OrderGraphQLService)
class OrderGraphQLServiceImpl implements OrderGraphQLService {
  final ShopifyGraphQLClient _graphqlClient;

  OrderGraphQLServiceImpl()
      : _graphqlClient = GetIt.instance<ShopifyGraphQLClient>();

  @override
  Future<QueryResult> getOrders({
    int first = 10,
    String? after,
    String? query,
  }) async {
    try {
      final variables = Variables$Query$GetOrders(
        first: first,
        after: after,
        query: query,
      );

      final result = await _graphqlClient.query(
        QueryOptions(
          document: documentNodeQueryGetOrders,
          variables: variables.toJson(),
          fetchPolicy: FetchPolicy.networkOnly,
          errorPolicy: ErrorPolicy.all,
        ),
      );

      return result;
    } catch (e) {
      print('GraphQL Error in getOrders: $e');
      rethrow;
    }
  }

  @override
  Future<QueryResult> updateOrder(String id, Map<String, dynamic> input) async {
    // Note: Shopify Admin API has limited order update capabilities
    // This is a placeholder implementation - check Shopify documentation for actual mutation
    final String mutationString = '''
      mutation UpdateOrder(\$input: OrderInput!) {
        orderUpdate(input: \$input) {
          order {
            id
            name
            updatedAt
          }
          userErrors {
            field
            message
          }
        }
      }
    ''';

    final updateInput = {'id': id, ...input};

    return await _graphqlClient.mutate(
      MutationOptions(
        document: gql(mutationString),
        variables: {'input': updateInput},
      ),
    );
  }
}

/// Abstract interface for Order GraphQL Service
abstract class OrderGraphQLService {
  Future<QueryResult> getOrders({
    int first = 10,
    String? after,
    String? query,
  });

  Future<QueryResult> updateOrder(String id, Map<String, dynamic> input);
}
