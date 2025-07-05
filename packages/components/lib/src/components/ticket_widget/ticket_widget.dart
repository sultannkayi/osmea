/// 🎫 **OSMEA Ticket Widget**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components
///
/// Dynamic form widget for technical support tickets.
/// Generates forms from JSON configuration with various input types.
///
/// {@category Components}
/// {@subCategory Ticket}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osmea_components/src/components/ticket_widget/cubit/ticket_widget_cubit.dart';
import 'package:osmea_components/src/components/ticket_widget/cubit/ticket_widget_state.dart';
import 'package:osmea_components/src/components/ticket_widget/models/ticket_models.dart';
import 'package:osmea_components/src/components/ticket_widget/widgets/ticket_form_field.dart';
import 'package:osmea_components/src/theme/theme.dart';

/// 🎫 **OSMEA Ticket Widget**
///
/// A comprehensive ticket form widget that generates dynamic forms from JSON configuration.
/// Supports various input types including text fields, dropdowns, checkboxes, and more.
///
/// **Features:**
/// - Dynamic form generation from JSON
/// - Multiple input types (text, textarea, select, radio, checkbox, etc.)
/// - Built-in validation with customizable rules
/// - Progress tracking and step-by-step forms
/// - Save as draft functionality
/// - Responsive design with OSMEA theming
/// - Real-time validation feedback
/// - Custom styling support
///
/// **Usage:**
/// ```dart
/// TicketWidget(
///   config: TicketFormConfig.fromJson(jsonConfig),
///   onSubmit: (response) async {
///     // Handle form submission
///     return await submitTicket(response);
///   },
///   onSaveAsDraft: (response) async {
///     // Handle save as draft
///     return await saveDraft(response);
///   },
/// )
/// ```

class TicketWidget extends StatelessWidget {
  const TicketWidget({
    super.key,
    required this.config,
    this.onSubmit,
    this.onSaveAsDraft,
    this.onCancel,
    this.initialResponse,
    this.customTheme,
    this.padding,
    this.backgroundColor,
    this.showProgressIndicator,
    this.enableSaveAsDraft,
  });

  /// Form configuration defining the ticket form structure
  final TicketFormConfig config;

  /// Callback called when form is submitted
  final Future<bool> Function(TicketResponse response)? onSubmit;

  /// Callback called when form is saved as draft
  final Future<bool> Function(TicketResponse response)? onSaveAsDraft;

  /// Callback called when form is cancelled
  final VoidCallback? onCancel;

  /// Initial response data for editing existing tickets
  final TicketResponse? initialResponse;

  /// Custom theme override
  final CoreTheme? customTheme;

  /// Widget padding
  final EdgeInsetsGeometry? padding;

  /// Background color override
  final Color? backgroundColor;

  /// Whether to show progress indicator
  final bool? showProgressIndicator;

  /// Whether save as draft is enabled
  final bool? enableSaveAsDraft;

  @override
  Widget build(BuildContext context) {
    // Use basic colors instead of undefined theme properties
    const surfaceColor = Color(0xFFF8F9FA);
    const borderColor = Color(0xFFE0E0E0);

    return BlocProvider(
      create: (context) => TicketWidgetCubit(
        config: config,
        onSubmit: onSubmit,
        onSaveAsDraft: onSaveAsDraft,
        onCancel: onCancel,
        initialTicketId: initialResponse?.ticketId,
      ),
      child: Container(
        padding: padding ?? const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: backgroundColor ?? surfaceColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: borderColor,
            width: 1,
          ),
        ),
        child: BlocBuilder<TicketWidgetCubit, TicketWidgetState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Section
                  _buildHeader(context, state),
                  if (showProgressIndicator ?? config.settings?.showProgressIndicator ?? false)
                    _buildProgressIndicator(context, state),
                  const SizedBox(height: 16),
                  // Form Fields
                  _buildFormContent(context, state),
                  const SizedBox(height: 16),
                  // Action Buttons
                  _buildActionButtons(context, state),
                  if (state.errorMessage != null) ...[
                    const SizedBox(height: 8),
                    _buildErrorMessage(context, state),
                  ],
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  /// Build header section with title and description
  Widget _buildHeader(BuildContext context, TicketWidgetState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          config.title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        if (config.description != null) ...[
          const SizedBox(height: 8),
          Text(
            config.description!,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ],
    );
  }

  /// Build progress indicator
  Widget _buildProgressIndicator(BuildContext context, TicketWidgetState state) {
    return Column(
      children: [
        const SizedBox(height: 16),
        LinearProgressIndicator(
          value: state.completionPercentage,
          backgroundColor: Colors.grey.shade300,
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
        ),
        const SizedBox(height: 8),
        Text(
          '${(state.completionPercentage * 100).toInt()}% completed',
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }

  /// Build form content with dynamic fields
  Widget _buildFormContent(BuildContext context, TicketWidgetState state) {
    return SingleChildScrollView(
      child: Column(
        children: config.questions.map((question) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: TicketFormField(
              question: question,
              value: state.getAnswer(question.id),
              errorText: state.getValidationError(question.id),
              onChanged: (value) {
                context.read<TicketWidgetCubit>().updateAnswer(question.id, value);
              },
            ),
          );
        }).toList(),
      ),
    );
  }

  /// Build action buttons
  Widget _buildActionButtons(BuildContext context, TicketWidgetState state) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // If width is too small, stack buttons vertically
        if (constraints.maxWidth < 400) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: state.canSubmit && !state.isLoading ? () {
                  context.read<TicketWidgetCubit>().submitForm();
                } : null,
                child: state.isLoading 
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(config.settings?.submitButtonText ?? 'Submit'),
              ),
              if (enableSaveAsDraft ?? config.settings?.allowSaveAsDraft ?? false) ...[
                const SizedBox(height: 8),
                TextButton(
                  onPressed: state.isLoading ? null : () {
                    context.read<TicketWidgetCubit>().saveAsDraft();
                  },
                  child: Text(config.settings?.saveAsDraftButtonText ?? 'Save as Draft'),
                ),
              ],
              if (config.settings?.cancelButtonText != null) ...[
                const SizedBox(height: 8),
                TextButton(
                  onPressed: state.isLoading ? null : () {
                    Navigator.of(context).pop();
                  },
                  child: Text(config.settings?.cancelButtonText ?? 'Cancel'),
                ),
              ],
            ],
          );
        }
        
        // Normal horizontal layout for wider screens
        return Wrap(
          alignment: WrapAlignment.end,
          spacing: 12,
          runSpacing: 8,
          children: [
            if (config.settings?.cancelButtonText != null)
              TextButton(
                onPressed: state.isLoading ? null : () {
                  Navigator.of(context).pop();
                },
                child: Text(config.settings?.cancelButtonText ?? 'Cancel'),
              ),
            if (enableSaveAsDraft ?? config.settings?.allowSaveAsDraft ?? false)
              TextButton(
                onPressed: state.isLoading ? null : () {
                  context.read<TicketWidgetCubit>().saveAsDraft();
                },
                child: Text(config.settings?.saveAsDraftButtonText ?? 'Save as Draft'),
              ),
            ElevatedButton(
              onPressed: state.canSubmit && !state.isLoading ? () {
                context.read<TicketWidgetCubit>().submitForm();
              } : null,
              child: state.isLoading 
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text(config.settings?.submitButtonText ?? 'Submit'),
            ),
          ],
        );
      },
    );
  }

  /// Build error message display
  Widget _buildErrorMessage(BuildContext context, TicketWidgetState state) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        border: Border.all(color: Colors.red.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.error_outline, color: Colors.red.shade600),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              state.errorMessage!,
              style: TextStyle(color: Colors.red.shade700),
            ),
          ),
        ],
      ),
    );
  }
} 