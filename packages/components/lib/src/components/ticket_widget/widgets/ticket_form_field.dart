/// 🎫 **OSMEA Ticket Form Field**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components
///
/// Dynamic form field widget for ticket forms.
/// Renders different input types based on question configuration.
///
/// {@category Components}
/// {@subCategory Ticket}

import 'package:flutter/material.dart';
import 'package:osmea_components/src/components/ticket_widget/models/ticket_models.dart';
import 'package:osmea_components/src/enums/ticket_enums.dart';
import 'package:osmea_components/src/theme/theme.dart';

/// 📝 **Ticket Form Field**
///
/// Dynamic form field that renders appropriate input widget based on question type.
/// Supports all question types defined in QuestionType enum.
///
class TicketFormField extends StatelessWidget {
  const TicketFormField({
    super.key,
    required this.question,
    required this.value,
    required this.onChanged,
    this.errorText,
    this.theme,
  });

  final TicketQuestion question;
  final dynamic value;
  final ValueChanged<dynamic> onChanged;
  final String? errorText;
  final CoreTheme? theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        RichText(
          text: TextSpan(
            text: question.label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
            children: [
              if (question.isRequired)
                const TextSpan(
                  text: ' *',
                  style: TextStyle(color: Colors.red),
                ),
            ],
          ),
        ),

        if (question.helperText != null) ...[
          const SizedBox(height: 4),
          Text(
            question.helperText!,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
        ],

        const SizedBox(height: 8),

        // Input Widget
        _buildInputWidget(),

        // Error Text
        if (errorText != null) ...[
          const SizedBox(height: 4),
          Text(
            errorText!,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.red,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildInputWidget() {
    switch (question.type) {
      case QuestionType.textField:
        return _buildTextField();
      case QuestionType.textArea:
        return _buildTextArea();
      case QuestionType.singleSelect:
        return _buildSingleSelect();
      case QuestionType.multiSelect:
        return _buildMultiSelect();
      case QuestionType.radioButton:
        return _buildRadioButtons();
      case QuestionType.checkbox:
        return _buildCheckbox();
      case QuestionType.email:
        return _buildEmailField();
      case QuestionType.phone:
        return _buildPhoneField();
      case QuestionType.number:
        return _buildNumberField();
      case QuestionType.dateTime:
        return _buildDateTimeField();
      case QuestionType.file:
        return _buildFileField();
      case QuestionType.rating:
        return _buildRatingField();
      case QuestionType.url:
        return _buildUrlField();
    }
  }

  Widget _buildTextField() {
    return TextFormField(
      initialValue: value?.toString() ?? '',
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: question.hint,
        border: const OutlineInputBorder(),
        errorText: errorText,
      ),
    );
  }

  Widget _buildTextArea() {
    return TextFormField(
      initialValue: value?.toString() ?? '',
      onChanged: onChanged,
      maxLines: 5,
      decoration: InputDecoration(
        hintText: question.hint,
        border: const OutlineInputBorder(),
        errorText: errorText,
      ),
    );
  }

  Widget _buildSingleSelect() {
    return DropdownButtonFormField<String>(
      value: value?.toString(),
      onChanged: (newValue) => onChanged(newValue),
      isExpanded: true, // This ensures the dropdown takes available width
      decoration: InputDecoration(
        hintText: question.hint,
        border: const OutlineInputBorder(),
        errorText: errorText,
      ),
      items: question.options?.map((option) {
            return DropdownMenuItem<String>(
              value: option.value.toString(),
              child: Text(
                option.label,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            );
          }).toList() ??
          [],
    );
  }

  Widget _buildMultiSelect() {
    final selectedValues = (value as List<String>?) ?? [];

    return Container(
      constraints: const BoxConstraints(maxHeight: 200), // Prevent overflow
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: question.options?.map((option) {
                final isSelected =
                    selectedValues.contains(option.value.toString());
                return CheckboxListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                  dense: true,
                  title: Text(
                    option.label,
                    style: const TextStyle(fontSize: 14),
                  ),
                  subtitle: option.description != null
                      ? Text(
                          option.description!,
                          style: const TextStyle(fontSize: 12),
                        )
                      : null,
                  value: isSelected,
                  onChanged: (checked) {
                    final newValues = List<String>.from(selectedValues);
                    if (checked == true) {
                      newValues.add(option.value.toString());
                    } else {
                      newValues.remove(option.value.toString());
                    }
                    onChanged(newValues);
                  },
                );
              }).toList() ??
              [],
        ),
      ),
    );
  }

  Widget _buildRadioButtons() {
    return Container(
      constraints: const BoxConstraints(maxHeight: 200), // Prevent overflow
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: question.options?.map((option) {
                return RadioListTile<String>(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                  dense: true,
                  title: Text(
                    option.label,
                    style: const TextStyle(fontSize: 14),
                  ),
                  subtitle: option.description != null
                      ? Text(
                          option.description!,
                            style: const TextStyle(fontSize: 12),
                        )
                      : null,
                  value: option.value.toString(),
                  groupValue: value?.toString(),
                  onChanged: onChanged,
                );
              }).toList() ??
              [],
        ),
      ),
    );
  }

  Widget _buildCheckbox() {
    return CheckboxListTile(
      title: Text(question.label),
      value: value as bool? ?? false,
      onChanged: onChanged,
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      initialValue: value?.toString() ?? '',
      onChanged: onChanged,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: question.hint ?? 'Enter email address',
        border: const OutlineInputBorder(),
        errorText: errorText,
        prefixIcon: const Icon(Icons.email),
      ),
    );
  }

  Widget _buildPhoneField() {
    return TextFormField(
      initialValue: value?.toString() ?? '',
      onChanged: onChanged,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        hintText: question.hint ?? 'Enter phone number',
        border: const OutlineInputBorder(),
        errorText: errorText,
        prefixIcon: const Icon(Icons.phone),
      ),
    );
  }

  Widget _buildNumberField() {
    return TextFormField(
      initialValue: value?.toString() ?? '',
      onChanged: onChanged,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: question.hint ?? 'Enter number',
        border: const OutlineInputBorder(),
        errorText: errorText,
      ),
    );
  }

  Widget _buildDateTimeField() {
    return Builder(
      builder: (context) => GestureDetector(
        onTap: () async {
          final date = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
          );
          if (date != null) {
            onChanged(date.toIso8601String());
          }
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            children: [
              const Icon(Icons.calendar_today),
              const SizedBox(width: 8),
              Text(
                value != null ? value.toString().split('T')[0] : 'Select date',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFileField() {
    return Container(
      padding:const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(4),
      ),
      child: const Row(
        children: [
           Icon(Icons.attach_file),
           SizedBox(width: 8),
          Text('File upload - Not implemented yet'),
        ],
      ),
    );
  }

  Widget _buildRatingField() {
    final rating = (value as int?) ?? 0;

    return Row(
      children: List.generate(5, (index) {
        return IconButton(
          onPressed: () => onChanged(index + 1),
          icon: Icon(
            index < rating ? Icons.star : Icons.star_border,
            color: Colors.amber,
          ),
        );
      }),
    );
  }

  Widget _buildUrlField() {
    return TextFormField(
      initialValue: value?.toString() ?? '',
      onChanged: onChanged,
      keyboardType: TextInputType.url,
      decoration: InputDecoration(
        hintText: question.hint ?? 'Enter URL',
        border: const OutlineInputBorder(),
        errorText: errorText,
        prefixIcon: const Icon(Icons.link),
      ),
    );
  }
}
