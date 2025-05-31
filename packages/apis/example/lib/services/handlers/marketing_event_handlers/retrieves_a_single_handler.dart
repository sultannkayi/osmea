import 'package:apis/apis.dart';
import 'package:apis/network/remote/marketing_event/abstract/marketing_event_service.dart';
import 'package:get_it/get_it.dart';
import '../../api_service_registry.dart';
import '../../api_request_handler.dart';

///*******************************************************************
///***************** 🔐 MARKETING EVENT SINGLE HANDLER 🔐 *****************
///*******************************************************************

class RetrievesASingleHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    // Only handle GET requests for retrieving a marketing event
    if (method != 'GET') {
      return {
        "status": "error",
        "message": "Method $method not supported. Only GET is allowed.",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    // Extract required parameters
    final marketingEventId = params['marketing_event_id'];

    // Validate required parameters
    if (marketingEventId == null || marketingEventId.isEmpty) {
      return {
        "status": "error",
        "message": "Marketing Event ID is required",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      // 🚀 Make API call to get single marketing event
      final response = await GetIt.I.get<MarketingEventEvents>().retrievesASingle(
        apiVersion: ApiNetwork.apiVersion,
        marketingEventId: marketingEventId,
      );

      // Return success response
      return {
        "status": "success",
        "message": "Marketing event retrieved successfully",
        "marketing_event": response.marketingEvent?.toJson(),
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      // Handle errors
      return {
        "status": "error",
        "message": "Failed to retrieve marketing event: ${e.toString()}",
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
            name: 'marketing_event_id',
            label: 'Marketing Event ID',
            hint: 'ID of the marketing event to retrieve',
            isRequired: true,
          ),
        ],
      };
}
