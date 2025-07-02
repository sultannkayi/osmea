import 'package:osmea_components/osmea_components.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import 'text_field_showcase_widget.dart';

/// Unified Text Field Showcase - Modular Structure
/// 
/// Single story that shows all text field variations in one place
/// All knobs control every text field simultaneously for easy comparison

List<Story> getUnifiedTextFieldShowcase() {
  return [
    Story(
      name: 'Text Fields',
      builder: (context) => TextFieldShowcaseWidget(
        // Field Content
        labelText: context.knobs.text(
          label: 'Label Text (Primary Field)',
          initial: 'Email Address',
        ),
        hintText: context.knobs.text(
          label: 'Hint Text (Primary Field)',
          initial: 'Enter your email address',
        ),
        helperText: context.knobs.text(
          label: 'Helper Text (Primary Field)',
          initial: 'We will never share your email',
        ),
        errorText: context.knobs.text(
          label: 'Error Text (Primary Field)',
          initial: 'Please enter a valid email address',
        ),
        
        // TextField Variant Controls
        variant: context.knobs.options(
          label: 'TextField Variant',
          initial: TextFieldVariant.outlined,
          options: const [
            Option(label: 'Outlined', value: TextFieldVariant.outlined),
            Option(label: 'Filled', value: TextFieldVariant.filled),
            Option(label: 'Underlined', value: TextFieldVariant.underlined),
            Option(label: 'Borderless', value: TextFieldVariant.borderless),
          ],
        ),
        
        // Size Controls
        size: context.knobs.options(
          label: 'Size',
          initial: TextFieldSize.medium,
          options: const [
            Option(label: 'Extra Small', value: TextFieldSize.extraSmall),
            Option(label: 'Small', value: TextFieldSize.small),
            Option(label: 'Medium', value: TextFieldSize.medium),
            Option(label: 'Large', value: TextFieldSize.large),
            Option(label: 'Extra Large', value: TextFieldSize.extraLarge),
          ],
        ),
        
        // Input Type Controls
        inputType: context.knobs.options(
          label: 'Input Type',
          initial: TextFieldType.text,
          options: const [
            Option(label: 'Text', value: TextFieldType.text),
            Option(label: 'Email', value: TextFieldType.email),
            Option(label: 'Password', value: TextFieldType.password),
            Option(label: 'Number', value: TextFieldType.number),
            Option(label: 'Phone', value: TextFieldType.phone),
            Option(label: 'URL', value: TextFieldType.url),
            Option(label: 'Multiline', value: TextFieldType.multiline),
            Option(label: 'Search', value: TextFieldType.search),
            Option(label: 'OTP', value: TextFieldType.otp),
          ],
        ),
        
        // State Controls
        state: context.knobs.options(
          label: '🔄 TextField State (All Examples)',
          initial: TextFieldState.enabled,
          options: const [
            Option(label: 'Enabled', value: TextFieldState.enabled),
            Option(label: 'Disabled', value: TextFieldState.disabled),
            Option(label: 'Focused', value: TextFieldState.focused),
            Option(label: 'Error', value: TextFieldState.error),
            Option(label: 'Success', value: TextFieldState.success),
            Option(label: 'Warning', value: TextFieldState.warning),
          ],
        ),
        
        // Legacy State Controls (kept for backward compatibility)
        isEnabled: context.knobs.boolean(
          label: 'Enabled (Legacy - use State above)',
          initial: true,
        ),
        isReadOnly: context.knobs.boolean(
          label: 'Read Only',
          initial: false,
        ),
        hasError: context.knobs.boolean(
          label: 'Show Error State (Legacy - use State above)',
          initial: false,
        ),
        isRequired: context.knobs.boolean(
          label: 'Required Field',
          initial: false,
        ),
        
        // Visual Options
        showLabel: context.knobs.boolean(
          label: 'Show Label',
          initial: true,
        ),
        showHelper: context.knobs.boolean(
          label: 'Show Helper Text',
          initial: true,
        ),
        showPrefixIcon: context.knobs.boolean(
          label: 'Show Prefix Icon',
          initial: true,
        ),
        showSuffixIcon: context.knobs.boolean(
          label: 'Show Suffix Icon',
          initial: true,
        ),
        obscureText: context.knobs.boolean(
          label: 'Obscure Text (for passwords)',
          initial: false,
        ),
        
        // OTP TextField Controls
        otpDigitCount: context.knobs.sliderInt(
          label: 'OTP Digit Count',
          initial: 6,
          min: 4,
          max: 6,
        ),
        otpObscureText: context.knobs.boolean(
          label: 'OTP Obscure Text',
          initial: false,
        ),
        
        // Styling Options
        borderRadius: context.knobs.slider(
          label: 'Border Radius',
          initial: 8.0,
          min: 0.0,
          max: 24.0,
        ),
        maxLines: context.knobs.sliderInt(
          label: 'Max Lines (for multiline)',
          initial: 1,
          min: 1,
          max: 5,
        ),
        
        // Layout Options
        fullWidth: context.knobs.boolean(
          label: 'Full Width',
          initial: true,
        ),
        spacing: context.knobs.slider(
          label: 'Component Spacing',
          initial: 24.0,
          min: 8.0,
          max: 48.0,
        ),
        showLabels: context.knobs.boolean(
          label: 'Show Section Labels',
          initial: true,
        ),
        darkBackground: context.knobs.boolean(
          label: 'Dark Background',
          initial: false,
        ),
      ),
    ),
  ];
}
