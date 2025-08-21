import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// 📋 **Bottom Sheet Builder Utility**
///
/// Helper utilities for bottom sheet construction and configuration

class BottomSheetBuilder {
  /// Build bottom sheet with common parameters based on content type
  static Widget buildBottomSheet({
    required BottomSheetSize size,
    required BottomSheetVariant variant,
    required String contentType,
    required String title,
    required String subtitle,
    required bool showActionBorder,
    Color? backgroundColor,
    Color? actionBarBackgroundColor,
    Color? borderColor,
    required double spacing,
    VoidCallback? onClose,
    // Footer button colors
    Color? primaryButtonBackground,
    Color? primaryButtonText,
    Color? secondaryButtonBackground,
    Color? secondaryButtonText,
    // Text colors
    Color? hintTextColor,
  }) {
    return OsmeaComponents.bottomSheet(
      size: size,
      variant: variant,
      title: title.isNotEmpty ? title : null,
      subtitle: subtitle.isNotEmpty ? subtitle : null,
      backgroundColor: backgroundColor,
      showActionBorder: showActionBorder,
      actionBarBackgroundColor: actionBarBackgroundColor,
      actionBarBorderColor: borderColor,
      child: _buildContent(contentType, size, variant, hintTextColor: hintTextColor),
      footer: _buildFooter(
        contentType, 
        size, 
        variant,
        primaryButtonBackground: primaryButtonBackground,
        primaryButtonText: primaryButtonText,
        secondaryButtonBackground: secondaryButtonBackground,
        secondaryButtonText: secondaryButtonText,
      ),
      headerActions: _buildHeaderActions(contentType, onClose),
      leftAction: _buildLeftAction(variant, contentType, onClose),
      rightAction: _buildRightAction(variant, contentType),
    );
  }

  /// Build content based on content type
  static Widget _buildContent(String contentType, BottomSheetSize size, BottomSheetVariant variant, {Color? hintTextColor}) {
    switch (contentType) {
      case 'Quick Actions':
        return _buildQuickActionsContent();
      case 'Settings':
        return _buildSettingsContent();
      case 'Form':
        return _buildFormContent();
      case 'Components Showcase':
        return _buildComponentsShowcaseContent();
      case 'Multi-Step Form':
        return _buildMultiStepFormContent(hintTextColor: hintTextColor);
      default:
        return _buildQuickActionsContent();
    }
  }

  /// Build footer based on content type
  static Widget? _buildFooter(
    String contentType, 
    BottomSheetSize size, 
    BottomSheetVariant variant, {
    Color? primaryButtonBackground,
    Color? primaryButtonText,
    Color? secondaryButtonBackground, 
    Color? secondaryButtonText,
  }) {
    switch (contentType) {
      case 'Settings':
        return _buildSettingsFooter(
          backgroundColor: primaryButtonBackground ?? OsmeaColors.nordicBlue,
          textColor: primaryButtonText ?? OsmeaColors.white,
        );
      case 'Form':
        return _buildFormFooter(
          submitButtonBackgroundColor: secondaryButtonBackground ?? OsmeaColors.forestHeart,
          submitButtonTextColor: secondaryButtonText ?? OsmeaColors.white,
        );
      case 'Multi-Step Form':
        return _buildMultiStepFormFooter();
      default:
        return null;
    }
  }

  /// Build header actions based on content type
  static List<Widget>? _buildHeaderActions(String contentType, VoidCallback? onClose) {
    switch (contentType) {
      case 'Settings':
        return [
          OsmeaComponents.iconButton(
            icon: const Icon(Icons.close),
            onPressed: onClose ?? () {},
            variant: ButtonVariant.ghost,
            tooltip: 'Close',
          ),
        ];
      default:
        return null;
    }
  }

  /// Build left action for action bar variant
  static Widget? _buildLeftAction(BottomSheetVariant variant, String contentType, VoidCallback? onClose) {
    if (variant != BottomSheetVariant.actionBar) return null;

    return OsmeaComponents.iconButton(
      icon: const Icon(Icons.close),
      onPressed: onClose ?? () {},
      variant: ButtonVariant.ghost,
      tooltip: 'Close',
    );
  }

  /// Build right action for action bar variant
  static Widget? _buildRightAction(BottomSheetVariant variant, String contentType) {
    if (variant != BottomSheetVariant.actionBar) return null;

    switch (contentType) {
      case 'Multi-Step Form':
        return OsmeaComponents.button(
          text: 'Next',
          icon: const Icon(Icons.arrow_forward),
          iconPosition: IconPosition.trailing,
          onPressed: () {},
          variant: ButtonVariant.primary,
          size: ButtonSize.small,
        );
      default:
        return OsmeaComponents.button(
          text: 'Save',
          onPressed: () {},
          variant: ButtonVariant.primary,
          size: ButtonSize.small,
        );
    }
  }

  /// Quick Actions Content
  static Widget _buildQuickActionsContent() {
    return OsmeaComponents.column(
      mainAxisSize: MainAxisSize.min,
      children: [
        OsmeaComponents.listItem(
          leading: const Icon(Icons.edit),
          title: OsmeaComponents.text('Edit'),
          onTap: () {},
        ),
        OsmeaComponents.listItem(
          leading: const Icon(Icons.share),
          title: OsmeaComponents.text('Share'),
          onTap: () {},
        ),
        OsmeaComponents.listItem(
          leading: const Icon(Icons.delete),
          title: OsmeaComponents.text('Delete'),
          onTap: () {},
        ),
        OsmeaComponents.listItem(
          leading: const Icon(Icons.download),
          title: OsmeaComponents.text('Download'),
          onTap: () {},
        ),
      ],
    );
  }

  /// Settings Content
  static Widget _buildSettingsContent() {
    return OsmeaComponents.column(
      children: [
        OsmeaComponents.listItem(
          leading: const Icon(Icons.notifications),
          title: OsmeaComponents.text('Notifications'),
          subtitle: OsmeaComponents.text('Receive push notifications'),
          trailing: OsmeaComponents.switchButton(
            value: true,
            onChanged: (value) {},
          ),
        ),
        OsmeaComponents.listItem(
          leading: const Icon(Icons.dark_mode),
          title: OsmeaComponents.text('Dark Mode'),
          subtitle: OsmeaComponents.text('Use dark theme'),
          trailing: OsmeaComponents.switchButton(
            value: false,
            onChanged: (value) {},
          ),
        ),
        OsmeaComponents.listItem(
          leading: const Icon(Icons.language),
          title: OsmeaComponents.text('Language'),
          subtitle: OsmeaComponents.text('English'),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
        OsmeaComponents.listItem(
          leading: const Icon(Icons.storage),
          title: OsmeaComponents.text('Storage'),
          subtitle: OsmeaComponents.text('Manage app storage'),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
        OsmeaComponents.listItem(
          leading: const Icon(Icons.security),
          title: OsmeaComponents.text('Privacy & Security'),
          subtitle: OsmeaComponents.text('Manage privacy settings'),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }

  /// Form Content
  static Widget _buildFormContent() {
    return OsmeaComponents.padding(
      padding: const EdgeInsets.all(16),
      child: OsmeaComponents.column(
        children: [
          OsmeaComponents.textField(
            label: 'Full Name',
            variant: TextFieldVariant.outlined,
            size: TextFieldSize.medium,
          ),
          OsmeaComponents.sizedBox(height: 16),
          OsmeaComponents.textField(
            label: 'Email',
            variant: TextFieldVariant.outlined,
            size: TextFieldSize.medium,
            type: TextFieldType.email,
          ),
          OsmeaComponents.sizedBox(height: 16),
          OsmeaComponents.textField(
            label: 'Phone',
            variant: TextFieldVariant.outlined,
            size: TextFieldSize.medium,
            type: TextFieldType.phone,
          ),
          OsmeaComponents.sizedBox(height: 16),
          OsmeaComponents.textField(
            label: 'Address',
            variant: TextFieldVariant.outlined,
            size: TextFieldSize.medium,
            maxLines: 3,
          ),
          OsmeaComponents.sizedBox(height: 16),
          OsmeaComponents.listItem(
            title: OsmeaComponents.text('Subscribe to newsletter'),
            trailing: OsmeaComponents.checkbox(
              value: false,
              onChanged: (value) {},
            ),
          ),
          OsmeaComponents.listItem(
            title: OsmeaComponents.text('Allow marketing emails'),
            trailing: OsmeaComponents.checkbox(
              value: true,
              onChanged: (value) {},
            ),
          ),
        ],
      ),
    );
  }

  /// Components Showcase Content
  static Widget _buildComponentsShowcaseContent() {
    return OsmeaComponents.padding(
      padding: const EdgeInsets.all(20),
      child: OsmeaComponents.column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Badge examples
          OsmeaComponents.row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OsmeaComponents.badge(
                content: 'Small',
                size: BadgeSize.small,
                variant: BadgeVariant.success,
              ),
              OsmeaComponents.badge(
                content: 'Medium',
                size: BadgeSize.medium,
                variant: BadgeVariant.primary,
              ),
              OsmeaComponents.badge(
                content: 'Large',
                size: BadgeSize.large,
                variant: BadgeVariant.warning,
              ),
            ],
          ),
          OsmeaComponents.sizedBox(height: 24),

          // Button examples
          OsmeaComponents.button(
            text: 'Primary Button',
            variant: ButtonVariant.primary,
            size: ButtonSize.medium,
            onPressed: () {},
          ),
          OsmeaComponents.sizedBox(height: 12),
          OsmeaComponents.button(
            text: 'Secondary Button',
            variant: ButtonVariant.secondary,
            size: ButtonSize.medium,
            onPressed: () {},
          ),
          OsmeaComponents.sizedBox(height: 12),
          OsmeaComponents.button(
            text: 'Success Button',
            variant: ButtonVariant.success,
            size: ButtonSize.medium,
            icon: const Icon(Icons.check),
            onPressed: () {},
          ),
          OsmeaComponents.expanded(
            child: OsmeaComponents.sizedBox(),
          ),
          OsmeaComponents.button(
            text: 'Close',
            variant: ButtonVariant.outlined,
            size: ButtonSize.large,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  /// Multi-Step Form Content
  static Widget _buildMultiStepFormContent({Color? hintTextColor}) {
    return OsmeaComponents.padding(
      padding: const EdgeInsets.all(20),
      child: OsmeaComponents.column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          OsmeaComponents.textField(
            label: 'First Name',
            hint: 'Enter your first name',
            variant: TextFieldVariant.outlined,
            size: TextFieldSize.medium,
            isRequired: true,
          ),
          OsmeaComponents.sizedBox(height: 16),
          OsmeaComponents.textField(
            label: 'Last Name',
            hint: 'Enter your last name',
            variant: TextFieldVariant.outlined,
            size: TextFieldSize.medium,
            isRequired: true,
          ),
          OsmeaComponents.sizedBox(height: 16),
          OsmeaComponents.textField(
            label: 'Email',
            hint: 'Enter your email address',
            variant: TextFieldVariant.outlined,
            size: TextFieldSize.medium,
            type: TextFieldType.email,
            isRequired: true,
          ),
          OsmeaComponents.sizedBox(height: 16),
          OsmeaComponents.textField(
            label: 'Phone Number',
            hint: 'Enter your phone number',
            variant: TextFieldVariant.outlined,
            size: TextFieldSize.medium,
            type: TextFieldType.phone,
          ),
          OsmeaComponents.sizedBox(height: 24),
          OsmeaComponents.text(
            'Please fill in all required fields to continue to the next step.',
            variant: OsmeaTextVariant.bodySmall,
            color: hintTextColor ?? OsmeaColors.grey.shade600,
          ),
        ],
      ),
    );
  }

  /// Settings Footer
  static Widget _buildSettingsFooter({
    Color? backgroundColor,
    Color? textColor,
  }) {
    return OsmeaComponents.padding(
      padding: const EdgeInsets.all(16),
      child: OsmeaComponents.button(
        text: 'Save Settings',
        onPressed: () {},
        variant: ButtonVariant.primary,
        size: ButtonSize.large,
        backgroundColor: backgroundColor ?? OsmeaColors.nordicBlue,
        textColor: textColor ?? OsmeaColors.white,
        fullWidth: true,
      ),
    );
  }

  /// Form Footer
  static Widget _buildFormFooter({
    Color? submitButtonBackgroundColor,
    Color? submitButtonTextColor,
  }) {
    return OsmeaComponents.padding(
      padding: const EdgeInsets.all(16),
      child: OsmeaComponents.row(
        children: [
          OsmeaComponents.expanded(
            child: OsmeaComponents.button(
              text: 'Cancel',
              onPressed: () {},
              variant: ButtonVariant.outlined,
              size: ButtonSize.medium,
            ),
          ),
          OsmeaComponents.sizedBox(width: 16),
          OsmeaComponents.expanded(
            child: OsmeaComponents.button(
              text: 'Submit',
              onPressed: () {},
              variant: ButtonVariant.primary,
              size: ButtonSize.medium,
              backgroundColor: submitButtonBackgroundColor ?? OsmeaColors.forestHeart,
              textColor: submitButtonTextColor ?? OsmeaColors.white,
            ),
          ),
        ],
      ),
    );
  }

  /// Multi-Step Form Footer
  static Widget _buildMultiStepFormFooter() {
    return OsmeaComponents.padding(
      padding: const EdgeInsets.all(16),
      child: OsmeaComponents.row(
        children: [
          OsmeaComponents.expanded(
            child: OsmeaComponents.button(
              text: 'Back',
              onPressed: () {},
              variant: ButtonVariant.outlined,
              size: ButtonSize.medium,
              icon: const Icon(Icons.arrow_back),
              iconPosition: IconPosition.leading,
            ),
          ),
          OsmeaComponents.sizedBox(width: 16),
          OsmeaComponents.expanded(
            child: OsmeaComponents.button(
              text: 'Complete',
              onPressed: () {},
              variant: ButtonVariant.success,
              size: ButtonSize.medium,
              icon: const Icon(Icons.done_all),
              iconPosition: IconPosition.trailing,
            ),
          ),
        ],
      ),
    );
  }
}
