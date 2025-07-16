import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import '../sections/header_section.dart';
import '../widgets/loading_widgets.dart';
import '../utils/loading_utils.dart';
import '../utils/loading_builder.dart';

/// 🔄 **Loading Showcase Widget**
///
/// Main showcase widget that builds loading demos based on knob changes.
class LoadingShowcaseWidget extends StatelessWidget {
  final LoadingType loadingType;
  final double loadingSize;
  final String loadingColor;

  const LoadingShowcaseWidget({
    super.key,
    required this.loadingType,
    required this.loadingSize,
    required this.loadingColor,
  });

  @override
  Widget build(BuildContext context) {
    final selectedColor = LoadingUtils.getColorFromString(loadingColor);
    final Map<String, String> infoMetrics = {
      'Type': LoadingUtils.getFormattedTypeName(loadingType),
      'Size': '${loadingSize.toInt()}px',
      'Color': loadingColor.toUpperCase(),
    };

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LoadingHeaderSection(
                title: 'OSMEA Loading Animations',
                subtitle: 'Comprehensive showcase of loading indicators with interactive controls',
                icon: Icons.autorenew,
                iconColor: Colors.white,
              ),
              const SizedBox(height: 24),
              SectionContainerWidget(
                title: 'Current Configuration',
                icon: Icons.info_outline,
                child: LoadingMetricsWidget(metrics: infoMetrics),
              ),
              const SizedBox(height: 32),
              Center(
                child: LoadingBuilder.buildLabeledLoading(
                  type: loadingType,
                  size: loadingSize,
                  color: selectedColor,
                  showLabel: true,
                  showBackground: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
