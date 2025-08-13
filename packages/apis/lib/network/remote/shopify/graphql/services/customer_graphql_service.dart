import 'package:graphql/client.dart';
import 'package:apis/dio_config/shopify_graphql_client.dart';
import 'package:apis/network/remote/shopify/graphql/queries/customers/get_customers.graphql.dart';
import 'package:apis/network/remote/shopify/graphql/mutations/customers/create_customer.graphql.dart';
import 'package:apis/network/remote/shopify/graphql/schema.graphql.dart';
import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';

/// 👥 Shopify Customer GraphQL Service
///
/// Handles all GraphQL operations related to customers.
@Injectable(as: CustomerGraphQLService)
class CustomerGraphQLServiceImpl implements CustomerGraphQLService {
  final ShopifyGraphQLClient _graphqlClient;

  CustomerGraphQLServiceImpl()
      : _graphqlClient = GetIt.instance<ShopifyGraphQLClient>();

  @override
  Future<QueryResult> getCustomers({
    int first = 10,
    String? after,
    String? query,
  }) async {
    final variables = Variables$Query$GetCustomers(
      first: first,
      after: after,
      query: query,
    );

    return await _graphqlClient.query(
      QueryOptions(
        document: documentNodeQueryGetCustomers,
        variables: variables.toJson(),
      ),
    );
  }

  @override
  Future<QueryResult> createCustomer(Map<String, dynamic> inputData) async {
    final input = Input$CustomerInput.fromJson(inputData);
    final variables = Variables$Mutation$CreateCustomer(input: input);

    return await _graphqlClient.mutate(
      MutationOptions(
        document: documentNodeMutationCreateCustomer,
        variables: variables.toJson(),
      ),
    );
  }

  @override
  Future<QueryResult> updateCustomer(
      String id, Map<String, dynamic> inputData) async {
    // Add ID to input data for update
    final updateInputData = {'id': id, ...inputData};
    final input = Input$CustomerInput.fromJson(updateInputData);
    final variables = Variables$Mutation$CreateCustomer(input: input);

    return await _graphqlClient.mutate(
      MutationOptions(
        document: documentNodeMutationCreateCustomer,
        variables: variables.toJson(),
      ),
    );
  }
}

/// Abstract interface for Customer GraphQL Service
abstract class CustomerGraphQLService {
  Future<QueryResult> getCustomers({
    int first = 10,
    String? after,
    String? query,
  });

  Future<QueryResult> createCustomer(Map<String, dynamic> input);

  Future<QueryResult> updateCustomer(String id, Map<String, dynamic> input);
}
