import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import 'package:go_router/go_router.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

/// 🎯 **OsmeaComponentsAppBar Widget**
///
/// A simple standardized appbar widget with title and back button
/// using consistent white styling from OSMEA components.

class OsmeaComponentsAppBar extends StatefulWidget
    implements PreferredSizeWidget {
  final String screenKey;
  final bool showBackButton;

  const OsmeaComponentsAppBar({
    super.key,
    required this.screenKey,
    this.showBackButton = true,
  });

  @override
  State<OsmeaComponentsAppBar> createState() => _OsmeaComponentsAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _OsmeaComponentsAppBarState extends State<OsmeaComponentsAppBar> {
  String _title = '';

  @override
  void initState() {
    super.initState();
    _loadTitle();
  }

  Future<void> _loadTitle() async {
    try {
      final String jsonString =
          await rootBundle.loadString('assets/screen_titles.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      final screenData = jsonData['screens'][widget.screenKey];

      if (screenData != null && screenData['title'] != null) {
        setState(() {
          _title = screenData['title'];
        });
        print(
            '✅ AppBar Title loaded: $_title for screenKey: ${widget.screenKey}');
      } else {
        print('⚠️ Title not found for screenKey: ${widget.screenKey}');
        setState(() {
          _title = _formatScreenKey(widget.screenKey);
        });
      }
    } catch (e) {
      print('❌ Error loading title for ${widget.screenKey}: $e');
              setState(() {
          _title = _formatScreenKey(widget.screenKey);
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.appBar(
      title: OsmeaComponents.text(
        _title,
        variant: OsmeaTextVariant.headlineMedium,
        color: OsmeaColors.black,
        fontWeight: FontWeight.w600,
      ),
      backgroundColor: OsmeaColors.white,
      foregroundColor: OsmeaColors.black,
      elevation: 0,
      shadowColor: OsmeaColors.transparent,
      surfaceTintColor: OsmeaColors.transparent,
      leading: widget.showBackButton ? _buildBackButton() : null,
      centerTitle: false,
      titleSpacing: 16,
    );
  }

  String _formatScreenKey(String screenKey) {
    return screenKey
        .replaceAll('_', ' ')
        .split(' ')
        .map((word) => word.isNotEmpty ? '${word[0].toUpperCase()}${word.substring(1)}' : '')
        .join(' ');
  }

  Widget _buildBackButton() {
    return OsmeaComponents.container(
      margin: const EdgeInsets.only(left: 8),
      child: OsmeaComponents.button(
        variant: ButtonVariant.ghost,
        size: ButtonSize.small,
        icon: const Icon(Icons.arrow_back_ios_new, size: 20),
        iconPosition: IconPosition.only,
        onPressed: () {
          // Go back to components page with GoRouter
          if (context.canPop()) {
            context.pop();
          } else {
            context.go('/components');
          }
        },
        backgroundColor: OsmeaColors.transparent,
        padding: const EdgeInsets.all(8),
      ),
    );
  }
}
