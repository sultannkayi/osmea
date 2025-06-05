import 'package:apis/apis.dart';
import 'package:apis/network/remote/tendertransaction/tendertransaction/abstract/tender_transaction_service.dart';
import 'package:apis/network/remote/tendertransaction/tendertransaction/freezed_model/response/get_all_tender_transactions_response.dart';
import 'package:example/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';
import '../../../api_request_handler.dart';
import 'package:flutter/material.dart';

/// ******************************************************************
/// ********** 📋 RETRIEVE LIST OF TENDER TRANSACTIONS HANDLER 📋 ****
/// ******************************************************************

class RetrieveListOfTenderTransactionsHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    try {
      if (method == 'GET') {
        // Parse parameters
        final limitParam = params['limit']?.isNotEmpty == true ? params['limit'] : null;
        final orderParam = params['order']?.isNotEmpty == true ? params['order'] : null;
        final processedAtParam = params['processed_at']?.isNotEmpty == true ? params['processed_at'] : null;
        final processedAtMaxParam = params['processed_at_max']?.isNotEmpty == true ? params['processed_at_max'] : null;
        final processedAtMinParam = params['processed_at_min']?.isNotEmpty == true ? params['processed_at_min'] : null;
        final sinceIdParam = params['since_id']?.isNotEmpty == true ? params['since_id'] : null;
        
        // Parse limit and sinceId to integer if provided
        int? limit;
        if (limitParam != null) {
          limit = int.tryParse(limitParam);
        }
        
        int? sinceId;
        if (sinceIdParam != null) {
          sinceId = int.tryParse(sinceIdParam);
        }
        
        debugPrint('🔧 Parameters: limit=$limit, order=$orderParam, processed_at=$processedAtParam, processed_at_max=$processedAtMaxParam, processed_at_min=$processedAtMinParam, since_id=$sinceId');
        
        // Standard request using the GetIt service
        return await _handleStandardRequest(limit, orderParam, processedAtParam, 
          processedAtMaxParam, processedAtMinParam, sinceId);
      }
      
      return {
        "status": "error",
        "message": "Method $method not supported. Use GET instead.",
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      debugPrint('❌ Error: ${e.toString()}');
      return {
        "status": "error",
        "message": "Failed to fetch tender transactions: ${e.toString()}",
        "apiVersion": ApiNetwork.apiVersion,
        "params": params,
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }
  
  // Standard request using the GetIt service
  Future<Map<String, dynamic>> _handleStandardRequest(
      int? limit, String? order, String? processedAt,
      String? processedAtMax, String? processedAtMin, int? sinceId) async {
    debugPrint('📌 Using standard GetIt service approach');
    
    try {
      // Ensure apiVersion is not null or empty
      final apiVersion = ApiNetwork.apiVersion.isNotEmpty ? ApiNetwork.apiVersion : '2025-04';
      debugPrint('🔧 Using API Version: $apiVersion');
      
      final service = GetIt.I.get<TenderTransactionService>();
      
      debugPrint('🌐 Making API call to getTenderTransactions...');
      GetAllTenderTransactionsResponse response;
      try {
        response = await service.getTenderTransactions(
          apiVersion: apiVersion,
          limit: limit,
          sinceId: sinceId,
          processedAt: processedAt?.trim().isNotEmpty == true ? processedAt : null,
          processedAtMin: processedAtMin?.trim().isNotEmpty == true ? processedAtMin : null,
          processedAtMax: processedAtMax?.trim().isNotEmpty == true ? processedAtMax : null,
          order: order?.trim().isNotEmpty == true ? order : null,
        );
        debugPrint('🌐 API call completed successfully');
      } catch (e, stackTrace) {
        debugPrint('❌ API response parsing failed: $e');
        debugPrint('📚 Stack trace: $stackTrace');
        
        // If the error is a TypeError related to null values, provide a more specific error message
        if (e.toString().contains('type \'Null\' is not a subtype of type \'String\'')) {
          return {
            "status": "error", 
            "message": "API response contains null values in required String fields. This indicates a mismatch between the TenderTransaction model and the actual API response format.",
            "details": e.toString(),
            "timestamp": DateTime.now().toIso8601String(),
          };
        }
        rethrow; // Re-throw other errors to be caught by outer try-catch
      }
      
      final transactions = response.tenderTransactions ?? [];
      debugPrint('📊 Received ${transactions.length} tender transactions');
      
      if (transactions.isEmpty) {
        return {
          "status": "success",
          "tender_transactions": [],
          "count": 0,
          "message": "No tender transactions found",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }
      
      debugPrint('✅ Successfully retrieved ${transactions.length} tender transactions');
      
      // Safely convert transactions to JSON, handling potential null values
      List<Map<String, dynamic>> transactionJsonList = [];
      for (var transaction in transactions) {
        try {
          // Add detailed logging to see what's in the transaction
          debugPrint('🔍 Processing transaction: ID=${transaction.id}, OrderID=${transaction.orderId}');
          debugPrint('🔍 Amount=${transaction.amount}, Currency=${transaction.currency}');
          debugPrint('🔍 ProcessedAt=${transaction.processedAt}, RemoteRef=${transaction.remoteReference ?? "null"}');
          debugPrint('🔍 PaymentMethod=${transaction.paymentMethod}, UserID=${transaction.userId ?? "null"}');
          debugPrint('🔍 PaymentDetails=${transaction.paymentDetails != null ? "present" : "null"}');
          
          final json = transaction.toJson();
          transactionJsonList.add(json);
          debugPrint('✅ Successfully converted transaction ${transaction.id} to JSON');
        } catch (e, stackTrace) {
          debugPrint('❌ Failed to convert transaction ${transaction.id} to JSON: $e');
          debugPrint('📚 Stack trace: $stackTrace');
          debugPrint('🔍 Transaction details: ${transaction.toString()}');
          // Skip transactions that have null values in required fields
          continue;
        }
      }
      
      return {
        "status": "success",
        "tender_transactions": transactionJsonList,
        "count": transactionJsonList.length,
        "appliedFilters": {
          if (limit != null) "limit": limit,
          if (order != null) "order": order,
          if (processedAt != null) "processed_at": processedAt,
          if (processedAtMax != null) "processed_at_max": processedAtMax,
          if (processedAtMin != null) "processed_at_min": processedAtMin,
          if (sinceId != null) "since_id": sinceId,
        },
        "message": "Tender transactions successfully retrieved",
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      debugPrint('❌ GetIt service error: $e');
      
      return {
        "status": "error",
        "message": "Failed to fetch tender transactions: ${e.toString()}",
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
        name: 'limit',
        label: 'Limit',
        hint: 'Maximum number of results to retrieve (max 250, default 50)',
        isRequired: false,
        type: ApiFieldType.number,
      ),
      const ApiField(
        name: 'order',
        label: 'Order',
        hint: 'Show tender transactions ordered by processed_at (asc or desc)',
        isRequired: false,
      ),
      const ApiField(
        name: 'processed_at',
        label: 'Processed At',
        hint: 'Show tender transactions processed at the specified date (ISO format)',
        isRequired: false,
      ),
      const ApiField(
        name: 'processed_at_max',
        label: 'Processed At Max',
        hint: 'Show tender transactions processed at or before the specified date',
        isRequired: false,
      ),
      const ApiField(
        name: 'processed_at_min',
        label: 'Processed At Min',
        hint: 'Show tender transactions processed at or after the specified date',
        isRequired: false,
      ),
      const ApiField(
        name: 'since_id',
        label: 'Since ID',
        hint: 'Retrieve only transactions after the specified ID',
        isRequired: false,
        type: ApiFieldType.number,
      ),
    ],
  };
}