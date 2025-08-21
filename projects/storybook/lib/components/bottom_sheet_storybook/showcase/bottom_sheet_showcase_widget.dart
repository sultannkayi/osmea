import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import '../utils/bottom_sheet_builder.dart';

/// 📋 **Bottom Sheet Showcase Widget**
///
/// Simple, clean showcase that displays different bottom sheet configurations
/// based on the selected options from the storybook knobs
class UnifiedBottomSheetShowcaseWidget extends StatefulWidget {
  // Size and Variant
  final BottomSheetSize size;
  final BottomSheetVariant variant;

  // Content
  final String contentType;
  final String title;
  final String subtitle;

  // Action Bar Controls
  final bool showActionBorder;

  // Colors
  final Color? backgroundColor;
  final Color? actionBarBackgroundColor;
  final Color? borderColor;

  // Layout Options
  final double spacing;
  final bool showConfigurationInfo;
  final bool withBackdrop;

  const UnifiedBottomSheetShowcaseWidget({
    super.key,
    required this.size,
    required this.variant,
    required this.contentType,
    required this.title,
    required this.subtitle,
    required this.showActionBorder,
    this.backgroundColor,
    this.actionBarBackgroundColor,
    this.borderColor,
    required this.spacing,
    required this.showConfigurationInfo,
    required this.withBackdrop,
  });

  @override
  State<UnifiedBottomSheetShowcaseWidget> createState() => _UnifiedBottomSheetShowcaseWidgetState();
}

class _UnifiedBottomSheetShowcaseWidgetState extends State<UnifiedBottomSheetShowcaseWidget> {
  bool _isBottomSheetVisible = false;
  double _dragOffset = 0.0;

  // Helper method for drag start logic
  void _handleDragStart() {
    _dragOffset = 0.0;
  }

  // Helper method for drag update logic
  void _handleDragUpdate(double deltaY) {
    setState(() {
      _dragOffset += deltaY;
      // Limit upward drag
      if (_dragOffset < 0) _dragOffset = 0;
    });
  }

  // Helper method for drag end logic
  void _handleDragEnd(double velocity) {
    // If dragged down more than 50 pixels or fast swipe down, dismiss
    if (_dragOffset > 50 || velocity > 200) {
      _toggleBottomSheet();
    } else {
      // Snap back to original position
      setState(() {
        _dragOffset = 0.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Stack(
        children: [
          // Main content
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Demo Button
              _buildDemoButton(context),

              const SizedBox(height: 32),

              // Configuration Info
              if (widget.showConfigurationInfo) _buildConfigurationInfo(context),
            ],
          ),

          // Bottom sheet overlay
          if (_isBottomSheetVisible) _buildBottomSheetOverlay(context),
        ],
      ),
    );
  }

  Widget _buildDemoButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: OsmeaComponents.button(
        text: _isBottomSheetVisible ? 'Close Bottom Sheet' : 'Open Bottom Sheet',
        onPressed: () => _toggleBottomSheet(),
        variant: ButtonVariant.primary,
        size: ButtonSize.large,
        icon: Icon(_isBottomSheetVisible ? Icons.close : Icons.launch),
        iconPosition: IconPosition.leading,
        backgroundColor: OsmeaColors.nordicBlue,
        textColor: OsmeaColors.white,
        fullWidth: true,
      ),
    );
  }

  void _toggleBottomSheet() {
    setState(() {
      _isBottomSheetVisible = !_isBottomSheetVisible;
      _dragOffset = 0.0; // Reset drag offset when toggling
    });
  }

  Widget _buildBottomSheetOverlay(BuildContext context) {
    // Calculate height based on size
    final screenHeight = MediaQuery.of(context).size.height;
    double maxHeight;
    switch (widget.size) {
      case BottomSheetSize.small:
        maxHeight = screenHeight * 0.25; // 25%
        break;
      case BottomSheetSize.medium:
        maxHeight = screenHeight * 0.50; // 50%
        break;
      case BottomSheetSize.large:
        maxHeight = screenHeight * 0.75; // 75%
        break;
    }

    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      top: 0,
      child: Container(
        decoration: BoxDecoration(
          color: widget.withBackdrop ? Colors.black.withAlpha(128) : Colors.transparent,
        ),
        child: GestureDetector(
          onTap: widget.withBackdrop ? _toggleBottomSheet : null,
          child: Container(
            width: double.infinity,
            height: screenHeight,
            color: Colors.transparent,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {}, // Prevent backdrop tap from closing when tapping sheet
                // Use only vertical drag handlers to avoid gesture conflicts
                onVerticalDragStart: (details) => _handleDragStart(),
                onVerticalDragUpdate: (details) => _handleDragUpdate(details.delta.dy),
                onVerticalDragEnd: (details) => _handleDragEnd(details.velocity.pixelsPerSecond.dy),
                child: Transform.translate(
                  offset: Offset(0, _dragOffset),
                  child: Container(
                    constraints: BoxConstraints(
                      maxHeight: maxHeight,
                      minHeight: 0,
                    ),
                    child: SingleChildScrollView(
                      child: BottomSheetBuilder.buildBottomSheet(
                        size: widget.size,
                        variant: widget.variant,
                        contentType: widget.contentType,
                        title: widget.title,
                        subtitle: widget.subtitle,
                        showActionBorder: widget.showActionBorder,
                        backgroundColor: widget.backgroundColor,
                        actionBarBackgroundColor: widget.actionBarBackgroundColor,
                        borderColor: widget.borderColor,
                        spacing: widget.spacing,
                        onClose: _toggleBottomSheet,
                        // Pass configurable colors from the widget properties
                        primaryButtonBackground: widget.backgroundColor,
                        primaryButtonText: Colors.white,
                        secondaryButtonBackground: widget.borderColor ?? OsmeaColors.forestHeart,
                        secondaryButtonText: Colors.white,
                        hintTextColor: Colors.grey.shade600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildConfigurationInfo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        children: [
          Text(
            'Current Configuration',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          _buildConfigRow('Size', widget.size.toString().split('.').last),
          _buildConfigRow('Variant', widget.variant.toString().split('.').last),
          _buildConfigRow('Content Type', widget.contentType),
          _buildConfigRow('Title', widget.title),
          if (widget.subtitle.isNotEmpty) _buildConfigRow('Subtitle', widget.subtitle),
          _buildConfigRow('Show Action Border', widget.showActionBorder ? 'Yes' : 'No'),
          _buildConfigRow('With Backdrop', widget.withBackdrop ? 'Yes' : 'No'),
          if (widget.backgroundColor != null)
            _buildConfigRow('Background', 'Custom Color'),
          if (widget.actionBarBackgroundColor != null)
            _buildConfigRow('Action Bar Background', 'Custom Color'),
          if (widget.borderColor != null)
            _buildConfigRow('Border Color', 'Custom Color'),
        ],
      ),
    );
  }

  Widget _buildConfigRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.black54,
              ),
              textAlign: TextAlign.right,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
