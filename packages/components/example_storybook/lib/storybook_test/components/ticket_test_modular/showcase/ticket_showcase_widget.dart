import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import 'package:osmea_components/src/components/ticket_widget/models/ticket_models.dart';

import '../sections/header_section.dart';
import '../widgets/section_container_widget.dart';
import '../utils/ticket_builder.dart';

/// 🎫 **Ticket Showcase Widget**
///
/// Builds a dynamic ticket form that responds to knob changes in real-time.
class TicketShowcaseWidget extends StatelessWidget {
  // Form configuration
  final String formTitle;
  final String formDescription;
  
  // Display settings
  final bool showProgressIndicator;
  final bool enableSaveAsDraft;
  
  // Button text customization
  final String submitButtonText;
  final String cancelButtonText;
  final String saveAsDraftButtonText;
  
  // Styling options
  final double padding;
  final Color backgroundColor;
  
  // Question type controls
  final bool includeNameField;
  final bool includeEmailField;
  final bool includeCategoryField;
  final bool includePriorityField;
  final bool includeDescriptionField;
  final bool includeMultiSelectField;
  final bool includeDateField;
  final bool includePhoneField;
  final bool includeUrlField;
  final bool includeRatingField;
  final bool includeCheckboxField;
  final bool includeNumberField;

  const TicketShowcaseWidget({
    super.key,
    required this.formTitle,
    required this.formDescription,
    required this.showProgressIndicator,
    required this.enableSaveAsDraft,
    required this.submitButtonText,
    required this.cancelButtonText,
    required this.saveAsDraftButtonText,
    required this.padding,
    required this.backgroundColor,
    required this.includeNameField,
    required this.includeEmailField,
    required this.includeCategoryField,
    required this.includePriorityField,
    required this.includeDescriptionField,
    required this.includeMultiSelectField,
    required this.includeDateField,
    required this.includePhoneField,
    required this.includeUrlField,
    required this.includeRatingField,
    required this.includeCheckboxField,
    required this.includeNumberField,
  });

  @override
  Widget build(BuildContext context) {
    final config = _buildTicketConfig();
    final ticketWidget = _buildTicketWidget(context, config);

    final Map<String, String> infoChips = {
      'Title': formTitle,
      'Fields': _getFieldCount().toString(),
      'Progress': showProgressIndicator ? 'Yes' : 'No',
      'Draft': enableSaveAsDraft ? 'Yes' : 'No',
    };

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TicketHeaderSection(
              title: '🎫 OSMEA Ticket Widget Showcase',
              subtitle: 'Interactive demonstration of dynamic ticket form generation',
              infoChips: infoChips,
            ),
            const SizedBox(height: 32),
            SectionContainerWidget(
              title: 'Dynamic Ticket Form',
              wrapContent: false,
              children: [
                SizedBox(
                  width: 600,
                  child: ticketWidget,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the ticket configuration based on knob controls
  TicketFormConfig _buildTicketConfig() {
    final List<TicketQuestion> questions = [];

    // Add fields based on knob controls
    if (includeNameField) {
      questions.add(TicketBuilder.createNameField());
    }
    
    if (includeEmailField) {
      questions.add(TicketBuilder.createEmailField());
    }
    
    if (includeCategoryField) {
      questions.add(TicketBuilder.createCategoryField());
    }
    
    if (includePriorityField) {
      questions.add(TicketBuilder.createPriorityField());
    }
    
    if (includeDescriptionField) {
      questions.add(TicketBuilder.createDescriptionField());
    }
    
    if (includeMultiSelectField) {
      questions.add(TicketBuilder.createMultiSelectField());
    }
    
    if (includeDateField) {
      questions.add(TicketBuilder.createDateField());
    }
    
    if (includePhoneField) {
      questions.add(TicketBuilder.createPhoneField());
    }
    
    if (includeUrlField) {
      questions.add(TicketBuilder.createUrlField());
    }
    
    if (includeRatingField) {
      questions.add(TicketBuilder.createRatingField());
    }
    
    if (includeCheckboxField) {
      questions.add(TicketBuilder.createCheckboxField());
    }
    
    if (includeNumberField) {
      questions.add(TicketBuilder.createNumberField());
    }

    // Ensure we have at least one field to prevent empty form
    if (questions.isEmpty) {
      questions.add(TicketBuilder.createNameField());
    }

    return TicketFormConfig(
      id: 'dynamic_ticket_form',
      title: formTitle,
      description: formDescription,
      category: TicketCategory.technical,
      defaultPriority: TicketPriority.medium,
      size: TicketWidgetSize.medium,
      questions: questions,
      settings: TicketFormSettings(
        showProgressIndicator: showProgressIndicator,
        allowSaveAsDraft: enableSaveAsDraft,
        submitButtonText: submitButtonText,
        cancelButtonText: cancelButtonText,
        saveAsDraftButtonText: saveAsDraftButtonText,
      ),
    );
  }

  /// Builds the ticket widget with the configuration
  Widget _buildTicketWidget(BuildContext context, TicketFormConfig config) {
    try {
      return OsmeaComponents.ticketWidget(
        config: config,
        padding: EdgeInsets.all(padding),
        backgroundColor: backgroundColor,
        showProgressIndicator: showProgressIndicator,
        enableSaveAsDraft: enableSaveAsDraft,
        onSubmit: (response) async {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Ticket submitted! ID: ${response.ticketId}'),
              backgroundColor: Colors.green,
            ),
          );
          return true;
        },
        onSaveAsDraft: (response) async {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Ticket saved as draft'),
              backgroundColor: Colors.blue,
            ),
          );
          return true;
        },
        onCancel: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Ticket creation cancelled'),
              backgroundColor: Colors.orange,
            ),
          );
        },
      );
    } catch (e) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.red.shade50,
          border: Border.all(color: Colors.red.shade200),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Error loading ticket widget',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.red.shade700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Error: $e',
              style: TextStyle(
                fontSize: 14,
                color: Colors.red.shade600,
              ),
            ),
          ],
        ),
      );
    }
  }

  /// Gets the count of enabled fields
  int _getFieldCount() {
    int count = 0;
    if (includeNameField) count++;
    if (includeEmailField) count++;
    if (includeCategoryField) count++;
    if (includePriorityField) count++;
    if (includeDescriptionField) count++;
    if (includeMultiSelectField) count++;
    if (includeDateField) count++;
    if (includePhoneField) count++;
    if (includeUrlField) count++;
    if (includeRatingField) count++;
    if (includeCheckboxField) count++;
    if (includeNumberField) count++;
    return count;
  }
} 