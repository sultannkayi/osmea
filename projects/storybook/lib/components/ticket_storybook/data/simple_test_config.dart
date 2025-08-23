import 'package:osmea_components/osmea_components.dart';


/// 🧪 **Simple Test Configuration**
///
/// A minimal ticket configuration for testing basic functionality.
class SimpleTestConfig {
  /// Minimal ticket configuration with just a name field
  static TicketFormConfig get minimalTicket => const TicketFormConfig(
    id: 'minimal_test_ticket',
    title: 'Minimal Test Ticket',
    description: 'A simple test configuration with minimal fields.',
    category: TicketCategory.general,
    defaultPriority: TicketPriority.medium,
    size: TicketWidgetSize.medium,
    questions: [
      TicketQuestion(
        id: 'test_name',
        label: 'Test Name',
        hint: 'Enter a test name',
        type: QuestionType.textField,
        validationMode: ValidationMode.required,
        isRequired: true,
      ),
    ],
    settings: TicketFormSettings(
      showProgressIndicator: false,
      allowSaveAsDraft: false,
      submitButtonText: 'Test Submit',
      cancelButtonText: 'Test Cancel',
    ),
  );

  /// Basic ticket configuration with common fields
  static TicketFormConfig get basicTestTicket => const TicketFormConfig(
    id: 'basic_test_ticket',
    title: 'Basic Test Ticket',
    description: 'A basic test configuration with common field types.',
    category: TicketCategory.general,
    defaultPriority: TicketPriority.medium,
    size: TicketWidgetSize.medium,
    questions: [
      TicketQuestion(
        id: 'name',
        label: 'Name',
        hint: 'Enter your name',
        type: QuestionType.textField,
        validationMode: ValidationMode.required,
        isRequired: true,
      ),
      TicketQuestion(
        id: 'email',
        label: 'Email',
        hint: 'Enter your email',
        type: QuestionType.email,
        validationMode: ValidationMode.email,
        isRequired: true,
      ),
      TicketQuestion(
        id: 'description',
        label: 'Description',
        hint: 'Enter a description',
        type: QuestionType.textArea,
        validationMode: ValidationMode.required,
        isRequired: true,
      ),
    ],
    settings: TicketFormSettings(
      showProgressIndicator: true,
      allowSaveAsDraft: true,
      submitButtonText: 'Submit Test',
      cancelButtonText: 'Cancel',
      saveAsDraftButtonText: 'Save Draft',
    ),
  );
} 