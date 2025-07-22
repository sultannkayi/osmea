import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// 📋 **List Item Builder Utility**
/// 
/// Helper utilities for list item construction and configuration

/// File type data holder
class _FileTypeData {
  const _FileTypeData(this.icon, this.color);
  final IconData icon;
  final Color color;
}

class ListItemBuilder {
  /// Static map for file extension to icon data mapping for better performance
  static const Map<String, _FileTypeData> _fileTypeMap = {
    'pdf': _FileTypeData(Icons.picture_as_pdf, Color(0xFFD32F2F)),
    'doc': _FileTypeData(Icons.description, Color(0xFF1976D2)),
    'docx': _FileTypeData(Icons.description, Color(0xFF1976D2)),
    'xls': _FileTypeData(Icons.table_chart, Color(0xFF388E3C)),
    'xlsx': _FileTypeData(Icons.table_chart, Color(0xFF388E3C)),
    'ppt': _FileTypeData(Icons.slideshow, Color(0xFFF57C00)),
    'pptx': _FileTypeData(Icons.slideshow, Color(0xFFF57C00)),
    'jpg': _FileTypeData(Icons.image, Color(0xFF7B1FA2)),
    'jpeg': _FileTypeData(Icons.image, Color(0xFF7B1FA2)),
    'png': _FileTypeData(Icons.image, Color(0xFF7B1FA2)),
    'gif': _FileTypeData(Icons.image, Color(0xFF7B1FA2)),
    'mp4': _FileTypeData(Icons.video_file, Color(0xFF303F9F)),
    'avi': _FileTypeData(Icons.video_file, Color(0xFF303F9F)),
    'mov': _FileTypeData(Icons.video_file, Color(0xFF303F9F)),
    'mp3': _FileTypeData(Icons.audio_file, Color(0xFF00796B)),
    'wav': _FileTypeData(Icons.audio_file, Color(0xFF00796B)),
    'flac': _FileTypeData(Icons.audio_file, Color(0xFF00796B)),
    'zip': _FileTypeData(Icons.folder_zip, Color(0xFF5D4037)),
    'rar': _FileTypeData(Icons.folder_zip, Color(0xFF5D4037)),
    '7z': _FileTypeData(Icons.folder_zip, Color(0xFF5D4037)),
  };

  /// Default file icon and color for unknown extensions
  static const _FileTypeData _defaultFileType = _FileTypeData(
    Icons.insert_drive_file,
    Color(0xFF757575),
  );
  /// Convert enum to string representation
  static String enumToString(dynamic enumValue) {
    return enumValue.toString().split('.').last;
  }

  /// Format enum names for display
  static String formatEnumName(String enumName) {
    // Convert camelCase to Title Case
    return enumName
        .replaceAllMapped(RegExp(r'([A-Z])'), (match) => ' ${match.group(1)}')
        .trim()
        .split(' ')
        .map((word) => word[0].toUpperCase() + word.substring(1).toLowerCase())
        .join(' ');
  }

  /// Build list item with common parameters
  static Widget buildListItem({
    required ListItemSize size,
    required ListItemVariant variant,
    required ListItemBorderVariant borderVariant,
    required Widget title,
    Widget? subtitle,
    Widget? leading,
    Widget? trailing,
    Widget? child,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    VoidCallback? onDismissed,
    bool selectable = false,
    ListItemSelectedType? selectedType,
    bool? value,
    ValueChanged<bool?>? onChanged,
    bool disabled = false,
    bool error = false,
    int? maxLines,
    EdgeInsets? padding,
    Color? backgroundColor,
    Color? borderColor,
    Border? customBorder,
  }) {
    return OsmeaComponents.listItem(
      size: size,
      variant: variant,
      borderVariant: borderVariant,
      title: title,
      subtitle: subtitle,
      leading: leading,
      trailing: trailing,
      child: child,
      onTap: onTap,
      onLongPress: onLongPress,
      onDismissed: onDismissed != null ? (direction) => onDismissed() : null,
      selectable: selectable,
      selectedType: selectedType ?? ListItemSelectedType.checkbox,
      value: value,
      onChanged: onChanged,
      disabled: disabled,
      error: error,
      maxLines: maxLines ?? 1,
      padding: padding,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      customBorder: customBorder,
    );
  }

  /// Create a sample leading icon
  static Widget createLeadingIcon({
    IconData icon = Icons.folder,
    Color? color,
    double size = 24,
  }) {
    return Icon(
      icon,
      color: color ?? Colors.blue.shade600,
      size: size,
    );
  }

  /// Create a sample leading avatar
  static Widget createLeadingAvatar({
    String text = 'A',
    Color? backgroundColor,
    Color? textColor,
    double radius = 20,
  }) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor ?? Colors.blue.shade100,
      child: Text(
        text,
        style: TextStyle(
          color: textColor ?? Colors.blue.shade800,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  /// Create a sample trailing widget (icon button)
  static Widget createTrailingIcon({
    IconData icon = Icons.chevron_right,
    VoidCallback? onPressed,
    Color? color,
  }) {
    return IconButton(
      icon: Icon(icon),
      onPressed: onPressed ?? () {},
      color: color ?? Colors.grey.shade600,
      iconSize: 20,
      constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
      padding: EdgeInsets.zero,
    );
  }

  /// Create a sample trailing badge
  static Widget createTrailingBadge({
    String text = '99+',
    Color? backgroundColor,
    Color? textColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.red.shade500,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor ?? Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  /// Create sample expanded content
  static Widget createExpandedContent({
    String content = 'This is expanded content that shows additional information about the list item.',
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Text(
        content,
        style: TextStyle(
          color: Colors.grey.shade700,
          fontSize: 14,
        ),
      ),
    );
  }

  /// Create a file type icon based on extension (optimized with static map)
  static Widget createFileIcon(String filename) {
    final extension = filename.split('.').last.toLowerCase();
    final fileTypeData = _fileTypeMap[extension] ?? _defaultFileType;

    return Icon(
      fileTypeData.icon,
      color: fileTypeData.color,
      size: 24,
    );
  }

  /// Get sample titles for different contexts
  static List<String> getSampleTitles(String context) {
    switch (context) {
      case 'files':
        return [
          'Project Proposal.pdf',
          'Meeting Notes.docx',
          'Budget Spreadsheet.xlsx',
          'Presentation.pptx',
          'Photo Album.zip',
        ];
      case 'contacts':
        return [
          'John Doe',
          'Jane Smith',
          'Alex Johnson',
          'Sarah Wilson',
          'Mike Brown',
        ];
      case 'settings':
        return [
          'Account Settings',
          'Privacy & Security',
          'Notifications',
          'Display & Brightness',
          'Storage & Backup',
        ];
      case 'navigation':
        return [
          'Dashboard',
          'Projects',
          'Team Members',
          'Reports',
          'Settings',
        ];
      default:
        return [
          'Item 1',
          'Item 2',
          'Item 3',
          'Item 4',
          'Item 5',
        ];
    }
  }

  /// Get sample subtitles for different contexts
  static List<String> getSampleSubtitles(String context) {
    switch (context) {
      case 'files':
        return [
          '2.4 MB • Modified today',
          '126 KB • Modified yesterday',
          '890 KB • Modified last week',
          '3.2 MB • Modified Mar 15',
          '45 MB • Modified Mar 10',
        ];
      case 'contacts':
        return [
          'john.doe@company.com',
          'jane.smith@company.com',
          'alex.johnson@company.com',
          'sarah.wilson@company.com',
          'mike.brown@company.com',
        ];
      case 'settings':
        return [
          'Manage your account information',
          'Control your privacy settings',
          'Configure app notifications',
          'Adjust screen settings',
          'Manage cloud storage',
        ];
      case 'navigation':
        return [
          'Overview and analytics',
          'Manage your projects',
          'View team information',
          'Generate and view reports',
          'Application preferences',
        ];
      default:
        return [
          'Description for item 1',
          'Description for item 2',
          'Description for item 3',
          'Description for item 4',
          'Description for item 5',
        ];
    }
  }
}
