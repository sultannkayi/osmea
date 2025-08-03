import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:flutter/material.dart';

import 'ticket_showcase_widget.dart';

/// 🎫 **Unified Ticket Showcase - Modular Structure**
///
/// Single story providing interactive controls for different Ticket Widget configurations.
List<Story> getUnifiedTicketShowcase() {
  return [
    Story(
      name: 'Ticket Widget',
      builder: (context) => TicketShowcaseWidget(
        // Form configuration controls
        formTitle: context.knobs.text(
          label: 'Form Title',
          initial: 'Technical Support Request',
        ),
        formDescription: context.knobs.text(
          label: 'Form Description',
          initial: 'Please provide details about your technical issue.',
        ),
        
        // Display settings
        showProgressIndicator: context.knobs.boolean(
          label: 'Show Progress Indicator',
          initial: true,
        ),
        enableSaveAsDraft: context.knobs.boolean(
          label: 'Enable Save as Draft',
          initial: true,
        ),
        
        // Button text customization
        submitButtonText: context.knobs.text(
          label: 'Submit Button Text',
          initial: 'Submit Ticket',
        ),
        cancelButtonText: context.knobs.text(
          label: 'Cancel Button Text',
          initial: 'Cancel',
        ),
        saveAsDraftButtonText: context.knobs.text(
          label: 'Save as Draft Button Text',
          initial: 'Save as Draft',
        ),
        
        // Styling options
        padding: context.knobs.slider(
          label: 'Padding',
          initial: 16.0,
          min: 0.0,
          max: 32.0,
        ),
        backgroundColor: context.knobs.options(
          label: 'Background Color',
          initial: const Color(0xFFF8F9FA),
          options: const [
            Option(label: 'Light Gray', value: Color(0xFFF8F9FA)),
            Option(label: 'White', value: Colors.white),
            Option(label: 'Light Blue', value: Color(0xFFE3F2FD)),
            Option(label: 'Light Green', value: Color(0xFFE8F5E8)),
          ],
        ),
        
        // Question type controls
        includeNameField: context.knobs.boolean(
          label: 'Include Name Field',
          initial: true,
        ),
        includeEmailField: context.knobs.boolean(
          label: 'Include Email Field',
          initial: true,
        ),
        includeCategoryField: context.knobs.boolean(
          label: 'Include Category Field',
          initial: true,
        ),
        includePriorityField: context.knobs.boolean(
          label: 'Include Priority Field',
          initial: true,
        ),
        includeDescriptionField: context.knobs.boolean(
          label: 'Include Description Field',
          initial: true,
        ),
        includeMultiSelectField: context.knobs.boolean(
          label: 'Include Multi-Select Field',
          initial: true,
        ),
        includeDateField: context.knobs.boolean(
          label: 'Include Date Field',
          initial: true,
        ),
        includePhoneField: context.knobs.boolean(
          label: 'Include Phone Field',
          initial: true,
        ),
        includeUrlField: context.knobs.boolean(
          label: 'Include URL Field',
          initial: true,
        ),
        includeRatingField: context.knobs.boolean(
          label: 'Include Rating Field',
          initial: true,
        ),
        includeCheckboxField: context.knobs.boolean(
          label: 'Include Checkbox Field',
          initial: true,
        ),
        includeNumberField: context.knobs.boolean(
          label: 'Include Number Field',
          initial: true,
        ),
      ),
    ),
  ];
} 