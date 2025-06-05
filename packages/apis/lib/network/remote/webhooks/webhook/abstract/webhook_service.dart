import 'package:apis/network/remote/webhooks/webhook/freezed_model/request/create_webhook_request.dart';
import 'package:apis/network/remote/webhooks/webhook/freezed_model/request/update_webhook_request.dart';
import 'package:apis/network/remote/webhooks/webhook/freezed_model/response/get_a_webhook_response.dart';
import 'package:apis/network/remote/webhooks/webhook/freezed_model/response/get_all_webhooks_response.dart';
import 'package:apis/network/remote/webhooks/webhook/freezed_model/response/get_count_of_webhooks_response.dart';

abstract class WebhookService {
  /// Gets all webhooks
  Future<GetAllWebhooksResponse> getWebhooks({
    required String apiVersion,
    String? fields,
    String? address,
    String? topic,
    String? since_id,
    String? created_at_min,
    String? created_at_max,
    String? updated_at_min,
    String? updated_at_max,
    int? limit,
  });

  /// Gets a single webhook by ID
  Future<GetAWebhookResponse> getWebhook({
    required String apiVersion,
    required int id,
    String? fields,
  });

  /// Gets the count of webhooks
  Future<GetCountOfWebhooksResponse> getWebhooksCount({
    required String apiVersion,
    String? address,
    String? topic,
  });

  /// Creates a new webhook
  Future<GetAWebhookResponse> createWebhook({
    required String apiVersion,
    required CreateWebhookRequest model,
  });

  /// Updates an existing webhook
  Future<GetAWebhookResponse> updateWebhook({
    required String apiVersion,
    required int id,
    required UpdateWebhookRequest model,
  });

  /// Deletes a webhook
  Future<void> deleteWebhook({
    required String apiVersion,
    required int id,
  });
}