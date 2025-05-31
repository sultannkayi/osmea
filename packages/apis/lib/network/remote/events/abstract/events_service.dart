import 'package:apis/network/remote/events/freezed_model/retrieves_list_of_events_response.dart';
import 'package:apis/network/remote/events/freezed_model/retrieves_single_events_response.dart';
import 'package:apis/network/remote/events/freezed_model/retrieves_count_events_response.dart';

/// 🔑 Abstract contract for Retrieves List Of Events
/// Implement this to fetch access scopes from Shopify API! 🌐
abstract class RetrievesListOfEvents {
  /// 🚀 Fetches the Retrieves List Of Events from the API.
  Future<RetrievesListOfEventsResponse> retrievesListOfEvents({
    required String apiVersion,
    String? createdAtMin,
    String? createdAtMax,
    int? limit,
    String? sinceId,
    String? filter,
    String? fields,
    String? verb,
  });
}

abstract class RetrievesSingleEvent {
  /// Retrieves a single event from the API
  Future<RetrievesSingleEventsResponse> retrievesSingleEvent({
    required String apiVersion,
    required int eventId,
    String? fields,
  });
}

abstract class RetrievesCountEvents {
  /// Retrieves the count of events from the API
  Future<RetrievesCountEventsResponse> retrievesCountEvents({
    required String apiVersion,
    String? createdAtMin,
    String? createdAtMax,
  });
}
