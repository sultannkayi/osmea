import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

class RadioOptionWidget<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final String label;
  final String description;
  final ValueChanged<T?>? onChanged;
  final RadioVariant variant;
  final RadioSize size;
  final RadioStyle style;
  final RadioState state;
  final bool showDescription;
  final bool fullWidth;
  final RadioLabelPosition labelPosition;

  const RadioOptionWidget({
    super.key,
    required this.value,
    required this.groupValue,
    required this.label,
    required this.description,
    required this.onChanged,
    required this.variant,
    required this.size,
    required this.style,
    required this.state,
    required this.showDescription,
    required this.fullWidth,
    required this.labelPosition,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: fullWidth ? double.infinity : null,
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Align(
        alignment: Alignment.centerLeft,
        child: OsmeaComponents.radioButton<T>(
          value: value,
          groupValue: groupValue,
          label: label,
          description: showDescription ? description : null,
          variant: variant,
          size: size,
          style: style,
          state: state != RadioState.disabled ? state : RadioState.disabled,
          fullWidth: fullWidth,
          labelPosition: labelPosition,
          onChanged: state == RadioState.disabled ? null : onChanged,
        ),
      ),
    );
  }
}
