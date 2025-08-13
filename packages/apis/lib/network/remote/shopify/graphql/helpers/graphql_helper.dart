import 'package:graphql/client.dart';

/// 🛠️ GraphQL Helper Utilities
///
/// Provides utility functions for handling GraphQL responses and errors.
class GraphQLHelper {
  /// Extract data from QueryResult
  static Map<String, dynamic>? extractData(QueryResult result) {
    if (result.hasException) {
      return null;
    }
    return result.data;
  }

  /// Extract errors from QueryResult
  static List<String> extractErrors(QueryResult result) {
    final errors = <String>[];

    if (result.exception != null) {
      if (result.exception!.graphqlErrors.isNotEmpty) {
        for (final error in result.exception!.graphqlErrors) {
          errors.add(error.message);
        }
      }

      if (result.exception!.linkException != null) {
        errors.add(result.exception!.linkException.toString());
      }
    }

    return errors;
  }

  /// Extract user errors from mutation response
  static List<Map<String, dynamic>> extractUserErrors(
      Map<String, dynamic>? data, String mutationName) {
    if (data == null) return [];

    final mutation = data[mutationName] as Map<String, dynamic>?;
    if (mutation == null) return [];

    final userErrors = mutation['userErrors'] as List?;
    if (userErrors == null) return [];

    return userErrors.cast<Map<String, dynamic>>();
  }

  /// Check if QueryResult is successful
  static bool isSuccess(QueryResult result) {
    return !result.hasException && result.data != null;
  }

  /// Get error message from QueryResult
  static String getErrorMessage(QueryResult result) {
    final errors = extractErrors(result);
    return errors.isNotEmpty ? errors.first : 'Unknown error occurred';
  }

  /// Format query result for display
  static Map<String, dynamic> formatResult(QueryResult result) {
    return {
      'success': isSuccess(result),
      'data': extractData(result),
      'errors': extractErrors(result),
    };
  }

  /// Extract cursor from connection edge
  static String? extractCursor(Map<String, dynamic> edge) {
    return edge['cursor'] as String?;
  }

  /// Extract page info from connection
  static Map<String, dynamic>? extractPageInfo(
      Map<String, dynamic> connection) {
    return connection['pageInfo'] as Map<String, dynamic>?;
  }

  /// Extract nodes from connection
  static List<Map<String, dynamic>> extractNodes(
      Map<String, dynamic> connection) {
    final edges = connection['edges'] as List?;
    if (edges == null) return [];

    return edges
        .cast<Map<String, dynamic>>()
        .map((edge) => edge['node'] as Map<String, dynamic>)
        .toList();
  }

  /// Format GraphQL ID
  static String formatId(String id, String type) {
    if (id.startsWith('gid://shopify/')) {
      return id;
    }
    return 'gid://shopify/$type/$id';
  }

  /// Extract numeric ID from GraphQL ID
  static String? extractNumericId(String? graphqlId) {
    if (graphqlId == null || !graphqlId.startsWith('gid://shopify/')) {
      return graphqlId;
    }

    final parts = graphqlId.split('/');
    return parts.isNotEmpty ? parts.last : null;
  }
}
