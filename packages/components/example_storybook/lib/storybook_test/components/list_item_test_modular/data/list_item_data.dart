import 'package:flutter/material.dart';

/// 📋 **List Item Data**
/// 
/// Sample data and constants for list item examples

class ListItemData {
  /// Sample list item titles for demonstrations
  static const List<String> sampleTitles = [
    'Documents',
    'Downloads',
    'Photos',
    'Music',
    'Videos',
    'Applications',
    'Desktop',
    'System Preferences',
    'Recently Used',
    'Favorites',
    'Shared Files',
    'Cloud Storage',
  ];

  /// Sample subtitles and descriptions
  static const List<String> sampleSubtitles = [
    'Contains all your documents',
    '25 files, updated 2 hours ago',
    '1,234 photos, 5.2 GB',
    'Playlist with 120 songs',
    'Home movies and tutorials',
    'Installed software',
    'Files on your desktop',
    'System configuration',
    'Last accessed items',
    'Your starred items',
    'Files shared with others',
    'Synced to the cloud',
  ];

  /// Sample icons for different item types
  static const List<IconData> sampleIcons = [
    Icons.folder,
    Icons.download,
    Icons.photo_library,
    Icons.music_note,
    Icons.video_library,
    Icons.apps,
    Icons.desktop_mac,
    Icons.settings,
    Icons.access_time,
    Icons.favorite,
    Icons.share,
    Icons.cloud,
  ];

  /// Sample trailing icons for actions
  static const List<IconData> trailingIcons = [
    Icons.chevron_right,
    Icons.more_vert,
    Icons.info_outline,
    Icons.edit,
    Icons.delete,
    Icons.download,
    Icons.share,
    Icons.favorite_border,
  ];

  /// Sample badge counts for notifications
  static const List<int> sampleBadgeCounts = [
    1, 3, 5, 12, 25, 99, 150, 999,
  ];

  /// Sample file sizes for display
  static const List<String> fileSizes = [
    '1.2 MB',
    '45.6 KB',
    '3.4 GB',
    '890 MB',
    '12.1 KB',
    '567 MB',
    '2.8 GB',
    '78 KB',
  ];

  /// Sample timestamps
  static const List<String> timestamps = [
    'Just now',
    '5 minutes ago',
    '1 hour ago',
    'Yesterday',
    '2 days ago',
    'Last week',
    'Last month',
    'Long time ago',
  ];

  /// Sample user names for shared items
  static const List<String> userNames = [
    'John Doe',
    'Jane Smith',
    'Alex Johnson',
    'Sarah Wilson',
    'Mike Brown',
    'Emily Davis',
    'Chris Lee',
    'Lisa Wang',
  ];

  /// Color combinations for custom list items
  static final List<Map<String, Color>> colorCombinations = [
    {
      'background': Colors.blue.shade50,
      'text': Colors.blue.shade800,
      'border': Colors.blue.shade200,
    },
    {
      'background': Colors.green.shade50,
      'text': Colors.green.shade800,
      'border': Colors.green.shade200,
    },
    {
      'background': Colors.orange.shade50,
      'text': Colors.orange.shade800,
      'border': Colors.orange.shade200,
    },
    {
      'background': Colors.purple.shade50,
      'text': Colors.purple.shade800,
      'border': Colors.purple.shade200,
    },
  ];

  /// Sample notification data
  static final List<Map<String, dynamic>> notificationItems = [
    {
      'title': 'New message from John',
      'subtitle': 'Hey, how are you doing?',
      'icon': Icons.message,
      'time': '2 min ago',
      'unread': true,
    },
    {
      'title': 'Photo sync completed',
      'subtitle': '25 photos uploaded to cloud',
      'icon': Icons.cloud_done,
      'time': '1 hour ago',
      'unread': false,
    },
    {
      'title': 'System update available',
      'subtitle': 'Update to version 2.1.3',
      'icon': Icons.system_update,
      'time': '3 hours ago',
      'unread': true,
    },
  ];

  /// Sample file data with rich information
  static final List<Map<String, dynamic>> fileItems = [
    {
      'name': 'Project Proposal.pdf',
      'size': '2.4 MB',
      'modified': 'Today, 3:45 PM',
      'icon': Icons.picture_as_pdf,
      'type': 'PDF Document',
    },
    {
      'name': 'Meeting Notes.docx',
      'size': '126 KB',
      'modified': 'Yesterday, 10:30 AM',
      'icon': Icons.description,
      'type': 'Word Document',
    },
    {
      'name': 'Budget Spreadsheet.xlsx',
      'size': '890 KB',
      'modified': 'Mar 15, 2024',
      'icon': Icons.table_chart,
      'type': 'Excel Spreadsheet',
    },
  ];
}
