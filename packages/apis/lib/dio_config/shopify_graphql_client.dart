import 'package:graphql/client.dart';
import 'package:apis/apis.dart';
import 'package:injectable/injectable.dart';

/// 🌐 GraphQL Client for Shopify Admin API
///
/// Provides GraphQL client instance configured for Shopify Admin API GraphQL endpoint.
/// Uses the same authentication and configuration as REST API.
@singleton
class ShopifyGraphQLClient {
  late GraphQLClient _client;

  ShopifyGraphQLClient() {
    _initializeClient();
  }

  /// Initialize GraphQL client with Shopify configuration
  void _initializeClient() {
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'X-Shopify-Access-Token': ApiNetwork.shopifyAccessToken,
      'User-Agent': 'OSMEA-API-Explorer/1.0 (Flutter Web)',
    };

    final HttpLink httpLink = HttpLink(
      _buildGraphQLUrl(),
      defaultHeaders: headers,
    );

    _client = GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: InMemoryStore()),
    );
  }

  /// Build GraphQL endpoint URL
  String _buildGraphQLUrl() {
    if (ApiNetwork.storeName.isEmpty) {
      throw Exception(
          "Store name is not set! Please initialize ApiNetwork with a valid store name. 🏬");
    }

    final apiVersion =
        ApiNetwork.apiVersion.isNotEmpty ? ApiNetwork.apiVersion : '2024-07';

    return 'https://${ApiNetwork.storeName}.myshopify.com/admin/api/$apiVersion/graphql';
  }

  /// Get the GraphQL client instance
  GraphQLClient get client => _client;

  /// Reinitialize client when configuration changes
  void reinitialize() {
    _initializeClient();
  }

  /// Execute a GraphQL query
  Future<QueryResult> query(QueryOptions options) async {
    try {
      print('DEBUG - GraphQL Query URL: ${_buildGraphQLUrl()}');
      print('DEBUG - GraphQL Query Variables: ${options.variables}');
      print('DEBUG - GraphQL Query Document: ${options.document}');

      final result = await _client.query(options);

      print('DEBUG - GraphQL Response hasException: ${result.hasException}');
      print('DEBUG - GraphQL Response data: ${result.data}');
      print('DEBUG - GraphQL Response errors: ${result.exception}');

      return result;
    } catch (e) {
      print('ERROR - GraphQL Query Exception: $e');
      rethrow;
    }
  }

  /// Execute a GraphQL mutation
  Future<QueryResult> mutate(MutationOptions options) async {
    try {
      print('DEBUG - GraphQL Mutation URL: ${_buildGraphQLUrl()}');
      print('DEBUG - GraphQL Mutation Variables: ${options.variables}');

      final result = await _client.mutate(options);

      print(
          'DEBUG - GraphQL Mutation Response hasException: ${result.hasException}');
      print('DEBUG - GraphQL Mutation Response data: ${result.data}');
      print('DEBUG - GraphQL Mutation Response errors: ${result.exception}');

      return result;
    } catch (e) {
      print('ERROR - GraphQL Mutation Exception: $e');
      rethrow;
    }
  }

  /// Subscribe to GraphQL subscription
  Stream<QueryResult> subscribe(SubscriptionOptions options) {
    return _client.subscribe(options);
  }
}
