import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/products/product/abstract/product_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///*******************************************************************
///*************** 📋 LIST ALL PRODUCTS HANDLER 📋 *****************
///*******************************************************************

class ListOfProductsHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    // Only handle GET requests for listing products
    if (method != 'GET') {
      return {
        "status": "error",
        "message": "Method $method not supported for List Products API",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      // Extract optional parameters and filter out empty values
      final limit =
          params['limit'] != null ? int.tryParse(params['limit']!) : null;
      final ids = params['ids']?.isNotEmpty == true ? params['ids'] : null;
      final sinceId =
          params['since_id']?.isNotEmpty == true ? params['since_id'] : null;
      final title =
          params['title']?.isNotEmpty == true ? params['title'] : null;
      final vendor =
          params['vendor']?.isNotEmpty == true ? params['vendor'] : null;
      final handle =
          params['handle']?.isNotEmpty == true ? params['handle'] : null;
      final productType = params['product_type']?.isNotEmpty == true
          ? params['product_type']
          : null;
      final publishedStatus = params['published_status']?.isNotEmpty == true
          ? params['published_status']
          : null;
      final publishedAtMin = params['published_at_min']?.isNotEmpty == true
          ? params['published_at_min']
          : null;
      final publishedAtMax = params['published_at_max']?.isNotEmpty == true
          ? params['published_at_max']
          : null;
      final updatedAtMin = params['updated_at_min']?.isNotEmpty == true
          ? params['updated_at_min']
          : null;
      final updatedAtMax = params['updated_at_max']?.isNotEmpty == true
          ? params['updated_at_max']
          : null;
      final createdAtMin = params['created_at_min']?.isNotEmpty == true
          ? params['created_at_min']
          : null;
      final createdAtMax = params['created_at_max']?.isNotEmpty == true
          ? params['created_at_max']
          : null;
      final fields =
          params['fields']?.isNotEmpty == true ? params['fields'] : null;
      final collectionId = params['collection_id']?.isNotEmpty == true
          ? params['collection_id']
          : null;
      final presentmentCurrencies =
          params['presentment_currencies']?.isNotEmpty == true
              ? params['presentment_currencies']
              : null;

      // Call the API method to list products
      final response = await GetIt.I<ProductService>().listProducts(
        apiVersion: ApiNetwork.apiVersion,
        limit: limit,
        ids: ids,
        sinceId: sinceId,
        title: title,
        vendor: vendor,
        handle: handle,
        productType: productType,
        publishedStatus: publishedStatus,
        publishedAtMin: publishedAtMin,
        publishedAtMax: publishedAtMax,
        updatedAtMin: updatedAtMin,
        updatedAtMax: updatedAtMax,
        createdAtMin: createdAtMin,
        createdAtMax: createdAtMax,
        fields: fields,
        collectionId: collectionId,
        presentmentCurrencies: presentmentCurrencies,
      );

      // Return success response with products data
      return {
        "status": "success",
        "message": "Products retrieved successfully",
        "data": response.toJson(),
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      // Enhanced error handling
      String errorMessage = e.toString();
      int statusCode = 500;

      if (errorMessage.contains('404') ||
          errorMessage.contains('status code of 404')) {
        statusCode = 404;
        return {
          "status": "error",
          "statusCode": 404,
          "message": "Products not found",
          "details": "The requested products could not be retrieved.",
          "timestamp": DateTime.now().toIso8601String(),
        };
      } else if (errorMessage.contains('401')) {
        statusCode = 401;
        return {
          "status": "error",
          "statusCode": 401,
          "message": "Unauthorized access",
          "details": "Authentication required to access product data.",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      return {
        "status": "error",
        "statusCode": statusCode,
        "message": "Failed to retrieve products: $errorMessage",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  @override
  List<String> get supportedMethods => ['GET'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'GET': [
          // All fields are optional for listing products
          const ApiField(
            name: 'limit',
            label: 'Limit',
            hint: 'Number of products to retrieve (max 250)',
            isRequired: false,
          ),
          const ApiField(
            name: 'ids',
            label: 'Product IDs',
            hint: 'Comma-separated list of product IDs',
            isRequired: false,
          ),
          const ApiField(
            name: 'since_id',
            label: 'Since ID',
            hint: 'Restrict results to after the specified ID',
            isRequired: false,
          ),
          const ApiField(
            name: 'title',
            label: 'Title',
            hint: 'Filter by product title',
            isRequired: false,
          ),
          const ApiField(
            name: 'vendor',
            label: 'Vendor',
            hint: 'Filter by vendor name',
            isRequired: false,
          ),
          const ApiField(
            name: 'handle',
            label: 'Handle',
            hint: 'Filter by product handle',
            isRequired: false,
          ),
          const ApiField(
            name: 'product_type',
            label: 'Product Type',
            hint: 'Filter by product type',
            isRequired: false,
          ),
          const ApiField(
            name: 'published_status',
            label: 'Published Status',
            hint: 'Filter by published status (published, unpublished, any)',
            isRequired: false,
          ),
          const ApiField(
            name: 'published_at_min',
            label: 'Published At Min',
            hint: 'Show products published after date (ISO 8601 format)',
            isRequired: false,
          ),
          const ApiField(
            name: 'published_at_max',
            label: 'Published At Max',
            hint: 'Show products published before date (ISO 8601 format)',
            isRequired: false,
          ),
          const ApiField(
            name: 'updated_at_min',
            label: 'Updated At Min',
            hint: 'Show products updated after date (ISO 8601 format)',
            isRequired: false,
          ),
          const ApiField(
            name: 'updated_at_max',
            label: 'Updated At Max',
            hint: 'Show products updated before date (ISO 8601 format)',
            isRequired: false,
          ),
          const ApiField(
            name: 'created_at_min',
            label: 'Created At Min',
            hint: 'Show products created after date (ISO 8601 format)',
            isRequired: false,
          ),
          const ApiField(
            name: 'created_at_max',
            label: 'Created At Max',
            hint: 'Show products created before date (ISO 8601 format)',
            isRequired: false,
          ),
          const ApiField(
            name: 'fields',
            label: 'Fields',
            hint: 'Comma-separated list of fields to include',
            isRequired: false,
          ),
          const ApiField(
            name: 'collection_id',
            label: 'Collection ID',
            hint: 'Filter by collection ID',
            isRequired: false,
          ),
          const ApiField(
            name: 'presentment_currencies',
            label: 'Presentment Currencies',
            hint: 'Comma-separated list of currencies',
            isRequired: false,
          ),
        ],
      };
}
