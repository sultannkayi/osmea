import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// 📊 **Avatar Data Constants**
/// 
/// Predefined data for avatar examples and demonstrations

class AvatarData {
  // Sample team member data
  static const List<Map<String, dynamic>> teamMembers = [
    {
      'name': 'Alice Johnson',
      'initials': 'AJ',
      'role': 'UI Designer',
      'imageUrl': 'https://picsum.photos/200/200?random=1',
    },
    {
      'name': 'Bob Smith',
      'initials': 'BS',
      'role': 'Developer',
      'imageUrl': 'https://picsum.photos/200/200?random=2',
    },
    {
      'name': 'Carol Brown',
      'initials': 'CB',
      'role': 'Product Manager',
      'imageUrl': 'https://picsum.photos/200/200?random=3',
    },
    {
      'name': 'David Wilson',
      'initials': 'DW',
      'role': 'UX Researcher',
      'imageUrl': 'https://picsum.photos/200/200?random=4',
    },
    {
      'name': 'Emma Davis',
      'initials': 'ED',
      'role': 'Marketing',
      'imageUrl': 'https://picsum.photos/200/200?random=5',
    },
  ];

  // Sample image URLs
  static const List<String> sampleImageUrls = [
    'https://picsum.photos/200/200?random=1',
    'https://picsum.photos/200/200?random=2',
    'https://picsum.photos/200/200?random=3',
    'https://picsum.photos/200/200?random=4',
    'https://picsum.photos/200/200?random=5',
    'https://picsum.photos/200/200?random=6',
    'https://picsum.photos/200/200?random=7',
    'https://picsum.photos/200/200?random=8',
  ];

  // Sample initials
  static const List<String> sampleInitials = [
    'AB', 'CD', 'EF', 'GH', 'IJ', 'KL', 'MN', 'OP', 'QR', 'ST',
    'UV', 'WX', 'YZ', 'AC', 'BD', 'CE', 'DF', 'EG', 'FH', 'GI',
  ];

  // Sample chat messages
  static const List<Map<String, String>> chatMessages = [
    {
      'sender': 'Alice',
      'initials': 'AJ',
      'message': 'Hey everyone! How is the new design system coming along?',
    },
    {
      'sender': 'Bob',
      'initials': 'BS',
      'message': 'Great progress! The avatar component is looking fantastic.',
    },
    {
      'sender': 'Carol',
      'initials': 'CB',
      'message': 'Love the new interactive features. Very smooth!',
    },
    {
      'sender': 'David',
      'initials': 'DW',
      'message': 'The accessibility improvements are excellent too.',
    },
  ];

  // Status types for status avatars
  static final List<Map<String, dynamic>> statusTypes = [
    {
      'status': 'Online',
      'color': OsmeaColors.forestHeart,
      'icon': Icons.circle,
    },
    {
      'status': 'Busy',
      'color': OsmeaColors.sunsetGlow,
      'icon': Icons.do_not_disturb,
    },
    {
      'status': 'Away',
      'color': OsmeaColors.amberFlame,
      'icon': Icons.schedule,
    },
    {
      'status': 'Offline',
      'color': OsmeaColors.pewter,
      'icon': Icons.offline_bolt,
    },
  ];

  // Icon options for avatar demonstrations
  static const List<Map<String, dynamic>> iconOptions = [
    {'icon': Icons.person, 'label': 'Person'},
    {'icon': Icons.business, 'label': 'Business'},
    {'icon': Icons.star, 'label': 'Star'},
    {'icon': Icons.favorite, 'label': 'Favorite'},
    {'icon': Icons.pets, 'label': 'Pets'},
    {'icon': Icons.music_note, 'label': 'Music'},
    {'icon': Icons.camera_alt, 'label': 'Camera'},
    {'icon': Icons.settings, 'label': 'Settings'},
    {'icon': Icons.home, 'label': 'Home'},
    {'icon': Icons.verified, 'label': 'Verified'},
    {'icon': Icons.work, 'label': 'Work'},
    {'icon': Icons.school, 'label': 'School'},
  ];
}
