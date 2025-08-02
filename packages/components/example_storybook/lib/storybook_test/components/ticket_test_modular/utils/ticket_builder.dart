import 'package:osmea_components/src/components/ticket_widget/models/ticket_models.dart';
import 'package:osmea_components/src/enums/ticket_enums.dart';

/// 🎫 **Ticket Builder Utility**
/// 
/// Helper utility methods for building OSMEA ticket form fields within the showcase.
class TicketBuilder {
  /// Create a name field
  static TicketQuestion createNameField() {
    return const TicketQuestion(
      id: 'user_name',
      label: 'Full Name',
      hint: 'Enter your full name',
      type: QuestionType.textField,
      validationMode: ValidationMode.required,
      isRequired: true,
    );
  }

  /// Create an email field
  static TicketQuestion createEmailField() {
    return const TicketQuestion(
      id: 'user_email',
      label: 'Email Address',
      hint: 'Enter your email address',
      helperText: 'We\'ll use this to contact you about your ticket',
      type: QuestionType.email,
      validationMode: ValidationMode.email,
      isRequired: true,
    );
  }

  /// Create a category field
  static TicketQuestion createCategoryField() {
    return TicketQuestion(
      id: 'issue_category',
      label: 'Issue Category',
      hint: 'Select the category that best describes your issue',
      type: QuestionType.singleSelect,
      validationMode: ValidationMode.required,
      isRequired: true,
      options: [
        const TicketOption(
          id: 'login_issues',
          label: 'Login Issues',
          value: 'login',
          description: 'Problems with logging in or authentication',
        ),
        const TicketOption(
          id: 'performance_issues',
          label: 'Performance Issues',
          value: 'performance',
          description: 'Slow loading, crashes, or freezing',
        ),
        const TicketOption(
          id: 'feature_not_working',
          label: 'Feature Not Working',
          value: 'feature',
          description: 'A specific feature is not functioning as expected',
        ),
        const TicketOption(
          id: 'data_issues',
          label: 'Data Issues',
          value: 'data',
          description: 'Missing, incorrect, or corrupted data',
        ),
        const TicketOption(
          id: 'other',
          label: 'Other',
          value: 'other',
          description: 'Issue not covered by the above categories',
        ),
      ],
    );
  }

  /// Create a priority field
  static TicketQuestion createPriorityField() {
    return TicketQuestion(
      id: 'priority_level',
      label: 'Priority Level',
      hint: 'How urgent is this issue?',
      type: QuestionType.radioButton,
      validationMode: ValidationMode.required,
      isRequired: true,
      options: [
        const TicketOption(
          id: 'critical',
          label: 'Critical',
          value: 'critical',
          description: 'System is down or blocking business operations',
        ),
        const TicketOption(
          id: 'high',
          label: 'High',
          value: 'high',
          description: 'Major functionality is affected',
        ),
        const TicketOption(
          id: 'medium',
          label: 'Medium',
          value: 'medium',
          description: 'Minor issues with workarounds available',
          isDefault: true,
        ),
        const TicketOption(
          id: 'low',
          label: 'Low',
          value: 'low',
          description: 'Enhancement requests or minor bugs',
        ),
      ],
    );
  }

  /// Create a description field
  static TicketQuestion createDescriptionField() {
    return const TicketQuestion(
      id: 'issue_description',
      label: 'Issue Description',
      hint: 'Please describe the issue in detail...',
      helperText: 'Include steps to reproduce, expected vs actual behavior, and any error messages',
      type: QuestionType.textArea,
      validationMode: ValidationMode.minLength,
      isRequired: true,
      constraints: {
        'minLength': 20,
        'maxLength': 2000,
      },
    );
  }

  /// Create a multi-select field
  static TicketQuestion createMultiSelectField() {
    return TicketQuestion(
      id: 'affected_features',
      label: 'Affected Features',
      hint: 'Select all features that are affected (optional)',
      type: QuestionType.multiSelect,
      validationMode: ValidationMode.none,
      isRequired: false,
      options: [
        const TicketOption(
          id: 'dashboard',
          label: 'Dashboard',
          value: 'dashboard',
        ),
        const TicketOption(
          id: 'user_management',
          label: 'User Management',
          value: 'user_management',
        ),
        const TicketOption(
          id: 'reports',
          label: 'Reports',
          value: 'reports',
        ),
        const TicketOption(
          id: 'api',
          label: 'API Integration',
          value: 'api',
        ),
        const TicketOption(
          id: 'mobile_app',
          label: 'Mobile App',
          value: 'mobile_app',
        ),
        const TicketOption(
          id: 'web_interface',
          label: 'Web Interface',
          value: 'web_interface',
        ),
      ],
    );
  }

  /// Create a date field
  static TicketQuestion createDateField() {
    return const TicketQuestion(
      id: 'when_occurred',
      label: 'When did this issue first occur?',
      hint: 'Select the date when you first noticed this issue',
      type: QuestionType.dateTime,
      validationMode: ValidationMode.date,
      isRequired: false,
    );
  }

  /// Create a phone field
  static TicketQuestion createPhoneField() {
    return const TicketQuestion(
      id: 'contact_phone',
      label: 'Phone Number',
      hint: 'Enter your phone number (optional)',
      helperText: 'Only if you prefer phone contact for urgent issues',
      type: QuestionType.phone,
      validationMode: ValidationMode.phone,
      isRequired: false,
    );
  }

  /// Create a URL field
  static TicketQuestion createUrlField() {
    return const TicketQuestion(
      id: 'system_info_url',
      label: 'System Information URL',
      hint: 'If you have a URL with system details, paste it here',
      type: QuestionType.url,
      validationMode: ValidationMode.url,
      isRequired: false,
    );
  }

  /// Create a rating field
  static TicketQuestion createRatingField() {
    return const TicketQuestion(
      id: 'satisfaction_rating',
      label: 'Rate our previous support',
      hint: 'How would you rate our previous support interactions?',
      type: QuestionType.rating,
      validationMode: ValidationMode.none,
      isRequired: false,
      defaultValue: 0,
    );
  }

  /// Create a checkbox field
  static TicketQuestion createCheckboxField() {
    return const TicketQuestion(
      id: 'urgency_confirmation',
      label: 'I confirm this is an urgent issue requiring immediate attention',
      type: QuestionType.checkbox,
      validationMode: ValidationMode.none,
      isRequired: false,
    );
  }

  /// Create a number field
  static TicketQuestion createNumberField() {
    return const TicketQuestion(
      id: 'attachment_count',
      label: 'Number of attachments',
      hint: 'How many files do you want to attach?',
      type: QuestionType.number,
      validationMode: ValidationMode.number,
      isRequired: false,
      constraints: {
        'min': 0,
        'max': 5,
      },
    );
  }
} 