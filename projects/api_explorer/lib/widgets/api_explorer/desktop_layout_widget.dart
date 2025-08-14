import 'package:api_explorer/widgets/ide_response_panel.dart';
import 'package:api_explorer/widgets/modern_api_panel.dart';
import 'package:api_explorer/widgets/modern_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:api_explorer/services/api_service_registry.dart';

class DesktopLayoutWidget extends StatelessWidget {
  final BoxConstraints constraints;
  final bool isTablet;
  final bool sidebarExpanded;
  final Animation<double> sidebarAnimation;
  final ApiService? selectedService;
  final String selectedMethod;
  final Map<String, String> parameters;
  final String? rawBody;
  final String currentApiUrl;
  final bool loading;
  final Map<String, dynamic>? responseData;
  final ValueChanged<ApiService> onServiceSelected;
  final ValueChanged<String> onMethodChanged;
  final ValueChanged<Map<String, String>> onParametersChanged;
  final ValueChanged<String?> onRawBodyChanged;
  final VoidCallback sendRequest;

  const DesktopLayoutWidget({
    super.key,
    required this.constraints,
    required this.isTablet,
    required this.sidebarExpanded,
    required this.sidebarAnimation,
    required this.selectedService,
    required this.selectedMethod,
    required this.parameters,
    required this.rawBody,
    required this.currentApiUrl,
    required this.loading,
    required this.responseData,
    required this.onServiceSelected,
    required this.onMethodChanged,
    required this.onParametersChanged,
    required this.onRawBodyChanged,
    required this.sendRequest,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedBuilder(
          animation: sidebarAnimation,
          builder: (context, child) {
            final sidebarWidth = isTablet ? 280.0 : 320.0;
            return SizedBox(
              width: sidebarExpanded
                  ? sidebarWidth * sidebarAnimation.value
                  : 60.0,
              child: ModernSidebar(
                expanded: sidebarExpanded,
                selectedService: selectedService,
                onServiceSelected: onServiceSelected,
                animation: sidebarAnimation,
              ),
            );
          },
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                flex: isTablet ? 1 : 2,
                child: ModernApiPanel(
                  selectedService: selectedService,
                  selectedMethod: selectedMethod,
                  parameters: parameters,
                  rawBody: rawBody,
                  currentApiUrl: currentApiUrl,
                  loading: loading,
                  onMethodChanged: onMethodChanged,
                  onParametersChanged: onParametersChanged,
                  onRawBodyChanged: onRawBodyChanged,
                  onSendRequest: sendRequest,
                ),
              ),
              Expanded(
                flex: isTablet ? 1 : 2,
                child: IdeResponsePanel(
                  responseData: responseData,
                  loading: loading,
                  animation: sidebarAnimation,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
