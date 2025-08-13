import 'package:graphql/client.dart';
import 'package:apis/dio_config/shopify_graphql_client.dart';
import 'package:apis/network/remote/shopify/graphql/queries/products/get_products.graphql.dart';
import 'package:apis/network/remote/shopify/graphql/queries/products/get_product.graphql.dart';
import 'package:apis/network/remote/shopify/graphql/mutations/products/create_product.graphql.dart';
import 'package:apis/network/remote/shopify/graphql/mutations/products/update_product.graphql.dart';
import 'package:apis/network/remote/shopify/graphql/schema.graphql.dart';
import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';

/// 🛍️ Shopify Product GraphQL Service
///
/// Handles all GraphQL operations related to products.
@Injectable(as: ProductGraphQLService)
class ProductGraphQLServiceImpl implements ProductGraphQLService {
  final ShopifyGraphQLClient _graphqlClient;

  ProductGraphQLServiceImpl()
      : _graphqlClient = GetIt.instance<ShopifyGraphQLClient>();

  @override
  Future<QueryResult> getProducts({
    int first = 10,
    String? after,
    String? query,
  }) async {
    final variables = Variables$Query$GetProducts(
      first: first,
      after: after,
      query: query,
    );

    return await _graphqlClient.query(
      QueryOptions(
        document: documentNodeQueryGetProducts,
        variables: variables.toJson(),
      ),
    );
  }

  @override
  Future<QueryResult> getProduct(String id) async {
    final variables = Variables$Query$GetProduct(id: id);

    return await _graphqlClient.query(
      QueryOptions(
        document: documentNodeQueryGetProduct,
        variables: variables.toJson(),
      ),
    );
  }

  @override
  Future<QueryResult> createProduct(Map<String, dynamic> inputData) async {
    // Convert Map to Input$ProductInput
    final input = Input$ProductInput.fromJson(inputData);
    final variables = Variables$Mutation$CreateProduct(input: input);

    return await _graphqlClient.mutate(
      MutationOptions(
        document: documentNodeMutationCreateProduct,
        variables: variables.toJson(),
      ),
    );
  }

  @override
  Future<QueryResult> updateProduct(
      String id, Map<String, dynamic> inputData) async {
    // Add ID to input data and convert to Input$ProductUpdateInput
    final updateInputData = {'id': id, ...inputData};
    final input = Input$ProductUpdateInput.fromJson(updateInputData);
    final variables = Variables$Mutation$UpdateProduct(input: input);

    return await _graphqlClient.mutate(
      MutationOptions(
        document: documentNodeMutationUpdateProduct,
        variables: variables.toJson(),
      ),
    );
  }

  @override
  Future<int> getProductsCount({String? query}) async {
    int count = 0;
    String? cursor;
    bool hasNextPage = true;

    while (hasNextPage) {
      final variables = Variables$Query$GetProducts(
        first: 250, // Maximum allowed per request
        after: cursor,
        query: query,
      );

      final result = await _graphqlClient.query(
        QueryOptions(
          document: documentNodeQueryGetProducts,
          variables: variables.toJson(),
        ),
      );

      if (result.hasException || result.data == null) {
        throw Exception('Failed to fetch products count: ${result.exception}');
      }

      final productsQuery = Query$GetProducts.fromJson(result.data!);
      final products = productsQuery.products;

      if (products != null) {
        count += products.edges.length;
        hasNextPage = products.pageInfo.hasNextPage;
        cursor = products.edges.isNotEmpty ? products.edges.last.cursor : null;
      } else {
        hasNextPage = false;
      }
    }

    return count;
  }
}

/// Abstract interface for Product GraphQL Service
abstract class ProductGraphQLService {
  Future<QueryResult> getProducts({
    int first = 10,
    String? after,
    String? query,
  });

  Future<QueryResult> getProduct(String id);

  Future<QueryResult> createProduct(Map<String, dynamic> input);

  Future<QueryResult> updateProduct(String id, Map<String, dynamic> input);

  Future<int> getProductsCount({String? query});
}
