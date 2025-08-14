import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/events/abstract/events_service.dart';
import 'package:get_it/get_it.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';

///*******************************************************************
///******************* 📆 SINGLE EVENT HANDLER 📆 *******************
///*******************************************************************

class RetrievesSingleEventHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, dynamic> params) async {
    // 🔍 Validate method
    if (method == 'GET') {
      try {
        final eventIdStr = params['event_id'] as String?;
        final eventId = eventIdStr != null ? int.tryParse(eventIdStr) : null;
        final fields = params['fields'] as String?;

        if (eventId == null) {
          return {
            "status": "error",
            "message": "Event ID is required and must be a valid integer.",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

        // 🚀 Make API call to get single event
        final response =
            await GetIt.I.get<RetrievesSingleEvent>().retrievesSingleEvent(
                  apiVersion: ApiNetwork.apiVersion,
                  eventId: eventId,
                  fields: fields,
                );

        final event = response.event;

        if (event == null) {
          return {
            "status": "error",
            "message": "Event not found",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

        // 📋 Format event details for better readability
        final Map<String, dynamic> eventDetails = {
          "id": event.id,
          "subjectId": event.subjectId,
          "subjectType": event.subjectType,
          "verb": event.verb,
          "createdAt": event.createdAt,
          "author": event.author,
          "message": event.message,
          "description": event.description,
          "path": event.path,
        };

        // 📊 Format arguments if available
        final List<String> arguments = event.arguments ?? [];
        final Map<String, dynamic> formattedArguments = {};

        for (int i = 0; i < arguments.length; i++) {
          formattedArguments["argument${i + 1}"] = arguments[i];
        }

        return {
          "status": "success",
          "eventDetails": eventDetails,
          "arguments": formattedArguments,
          "responseData": response.toJson(),
          "params": params,
          "timestamp": DateTime.now().toIso8601String(),
        };
      } catch (e) {
        String errorMessage = e.toString();
        int statusCode = 500;

        if (errorMessage.contains("status code of")) {
          final regex = RegExp(r"status code of (\d+)");
          final match = regex.firstMatch(errorMessage);
          if (match != null) {
            statusCode = int.tryParse(match.group(1) ?? "500") ?? 500;
          }
        }

        String troubleshootingTip = "";
        if (statusCode == 404) {
          troubleshootingTip = "Event not found. Verify the event ID exists.";
        } else if (statusCode == 403) {
          troubleshootingTip = "This may be due to insufficient permissions. "
              "Ensure your API credentials have proper access.";
        } else if (statusCode == 401) {
          troubleshootingTip =
              "Authentication failed. Check your API credentials and make sure they're valid.";
        } else {
          troubleshootingTip =
              "An unexpected error occurred. Check connection and retry.";
        }

        return {
          "status": "error",
          "message": "Failed to fetch event: $errorMessage",
          "statusCode": statusCode,
          "troubleshooting": troubleshootingTip,
          "requestDetails": {
            "method": "GET",
            "eventId": params['event_id'],
            "apiVersion": ApiNetwork.apiVersion,
          },
          "timestamp": DateTime.now().toIso8601String(),
        };
      }
    }

    return {
      "status": "error",
      "message":
          "Method $method not supported for Single Event API. Use GET instead.",
      "timestamp": DateTime.now().toIso8601String(),
    };
  }

  @override
  List<String> get supportedMethods => ['GET'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'GET': [
          const ApiField(
            name: 'event_id',
            label: 'Event ID',
            hint: 'ID of the event to retrieve',
            isRequired: true,
            type: ApiFieldType.number,
          ),
          const ApiField(
            name: 'fields',
            label: 'Fields',
            hint: 'Comma-separated list of fields to return (optional)',
          ),
        ],
      };
}
