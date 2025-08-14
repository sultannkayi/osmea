import 'package:apis/network/remote/woocommerce/products/reviews/abstract/product_reviews_service.dart';
import 'package:apis/network/remote/woocommerce/products/reviews/freezed_model/request/batch_update_product_reviews_request.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:get_it/get_it.dart';
import 'package:api_explorer/services/api_service_registry.dart';

///*******************************************************************
//************ 📦 BATCH UPDATE PRODUCT REVIEWS HANDLER *************
///*******************************************************************

class BatchUpdateProductReviewsHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'PATCH') {
      return {
        "status": "error",
        "message":
            "Method $method not supported for Batch Update Product Reviews API",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      // Parse create operations
      List<Create>? createOperations;
      if (params.containsKey('create_operations')) {
        createOperations = _parseCreateOperations(params['create_operations']!);
      }

      // Parse update operations
      List<Update>? updateOperations;
      if (params.containsKey('update_operations')) {
        updateOperations = _parseUpdateOperations(params['update_operations']!);
      }

      // Parse delete operations
      List<int>? deleteOperations;
      if (params.containsKey('delete_operations')) {
        deleteOperations = params['delete_operations']!
            .split(',')
            .map((e) => int.tryParse(e.trim()))
            .where((e) => e != null)
            .cast<int>()
            .toList();
      }

      // Create batch request
      final batchData = BatchUpdateProductReviewsRequest(
        create: createOperations,
        update: updateOperations,
        delete: deleteOperations,
      );

      final response =
          await GetIt.I<ProductReviewsService>().batchUpdateProductReviews(
        apiVersion: params['api_version'] ?? 'v3',
        batchData: batchData,
      );

      return {
        "status": "success",
        "message": "Batch update completed successfully",
        "data": response,
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      return {
        "status": "error",
        "message": "Failed to batch update product reviews: ${e.toString()}",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  List<Create> _parseCreateOperations(String createData) {
    // Expected format: "productid1:status1:reviewer1:email1:review1:rating1:verified1,productid2:status2:reviewer2:email2:review2:rating2:verified2"
    return createData
        .split(',')
        .map((operation) {
          final parts = operation.split(':');
          if (parts.length >= 4) {
            return Create(
              productId: int.tryParse(parts[0].trim()),
              status: parts.length > 1 ? parts[1].trim() : 'approved',
              reviewer: parts.length > 2 ? parts[2].trim() : null,
              reviewerEmail: parts.length > 3 ? parts[3].trim() : null,
              review: parts.length > 4 ? parts[4].trim() : null,
              rating: parts.length > 5 ? int.tryParse(parts[5].trim()) : null,
              verified: parts.length > 6 ? parts[6].trim() == 'true' : false,
            );
          }
          return null;
        })
        .where((item) => item != null)
        .cast<Create>()
        .toList();
  }

  List<Update> _parseUpdateOperations(String updateData) {
    // Expected format: "id1:productid1:status1:reviewer1:email1:review1:rating1:verified1,id2:productid2:status2:reviewer2:email2:review2:rating2:verified2"
    return updateData
        .split(',')
        .map((operation) {
          final parts = operation.split(':');
          if (parts.length >= 2) {
            return Update(
              id: int.tryParse(parts[0].trim()),
              productId:
                  parts.length > 1 ? int.tryParse(parts[1].trim()) : null,
              status: parts.length > 2 ? parts[2].trim() : null,
              reviewer: parts.length > 3 ? parts[3].trim() : null,
              reviewerEmail: parts.length > 4 ? parts[4].trim() : null,
              review: parts.length > 5 ? parts[5].trim() : null,
              rating: parts.length > 6 ? int.tryParse(parts[6].trim()) : null,
              verified: parts.length > 7 ? parts[7].trim() == 'true' : null,
            );
          }
          return null;
        })
        .where((item) => item != null)
        .cast<Update>()
        .toList();
  }

  @override
  List<String> get supportedMethods => ['PATCH'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'PATCH': [
          const ApiField(
            name: 'create_operations',
            label: 'Create Operations',
            hint:
                'Create operations in format: productid:status:reviewer:email:review:rating:verified,productid2:status2:reviewer2:email2:review2:rating2:verified2',
            isRequired: false,
          ),
          const ApiField(
            name: 'update_operations',
            label: 'Update Operations',
            hint:
                'Update operations in format: id:productid:status:reviewer:email:review:rating:verified,id2:productid2:status2:reviewer2:email2:review2:rating2:verified2',
            isRequired: false,
          ),
          const ApiField(
            name: 'delete_operations',
            label: 'Delete Operations',
            hint: 'Comma-separated list of review IDs to delete: 1,2,3',
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
}
