import 'package:api_explorer/widgets/modern_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:api_explorer/services/api_service_registry.dart';

class MobileDrawerWidget extends StatelessWidget {
  final BoxConstraints constraints;
  final bool isNarrow;
  final ApiService? selectedService;
  final Animation<double> sidebarAnimation;
  final ValueChanged<ApiService> onServiceSelected;

  const MobileDrawerWidget({
    super.key,
    required this.constraints,
    required this.isNarrow,
    required this.selectedService,
    required this.sidebarAnimation,
    required this.onServiceSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: constraints.maxWidth * 0.85,
      child: ModernSidebar(
        expanded: true,
        selectedService: selectedService,
        onServiceSelected: (service) {
          onServiceSelected(service);
          Navigator.of(context).pop();
        },
        animation: sidebarAnimation,
      ),
    );
  }
}
