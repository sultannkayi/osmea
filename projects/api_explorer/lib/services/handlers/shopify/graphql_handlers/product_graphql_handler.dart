import 'package:apis/network/remote/shopify/graphql/services/product_graphql_service.dart';
import 'package:apis/network/remote/shopify/graphql/helpers/graphql_helper.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///*******************************************************************
///********** 🛍️ PRODUCT GRAPHQL HANDLER 🛍️ *************************
///*******************************************************************

class ProductGraphQLHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    final productService = GetIt.instance<ProductGraphQLService>();

    // GraphQL operation type belirleme - Sidebar kategorisinden gelen bilgiyi de kontrol et
    final operation = params['operation'] ?? params['op'] ?? method;
    final subcategory = params['subcategory'] ?? params['category'];

    // Subcategory'den operation tipini belirle
    String operationType = operation.toLowerCase();
    if (subcategory != null) {
      if (subcategory.toLowerCase().contains('queries') ||
          subcategory.toLowerCase().contains('query')) {
        operationType = 'query';
      } else if (subcategory.toLowerCase().contains('mutations') ||
          subcategory.toLowerCase().contains('mutation')) {
        operationType = 'mutation';
      }
    }

    switch (operationType) {
      case 'query':
      case 'get':
        return await _handleQuery(productService, params);
      case 'mutation':
      case 'post':
        return await _handleMutation(productService, params);
      default:
        return {
          "error": "GraphQL operation '$operationType' not supported",
          "supportedOperations": ["query", "mutation"],
          "hint":
              "Use 'operation=query' for queries, 'operation=mutation' for mutations",
          "info":
              "You can also select from Queries or Mutations categories in the sidebar",
        };
    }
  }

  Future<Map<String, dynamic>> _handleQuery(
      ProductGraphQLService service, Map<String, String> params) async {
    final queryType = params['queryType'] ?? params['query_type'] ?? 'products';

    switch (queryType.toLowerCase()) {
      case 'products':
        return await _handleGetProducts(service, params);
      case 'product':
        return await _handleGetProduct(service, params);
      case 'productsCount':
      case 'products_count':
        return await _handleGetProductsCount(service, params);
      default:
        return {
          "error": "Query type '$queryType' not supported",
          "supportedQueries": ["products", "product", "productsCount"],
        };
    }
  }

  Future<Map<String, dynamic>> _handleMutation(
      ProductGraphQLService service, Map<String, String> params) async {
    final mutationType =
        params['mutationType'] ?? params['mutation_type'] ?? 'createProduct';

    switch (mutationType.toLowerCase()) {
      case 'createProduct':
      case 'create_product':
        return await _handleCreateProduct(service, params);
      case 'updateProduct':
      case 'update_product':
        return await _handleUpdateProduct(service, params);
      default:
        return {
          "error": "Mutation type '$mutationType' not supported",
          "supportedMutations": ["createProduct", "updateProduct"],
        };
    }
  }

  Future<Map<String, dynamic>> _handleGetProducts(
      ProductGraphQLService service, Map<String, String> params) async {
    try {
      // Check if this is a count request
      final countRequest = params['count'] == 'true';
      if (countRequest) {
        final query = params['query'];
        final count = await service.getProductsCount(query: query);

        return {
          "status": "success",
          "data": {
            "count": count,
          },
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      final id = params['id'] ?? params['product_id'];

      if (id != null && id.isNotEmpty) {
        // Get single product
        final result =
            await service.getProduct(GraphQLHelper.formatId(id, 'Product'));

        if (GraphQLHelper.isSuccess(result)) {
          final data = GraphQLHelper.extractData(result);
          return {
            "status": "success",
            "data": data?['product'],
            "timestamp": DateTime.now().toIso8601String(),
          };
        } else {
          final errors = GraphQLHelper.extractErrors(result);
          return {
            "status": "error",
            "message": "Failed to fetch product",
            "errors": errors,
            "timestamp": DateTime.now().toIso8601String(),
          };
        }
      } else {
        // Get products list
        final first = int.tryParse(params['first'] ?? '10') ?? 10;
        final after = params['after'];
        final query = params['query'];

        final result = await service.getProducts(
          first: first,
          after: after,
          query: query,
        );

        if (GraphQLHelper.isSuccess(result)) {
          final data = GraphQLHelper.extractData(result);
          final products = data?['products'];
          final nodes = GraphQLHelper.extractNodes(products ?? {});
          final pageInfo = GraphQLHelper.extractPageInfo(products ?? {});

          return {
            "status": "success",
            "data": {
              "products": nodes,
              "pageInfo": pageInfo,
            },
            "timestamp": DateTime.now().toIso8601String(),
          };
        } else {
          final errors = GraphQLHelper.extractErrors(result);
          return {
            "status": "error",
            "message": "Failed to fetch products",
            "errors": errors,
            "timestamp": DateTime.now().toIso8601String(),
          };
        }
      }
    } catch (e) {
      return {
        "status": "error",
        "message": "Exception occurred while fetching products: $e",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  Future<Map<String, dynamic>> _handleGetProduct(
      ProductGraphQLService service, Map<String, String> params) async {
    try {
      final id = params['id'] ?? params['product_id'];

      if (id == null || id.isEmpty) {
        return {
          "status": "error",
          "message": "Product ID is required",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      final result =
          await service.getProduct(GraphQLHelper.formatId(id, 'Product'));

      if (GraphQLHelper.isSuccess(result)) {
        final data = GraphQLHelper.extractData(result);
        return {
          "status": "success",
          "data": data?['product'],
          "timestamp": DateTime.now().toIso8601String(),
        };
      } else {
        final errors = GraphQLHelper.extractErrors(result);
        return {
          "status": "error",
          "message": "Failed to fetch product",
          "errors": errors,
          "timestamp": DateTime.now().toIso8601String(),
        };
      }
    } catch (e) {
      return {
        "status": "error",
        "message": "Exception occurred while fetching product: $e",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  Future<Map<String, dynamic>> _handleGetProductsCount(
      ProductGraphQLService service, Map<String, String> params) async {
    try {
      final query = params['query'];
      final count = await service.getProductsCount(query: query);

      return {
        "status": "success",
        "data": {
          "count": count,
        },
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      return {
        "status": "error",
        "message": "Exception occurred while counting products: $e",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  Future<Map<String, dynamic>> _handleCreateProduct(
      ProductGraphQLService service, Map<String, String> params) async {
    try {
      final title = params['title'];
      final description = params['description'];
      final handle = params['handle'];
      final vendor = params['vendor'];
      final productType = params['productType'] ?? params['product_type'];
      final tags = params['tags']?.split(',').map((tag) => tag.trim()).toList();

      if (title == null || title.isEmpty) {
        return {
          "status": "error",
          "message": "Product title is required",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      final input = <String, dynamic>{
        'title': title,
        if (description != null && description.isNotEmpty)
          'description': description,
        if (handle != null && handle.isNotEmpty) 'handle': handle,
        if (vendor != null && vendor.isNotEmpty) 'vendor': vendor,
        if (productType != null && productType.isNotEmpty)
          'productType': productType,
        if (tags != null && tags.isNotEmpty) 'tags': tags,
      };

      final result = await service.createProduct(input);

      if (GraphQLHelper.isSuccess(result)) {
        final data = GraphQLHelper.extractData(result);
        final userErrors =
            GraphQLHelper.extractUserErrors(data, 'productCreate');

        if (userErrors.isNotEmpty) {
          return {
            "status": "error",
            "message": "Product creation failed with user errors",
            "userErrors": userErrors,
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

        return {
          "status": "success",
          "data": data?['productCreate']?['product'],
          "message": "Product created successfully",
          "timestamp": DateTime.now().toIso8601String(),
        };
      } else {
        final errors = GraphQLHelper.extractErrors(result);
        return {
          "status": "error",
          "message": "Failed to create product",
          "errors": errors,
          "timestamp": DateTime.now().toIso8601String(),
        };
      }
    } catch (e) {
      return {
        "status": "error",
        "message": "Exception occurred while creating product: $e",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  Future<Map<String, dynamic>> _handleUpdateProduct(
      ProductGraphQLService service, Map<String, String> params) async {
    try {
      final id = params['id'] ?? params['product_id'];

      if (id == null || id.isEmpty) {
        return {
          "status": "error",
          "message": "Product ID is required for update",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      final input = <String, dynamic>{};

      if (params['title'] != null) input['title'] = params['title'];
      if (params['description'] != null)
        input['description'] = params['description'];
      if (params['handle'] != null) input['handle'] = params['handle'];
      if (params['vendor'] != null) input['vendor'] = params['vendor'];
      if (params['productType'] != null || params['product_type'] != null) {
        input['productType'] = params['productType'] ?? params['product_type'];
      }
      if (params['tags'] != null) {
        input['tags'] =
            params['tags']!.split(',').map((tag) => tag.trim()).toList();
      }

      if (input.isEmpty) {
        return {
          "status": "error",
          "message": "No update fields provided",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      final result = await service.updateProduct(
        GraphQLHelper.formatId(id, 'Product'),
        input,
      );

      if (GraphQLHelper.isSuccess(result)) {
        final data = GraphQLHelper.extractData(result);
        final userErrors =
            GraphQLHelper.extractUserErrors(data, 'productUpdate');

        if (userErrors.isNotEmpty) {
          return {
            "status": "error",
            "message": "Product update failed with user errors",
            "userErrors": userErrors,
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

        return {
          "status": "success",
          "data": data?['productUpdate']?['product'],
          "message": "Product updated successfully",
          "timestamp": DateTime.now().toIso8601String(),
        };
      } else {
        final errors = GraphQLHelper.extractErrors(result);
        return {
          "status": "error",
          "message": "Failed to update product",
          "errors": errors,
          "timestamp": DateTime.now().toIso8601String(),
        };
      }
    } catch (e) {
      return {
        "status": "error",
        "message": "Exception occurred while updating product: $e",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  @override
  List<String> get supportedMethods => ['QUERY', 'MUTATION'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'QUERY': [
          const ApiField(
            name: 'operation',
            label: 'GraphQL Operation',
            hint: 'Set to "query" for GraphQL queries',
            isRequired: true,
          ),
        ],
        'MUTATION': [
          const ApiField(
            name: 'operation',
            label: 'GraphQL Operation',
            hint: 'Set to "mutation" for GraphQL mutations',
            isRequired: true,
          ),
        ],
      };

  Map<String, List<ApiField>> get apiFields => {
        'QUERY': [
          const ApiField(
            name: 'operation',
            label: '🔍 GraphQL Operation Type',
            hint: 'Automatically set to "query" for data fetching operations',
            isRequired: false,
          ),
          const ApiField(
            name: 'queryType',
            label: '📋 Query Operation',
            hint:
                'Choose: "products" (list all), "product" (get single), "productsCount" (count)',
            isRequired: false,
          ),
          const ApiField(
            name: 'first',
            label: '🔢 Items Per Page',
            hint: 'How many products to fetch (1-250, default: 10)',
            isRequired: false,
          ),
          const ApiField(
            name: 'after',
            label: '➡️ Pagination Cursor',
            hint: 'Base64 cursor for next page (from previous response)',
            isRequired: false,
          ),
          const ApiField(
            name: 'query',
            label: '🔍 Search Filter',
            hint: 'Search by title, vendor, type, etc. (e.g. "title:*shirt*")',
            isRequired: false,
          ),
          const ApiField(
            name: 'id',
            label: '🆔 Product ID',
            hint:
                'Shopify Product ID (gid://shopify/Product/12345 or just 12345)',
            isRequired: false,
          ),
        ],
        'MUTATION': [
          const ApiField(
            name: 'operation',
            label: '⚡ GraphQL Operation Type',
            hint:
                'Automatically set to "mutation" for data modification operations',
            isRequired: false,
          ),
          const ApiField(
            name: 'mutationType',
            label: '🔄 Mutation Operation',
            hint:
                'Choose: "createProduct" (new product) or "updateProduct" (modify existing)',
            isRequired: false,
          ),
          const ApiField(
            name: 'title',
            label: '📝 Product Title *',
            hint:
                'Product name (required for creation, e.g. "Awesome T-Shirt")',
            isRequired: true,
          ),
          const ApiField(
            name: 'description',
            label: '📄 Product Description',
            hint: 'Detailed product description (HTML supported)',
            isRequired: false,
          ),
          const ApiField(
            name: 'vendor',
            label: '🏢 Vendor/Brand',
            hint: 'Product manufacturer or brand name (e.g. "Nike", "Apple")',
            isRequired: false,
          ),
          const ApiField(
            name: 'product_type',
            label: '🏷️ Product Category',
            hint: 'Product type/category (e.g. "Clothing", "Electronics")',
            isRequired: false,
          ),
          const ApiField(
            name: 'tags',
            label: '🏷️ Product Tags',
            hint: 'Comma-separated tags (e.g. "summer, sale, popular")',
            isRequired: false,
          ),
          const ApiField(
            name: 'id',
            label: '🆔 Product ID (for updates)',
            hint:
                'Required for updates: Shopify Product ID (gid://shopify/Product/12345 or 12345)',
            isRequired: false,
          ),
        ],
      };
}
