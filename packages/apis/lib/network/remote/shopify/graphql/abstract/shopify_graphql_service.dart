import 'package:graphql/client.dart';

/// 🌐 Abstract base class for Shopify GraphQL services
///
/// Provides common GraphQL operations for all Shopify GraphQL services.
abstract class ShopifyGraphQLService {
  /// Execute a GraphQL query
  Future<QueryResult> query(QueryOptions options);

  /// Execute a GraphQL mutation
  Future<QueryResult> mutate(MutationOptions options);

  /// Subscribe to GraphQL subscription
  Stream<QueryResult> subscribe(SubscriptionOptions options);
}
