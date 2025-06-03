import 'package:flutter/material.dart';
import 'package:example/services/api_service_registry.dart';
import 'package:example/widgets/modern_api_panel.dart';
import 'package:example/widgets/ide_response_panel.dart';
import 'package:example/widgets/empty_api_guidance.dart';

class MobileLayout extends StatelessWidget {
  final ApiService? selectedService;
  final String selectedMethod;
  final Map<String, String> parameters;
  final String? rawBody;
  final String currentApiUrl;
  final bool loading;
  final Map<String, dynamic>? responseData;
  final Animation<double> responseAnimation;
  final ValueChanged<String> onMethodChanged;
  final ValueChanged<Map<String, String>> onParametersChanged;
  final ValueChanged<String?> onRawBodyChanged;
  final VoidCallback onSendRequest;

  const MobileLayout({
    super.key,
    required this.selectedService,
    required this.selectedMethod,
    required this.parameters,
    required this.rawBody,
    required this.currentApiUrl,
    required this.loading,
    required this.responseData,
    required this.responseAnimation,
    required this.onMethodChanged,
    required this.onParametersChanged,
    required this.onRawBodyChanged,
    required this.onSendRequest,
  });

  @override
  Widget build(BuildContext context) {
    return selectedService == null
        ? const EmptyApiGuidance()
        : PageView(
            children: [
              ModernApiPanel(
                selectedService: selectedService,
                selectedMethod: selectedMethod,
                parameters: parameters,
                rawBody: rawBody,
                currentApiUrl: currentApiUrl,
                loading: loading,
                onMethodChanged: onMethodChanged,
                onParametersChanged: onParametersChanged,
                onRawBodyChanged: onRawBodyChanged,
                onSendRequest: onSendRequest,
              ),
              AnimatedBuilder(
                animation: responseAnimation,
                builder: (context, child) {
                  return IdeResponsePanel(
                    responseData: responseData,
                    loading: loading,
                    animation: responseAnimation,
                  );
                },
              ),
            ],
          );
  }
}
