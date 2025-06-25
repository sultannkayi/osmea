import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:osmea_components/osmea_components.dart';
import 'package:osmea_components/src/components/ticket_widget/models/ticket_models.dart';

/// 🎫 **OSMEA Ticket Widget Examples**
///
/// Comprehensive examples demonstrating the dynamic ticket form generation
/// capabilities of the OSMEA Ticket Widget component.
///
/// This file showcases:
/// * 📋 Dynamic form generation from JSON configuration
/// * 📝 All supported input types (text, email, select, etc.)
/// * ✅ Built-in validation and error handling
/// * 💾 Save as draft functionality
/// * 📊 Progress tracking
/// * 🎨 Custom styling and theming options
/// * 🔄 Real-time form state management

class TicketWidgetExample extends StatefulWidget {
  const TicketWidgetExample({super.key});

  @override
  State<TicketWidgetExample> createState() => _TicketWidgetExampleState();
}

class _TicketWidgetExampleState extends State<TicketWidgetExample> {
  TicketFormConfig? _config;
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadTicketFormConfig();
  }

  Future<void> _loadTicketFormConfig() async {
    try {
      final String jsonString = await rootBundle.loadString(
        'assets/ticket_form_example.json',
      );
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      setState(() {
        _config = TicketFormConfig.fromJson(jsonData);
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to load ticket form configuration: $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.scaffold(
      appBar: AppBar(
        title: OsmeaComponents.text(
          '🎫 OSMEA Ticket Widget',
          variant: OsmeaTextVariant.headlineMedium,
        ),
        backgroundColor: OsmeaColors.nordicBlue,
        foregroundColor: OsmeaColors.white,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage != null
              ? _buildErrorView()
              : _buildTicketForm(),
    );
  }

  Widget _buildErrorView() {
    return OsmeaComponents.center(
      child: OsmeaComponents.padding(
        padding: const EdgeInsets.all(24),
        child: OsmeaComponents.column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: OsmeaColors.amberFlame,
            ),
            OsmeaComponents.sizedBox(height: 16),
            OsmeaComponents.text(
              'Error Loading Configuration',
              variant: OsmeaTextVariant.headlineMedium,
            ),
            OsmeaComponents.sizedBox(height: 8),
            OsmeaComponents.text(
              _errorMessage!,
              variant: OsmeaTextVariant.bodyMedium,
              textAlign: TextAlign.center,
            ),
            OsmeaComponents.sizedBox(height: 24),
            OsmeaComponents.button(
              text: 'Retry',
              onPressed: () {
                setState(() {
                  _isLoading = true;
                  _errorMessage = null;
                });
                _loadTicketFormConfig();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTicketForm() {
    if (_config == null) return const SizedBox();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: OsmeaComponents.column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OsmeaComponents.text(
            '📋 Create Support Ticket',
            variant: OsmeaTextVariant.headlineSmall,
          ),
          OsmeaComponents.sizedBox(height: 8),
          OsmeaComponents.text(
            'Fill out the form below to submit a technical support request.',
            variant: OsmeaTextVariant.bodyMedium,
          ),
          OsmeaComponents.sizedBox(height: 24),
          SizedBox(
            height: 600,
            child: OsmeaComponents.ticketWidget(
              config: _config!,
              onSubmit: _handleTicketSubmit,
              onSaveAsDraft: _handleSaveAsDraft,
              onCancel: () => _showSnackBar('Ticket creation cancelled'),
              showProgressIndicator: true,
              enableSaveAsDraft: true,
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> _handleTicketSubmit(TicketResponse response) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      _showSnackBar(
        'Ticket submitted successfully! ID: ${response.ticketId}',
        isSuccess: true,
      );
      return true;
    } catch (e) {
      _showSnackBar('Failed to submit ticket: $e', isError: true);
      return false;
    }
  }

  Future<bool> _handleSaveAsDraft(TicketResponse response) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      _showSnackBar('Ticket saved as draft', isSuccess: true);
      return true;
    } catch (e) {
      _showSnackBar('Failed to save draft: $e', isError: true);
      return false;
    }
  }

  void _showSnackBar(String message,
      {bool isSuccess = false, bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: OsmeaComponents.text(
          message,
          color: OsmeaColors.white,
        ),
        backgroundColor: isError
            ? OsmeaColors.amberFlame
            : isSuccess
                ? OsmeaColors.forestHeart
                : OsmeaColors.nordicBlue,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
