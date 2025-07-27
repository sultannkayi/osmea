import 'dart:convert';
import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/payment_gateways/abstract/payment_gateways_service.dart';
import 'package:apis/network/remote/woocommerce/payment_gateways/freezed_model/response/update_payment_gateway_response.dart';
import 'package:example/services/api_request_handler.dart';
import 'package:example/services/api_service_registry.dart';
import 'package:dio/dio.dart';

class UpdatePaymentGatewayHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, String> params,
  ) async {
    if (method != 'PUT') {
      return {
        'success': false,
        'error': 'Method $method not supported for Update Payment Gateway API',
        'message': 'Only PUT method is supported',
      };
    }

    try {
      final id = params['id'];
      if (id == null || id.isEmpty) {
        return {
          'success': false,
          'error': 'Payment gateway ID is required',
          'message': 'Please provide a valid id',
        };
      }

      final apiVersion = params['api_version'] ?? 'v3';

      // Build gateway data from individual parameters
      Map<String, dynamic> gatewayData = {};

      // Add basic fields
      if (params['title'] != null && params['title']!.isNotEmpty) {
        gatewayData['title'] = params['title'];
      }
      if (params['description'] != null && params['description']!.isNotEmpty) {
        gatewayData['description'] = params['description'];
      }
      if (params['order'] != null && params['order']!.isNotEmpty) {
        gatewayData['order'] = int.tryParse(params['order']!) ?? 0;
      }
      if (params['enabled'] != null && params['enabled']!.isNotEmpty) {
        gatewayData['enabled'] = params['enabled']!.toLowerCase() == 'true';
      }
      if (params['method_title'] != null &&
          params['method_title']!.isNotEmpty) {
        gatewayData['method_title'] = params['method_title'];
      }
      if (params['method_description'] != null &&
          params['method_description']!.isNotEmpty) {
        gatewayData['method_description'] = params['method_description'];
      }

      // Parse method_supports as list
      if (params['method_supports'] != null &&
          params['method_supports']!.isNotEmpty) {
        gatewayData['method_supports'] = params['method_supports']!
            .split(',')
            .map((e) => e.trim())
            .where((e) => e.isNotEmpty)
            .toList();
      }

      // Parse settings as JSON
      if (params['settings'] != null && params['settings']!.isNotEmpty) {
        try {
          gatewayData['settings'] = json.decode(params['settings']!);
        } catch (e) {
          print(
              '⚠️ Warning: Invalid JSON in settings parameter: ${params['settings']}');
        }
      }

      print(
          '🔍 Updating payment gateway with ID: $id, API version: $apiVersion');
      print('📝 Gateway data: $gatewayData');

      final service = WooNetwork.getIt.get<PaymentGatewaysService>();
      final response = await service.updatePaymentGateway(
        id: id,
        gatewayData: gatewayData,
        apiVersion: apiVersion,
      );

      print('✅ Successfully updated payment gateway: ${response.title}');

      return {
        'success': true,
        'data': response.toJson(),
        'message': 'Payment gateway updated successfully',
      };
    } on DioException catch (e) {
      print('❌ DioException: ${e.message}');
      return {
        'success': false,
        'error': e.toString(),
        'message': 'Failed to update payment gateway: ${e.message}',
      };
    } catch (e) {
      print('❌ Unexpected error: $e');
      return {
        'success': false,
        'error': e.toString(),
        'message': 'Unexpected error: $e',
      };
    }
  }

  @override
  List<String> get supportedMethods => ['PUT'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'PUT': [
          const ApiField(
            name: 'id',
            label: 'Payment Gateway ID',
            hint: 'Unique identifier for the payment gateway (required)',
            isRequired: true,
          ),
          const ApiField(
            name: 'title',
            label: 'Title',
            hint: 'Payment gateway title on checkout.',
            isRequired: false,
          ),
          const ApiField(
            name: 'description',
            label: 'Description',
            hint: 'Payment gateway description on checkout.',
            isRequired: false,
          ),
          const ApiField(
            name: 'order',
            label: 'Order',
            hint: 'Payment gateway sort order.',
            isRequired: false,
          ),
          const ApiField(
            name: 'enabled',
            label: 'Enabled',
            hint: 'Payment gateway enabled status.',
            isRequired: false,
          ),
          const ApiField(
            name: 'method_title',
            label: 'Method Title',
            hint: 'Payment gateway method title.',
            isRequired: false,
          ),
          const ApiField(
            name: 'method_description',
            label: 'Method Description',
            hint: 'Payment gateway method description.',
            isRequired: false,
          ),
          const ApiField(
            name: 'method_supports',
            label: 'Method Supports',
            hint:
                'Comma-separated list of supported features (e.g., products,refunds).',
            isRequired: false,
          ),
          const ApiField(
            name: 'settings',
            label: 'Settings',
            hint: 'JSON string containing gateway settings.',
            isRequired: false,
          ),
          const ApiField(
            name: 'api_version',
            label: 'API Version',
            hint: 'API version (default: v3)',
            isRequired: false,
          ),
        ],
      };
}
