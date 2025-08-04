import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

import '../widgets/section_container_widget.dart';
import '../widgets/radio_option_widget.dart';

class PaymentSection extends StatelessWidget {
  final String? selectedPayment;
  final ValueChanged<String?> onPaymentChanged;
  final RadioVariant variant;
  final RadioSize size;
  final RadioStyle style;
  final RadioState state;
  final bool showDescription;
  final bool fullWidth;
  final RadioLabelPosition labelPosition;
  final bool darkBackground;

  const PaymentSection({
    super.key,
    required this.selectedPayment,
    required this.onPaymentChanged,
    required this.variant,
    required this.size,
    required this.style,
    required this.state,
    required this.showDescription,
    required this.fullWidth,
    required this.labelPosition,
    required this.darkBackground,
  });

  @override
  Widget build(BuildContext context) {
    return SectionContainerWidget(
      title: 'Payment Method',
      description: 'Select your preferred payment option',
      darkBackground: darkBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RadioOptionWidget<String>(
            value: 'card',
            groupValue: selectedPayment,
            label: 'Credit Card',
            description: 'Pay with credit or debit card',
            onChanged: onPaymentChanged,
            variant: variant,
            size: size,
            style: style,
            state: state,
            showDescription: showDescription,
            fullWidth: fullWidth,
            labelPosition: labelPosition,
          ),
          const SizedBox(height: 4),
          RadioOptionWidget<String>(
            value: 'paypal',
            groupValue: selectedPayment,
            label: 'PayPal',
            description: 'Pay securely with PayPal',
            onChanged: onPaymentChanged,
            variant: variant,
            size: size,
            style: style,
            state: state,
            showDescription: showDescription,
            fullWidth: fullWidth,
            labelPosition: labelPosition,
          ),
          const SizedBox(height: 4),
          RadioOptionWidget<String>(
            value: 'apple',
            groupValue: selectedPayment,
            label: 'Apple Pay',
            description: 'Quick payment with Touch ID',
            onChanged: onPaymentChanged,
            variant: variant,
            size: size,
            style: style,
            state: state,
            showDescription: showDescription,
            fullWidth: fullWidth,
            labelPosition: labelPosition,
          ),
        ],
      ),
    );
  }
}
