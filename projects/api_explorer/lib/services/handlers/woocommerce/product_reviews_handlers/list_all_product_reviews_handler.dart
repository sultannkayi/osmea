import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/products/reviews/abstract/product_reviews_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:flutter/foundation.dart';

class ListAllProductReviewsHandler implements ApiRequestHandler {
  @override
  List<String> get supportedMethods => ['GET'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'GET': [
          const ApiField(
            name: 'context',
            label: 'Context',
            hint: 'Scope under which the request is made (view, edit)',
            isRequired: false,
          ),
          const ApiField(
            name: 'page',
            label: 'Page',
            hint: 'Current page of the collection (default: 1)',
            isRequired: false,
          ),
          const ApiField(
            name: 'per_page',
            label: 'Per Page',
            hint: 'Maximum number of items to be returned (default: 10)',
            isRequired: false,
          ),
          const ApiField(
            name: 'search',
            label: 'Search',
            hint: 'Limit results to those matching a string',
            isRequired: false,
          ),
          const ApiField(
            name: 'exclude',
            label: 'Exclude',
            hint: 'Ensure result set excludes specific IDs (comma-separated)',
            isRequired: false,
          ),
          const ApiField(
            name: 'include',
            label: 'Include',
            hint: 'Limit result set to specific IDs (comma-separated)',
            isRequired: false,
          ),
          const ApiField(
            name: 'order',
            label: 'Order',
            hint: 'Order sort attribute ascending or descending (asc, desc)',
            isRequired: false,
          ),
          const ApiField(
            name: 'orderby',
            label: 'Order By',
            hint:
                'Sort collection by object attribute (date, id, include, product, rating)',
            isRequired: false,
          ),
          const ApiField(
            name: 'product',
            label: 'Product IDs',
            hint:
                'Limit result set to reviews for specific products (comma-separated)',
            isRequired: false,
          ),
          const ApiField(
            name: 'status',
            label: 'Status',
            hint:
                'Limit result set to reviews with specific status (approved, hold, spam, unspam, trash, untrash)',
            isRequired: false,
          ),
          const ApiField(
            name: 'api_version',
            label: 'API Version',
            hint: 'WooCommerce API version (default: v3)',
            isRequired: false,
          ),
        ],
      };

  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, dynamic> params,
  ) async {
    try {
      // Parse API version
      final apiVersion = params['api_version']?.toString() ?? 'v3';

      // Parse optional parameters
      final context = params['context']?.toString();
      final search = params['search']?.toString();
      final order = params['order']?.toString();
      final orderby = params['orderby']?.toString();
      final status = params['status']?.toString();

      // Parse integer parameters
      int? page;
      if (params['page'] != null) {
        page = int.tryParse(params['page'].toString());
      }

      int? perPage;
      if (params['per_page'] != null) {
        perPage = int.tryParse(params['per_page'].toString());
      }

      // Parse comma-separated lists
      List<int>? exclude;
      if (params['exclude']?.toString().isNotEmpty == true) {
        exclude = params['exclude']
            .toString()
            .split(',')
            .map((e) => int.tryParse(e.trim()))
            .where((e) => e != null)
            .cast<int>()
            .toList();
      }

      List<int>? include;
      if (params['include']?.toString().isNotEmpty == true) {
        include = params['include']
            .toString()
            .split(',')
            .map((e) => int.tryParse(e.trim()))
            .where((e) => e != null)
            .cast<int>()
            .toList();
      }

      List<int>? product;
      if (params['product']?.toString().isNotEmpty == true) {
        product = params['product']
            .toString()
            .split(',')
            .map((e) => int.tryParse(e.trim()))
            .where((e) => e != null)
            .cast<int>()
            .toList();
      }

      debugPrint('📋 List All Product Reviews Parameters:');
      debugPrint('  API Version: $apiVersion');
      debugPrint('  Context: $context');
      debugPrint('  Page: $page');
      debugPrint('  Per Page: $perPage');
      debugPrint('  Search: $search');
      debugPrint('  Exclude: $exclude');
      debugPrint('  Include: $include');
      debugPrint('  Order: $order');
      debugPrint('  Order By: $orderby');
      debugPrint('  Product: $product');
      debugPrint('  Status: $status');

      // Get service and call API
      final service = WooNetwork.getIt.get<ProductReviewsService>();
      final response = await service.listAllProductReviews(
        apiVersion: apiVersion,
        context: context,
        page: page,
        perPage: perPage,
        search: search,
        exclude: exclude,
        include: include,
        order: order,
        orderby: orderby,
        product: product,
        status: status,
      );

      debugPrint(
          '✅ List All Product Reviews Success: Found ${response.length} reviews');

      return {
        'success': true,
        'data': response.map((review) => review.toJson()).toList(),
        'message': 'Product reviews retrieved successfully',
        'count': response.length,
      };
    } catch (e) {
      debugPrint('❌ Error: $e');

      return {
        'success': false,
        'message': 'Failed to retrieve product reviews: $e',
        'error_details': e.toString(),
      };
    }
  }
}
