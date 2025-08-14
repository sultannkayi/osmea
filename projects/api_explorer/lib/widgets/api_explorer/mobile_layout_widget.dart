import 'package:flutter/material.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:api_explorer/widgets/ide_response_panel.dart';
import 'package:api_explorer/widgets/modern_api_panel.dart';
import 'package:api_explorer/widgets/api_explorer/mobile_app_bar_widget.dart';
import 'package:api_explorer/widgets/api_explorer/mobile_bottom_nav_widget.dart';

class MobileLayoutWidget extends StatelessWidget {
  final BoxConstraints constraints;
  final bool isNarrow;
  final int currentMobilePage;
  final PageController mobilePageController;
  final ApiService? selectedService;
  final String selectedMethod;
  final Map<String, String> parameters;
  final String? rawBody;
  final String currentApiUrl;
  final bool loading;
  final Map<String, dynamic>? responseData;
  final Animation<double> sidebarAnimation;
  final ValueChanged<String> onMethodChanged;
  final ValueChanged<Map<String, String>> onParametersChanged;
  final ValueChanged<String?> onRawBodyChanged;
  final VoidCallback sendRequest;
  final Function(int) changeMobilePage;
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  const MobileLayoutWidget({
    super.key,
    required this.constraints,
    required this.isNarrow,
    required this.currentMobilePage,
    required this.mobilePageController,
    required this.selectedService,
    required this.selectedMethod,
    required this.parameters,
    required this.rawBody,
    required this.currentApiUrl,
    required this.loading,
    required this.responseData,
    required this.sidebarAnimation,
    required this.onMethodChanged,
    required this.onParametersChanged,
    required this.onRawBodyChanged,
    required this.sendRequest,
    required this.changeMobilePage,
    required this.toggleTheme,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MobileAppBarWidget(
          isNarrow: isNarrow,
          toggleTheme: toggleTheme,
          isDarkMode: isDarkMode,
        ),
        Expanded(
          child: PageView(
            controller: mobilePageController,
            onPageChanged: changeMobilePage,
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
                onSendRequest: sendRequest,
              ),
              IdeResponsePanel(
                responseData: responseData,
                loading: loading,
                animation: sidebarAnimation,
              ),
            ],
          ),
        ),
        MobileBottomNavWidget(
          isNarrow: isNarrow,
          currentMobilePage: currentMobilePage,
          changeMobilePage: changeMobilePage,
        ),
      ],
    );
  }
}
