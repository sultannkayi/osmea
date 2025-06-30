import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// Reusable widget for switch options in the showcase
class SwitchOptionWidget extends StatelessWidget {
  final bool value;
  final String label;
  final String description;
  final SwitchVariant variant;
  final SwitchSize size;
  final SwitchStyle style;
  final SwitchState state;
  final bool showDescription;
  final bool fullWidth;
  final SwitchLabelPosition labelPosition;
  final ValueChanged<bool>? onChanged;

  const SwitchOptionWidget({
    Key? key,
    required this.value,
    required this.label,
    required this.description,
    required this.variant,
    required this.size,
    required this.style,
    required this.state,
    required this.showDescription,
    required this.fullWidth,
    required this.labelPosition,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: fullWidth ? double.infinity : null,
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Align(
        alignment: Alignment.centerLeft,
        child: OsmeaComponents.switchButton(
          value: value,
          label: label,
          description: showDescription ? description : null,
          variant: variant,
          size: size,
          style: style,
          state: state != SwitchState.disabled ? state : SwitchState.disabled,
          fullWidth: fullWidth,
          labelPosition: labelPosition,
          onChanged: state == SwitchState.disabled ? null : onChanged,
        ),
      ),
    );
  }
}
