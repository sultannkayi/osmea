import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/products/product/abstract/product_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

///*******************************************************************
//************* 🔢 COUNT PRODUCTS COLLECTION HANDLER 🔢 ************
///*******************************************************************

class CountProductsCollectionHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    // Only handle GET requests for counting products
    if (method != 'GET') {
      return {
        "status": "error",
        "message": "Method $method not supported for Count Products API",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      // Extract optional parameters and filter out empty values
      final vendor =
          params['vendor']?.isNotEmpty == true ? params['vendor'] : null;
      final productType = params['product_type']?.isNotEmpty == true
          ? params['product_type']
          : null;
      final collectionId = params['collection_id']?.isNotEmpty == true
          ? params['collection_id']
          : null;
      final createdAtMin = params['created_at_min']?.isNotEmpty == true
          ? params['created_at_min']
          : null;
      final createdAtMax = params['created_at_max']?.isNotEmpty == true
          ? params['created_at_max']
          : null;
      final updatedAtMin = params['updated_at_min']?.isNotEmpty == true
          ? params['updated_at_min']
          : null;
      final updatedAtMax = params['updated_at_max']?.isNotEmpty == true
          ? params['updated_at_max']
          : null;
      final publishedAtMin = params['published_at_min']?.isNotEmpty == true
          ? params['published_at_min']
          : null;
      final publishedAtMax = params['published_at_max']?.isNotEmpty == true
          ? params['published_at_max']
          : null;
      final publishedStatus = params['published_status']?.isNotEmpty == true
          ? params['published_status']
          : null;

      // Call the API method to count products
      final response = await GetIt.I<ProductService>().countProducts(
        apiVersion: ApiNetwork.apiVersion,
        vendor: vendor,
        productType: productType,
        collectionId: collectionId,
        createdAtMin: createdAtMin,
        createdAtMax: createdAtMax,
        updatedAtMin: updatedAtMin,
        updatedAtMax: updatedAtMax,
        publishedAtMin: publishedAtMin,
        publishedAtMax: publishedAtMax,
        publishedStatus: publishedStatus,
      );

      // Return success response with count
      return {
        "status": "success",
        "message": "Product count retrieved successfully",
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
          "details": "No products found matching the specified criteria.",
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
        "message": "Failed to count products: $errorMessage",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  @override
  List<String> get supportedMethods => ['GET'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'GET': [
          const ApiField(
            name: 'vendor',
            label: 'Vendor',
            hint: 'Filter by vendor name',
            isRequired: false,
          ),
          const ApiField(
            name: 'product_type',
            label: 'Product Type',
            hint: 'Filter by product type',
            isRequired: false,
          ),
          const ApiField(
            name: 'collection_id',
            label: 'Collection ID',
            hint: 'Filter by collection ID',
            isRequired: false,
          ),
          const ApiField(
            name: 'created_at_min',
            label: 'Created At Min',
            hint: 'Count products created after date (ISO 8601 format)',
            isRequired: false,
          ),
          const ApiField(
            name: 'created_at_max',
            label: 'Created At Max',
            hint: 'Count products created before date (ISO 8601 format)',
            isRequired: false,
          ),
          const ApiField(
            name: 'updated_at_min',
            label: 'Updated At Min',
            hint: 'Count products updated after date (ISO 8601 format)',
            isRequired: false,
          ),
          const ApiField(
            name: 'updated_at_max',
            label: 'Updated At Max',
            hint: 'Count products updated before date (ISO 8601 format)',
            isRequired: false,
          ),
          const ApiField(
            name: 'published_at_min',
            label: 'Published At Min',
            hint: 'Count products published after date (ISO 8601 format)',
            isRequired: false,
          ),
          const ApiField(
            name: 'published_at_max',
            label: 'Published At Max',
            hint: 'Count products published before date (ISO 8601 format)',
            isRequired: false,
          ),
          const ApiField(
            name: 'published_status',
            label: 'Published Status',
            hint: 'Filter by published status (published, unpublished, any)',
            isRequired: false,
          ),
        ],
      };
}
