import 'package:flutter/material.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:api_explorer/widgets/home/wide_screen_layout.dart';
import 'package:api_explorer/widgets/home/medium_screen_layout.dart';
import 'package:api_explorer/widgets/home/mobile_layout.dart';

class ResponsiveContent extends StatelessWidget {
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
  final double screenWidth;

  const ResponsiveContent({
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
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    final isWideScreen = screenWidth >= 1200;
    final isMediumScreen = screenWidth >= 800;

    if (isWideScreen) {
      return WideScreenLayout(
        selectedService: selectedService,
        selectedMethod: selectedMethod,
        parameters: parameters,
        rawBody: rawBody,
        currentApiUrl: currentApiUrl,
        loading: loading,
        responseData: responseData,
        responseAnimation: responseAnimation,
        onMethodChanged: onMethodChanged,
        onParametersChanged: onParametersChanged,
        onRawBodyChanged: onRawBodyChanged,
        onSendRequest: onSendRequest,
      );
    } else if (isMediumScreen) {
      return MediumScreenLayout(
        selectedService: selectedService,
        selectedMethod: selectedMethod,
        parameters: parameters,
        rawBody: rawBody,
        currentApiUrl: currentApiUrl,
        loading: loading,
        responseData: responseData,
        responseAnimation: responseAnimation,
        onMethodChanged: onMethodChanged,
        onParametersChanged: onParametersChanged,
        onRawBodyChanged: onRawBodyChanged,
        onSendRequest: onSendRequest,
      );
    } else {
      return MobileLayout(
        selectedService: selectedService,
        selectedMethod: selectedMethod,
        parameters: parameters,
        rawBody: rawBody,
        currentApiUrl: currentApiUrl,
        loading: loading,
        responseData: responseData,
        responseAnimation: responseAnimation,
        onMethodChanged: onMethodChanged,
        onParametersChanged: onParametersChanged,
        onRawBodyChanged: onRawBodyChanged,
        onSendRequest: onSendRequest,
      );
    }
  }
}
