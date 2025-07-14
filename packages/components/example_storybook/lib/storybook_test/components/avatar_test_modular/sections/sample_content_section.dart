import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import '../utils/avatar_builder.dart';

/// 📝 **Sample Content Section**
///
/// Demonstrates avatar usage with sample content and real-world scenarios

class SampleContentSection extends StatelessWidget {
  final ComponentSize size;
  final ComponentAppearance appearance;
  final String text;
  final IconData selectedIcon;
  final String imageUrl;
  final Color? backgroundColor;
  final Color? borderColor;
  final double borderWidth;
  final double elevation;
  final BorderRadius? borderRadius;
  final bool enableInteraction;
  final bool showHeroAnimation;
  final bool isDark;
  final double spacing;

  const SampleContentSection({
    Key? key,
    required this.size,
    required this.appearance,
    required this.text,
    required this.selectedIcon,
    required this.imageUrl,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth = 0.0,
    this.elevation = 0.0,
    this.borderRadius,
    this.enableInteraction = true,
    this.showHeroAnimation = false,
    this.isDark = false,
    this.spacing = 16.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // User Profile Example
        _buildUserProfileExample(context),
        SizedBox(height: spacing * 2),

        // Team Members Example
        _buildTeamMembersExample(context),
        SizedBox(height: spacing * 2),

        // Chat Avatar Example
        _buildChatAvatarExample(context),
        SizedBox(height: spacing * 2),

        // Status Avatars Example
        _buildStatusAvatarsExample(context),
      ],
    );
  }

  Widget _buildUserProfileExample(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey.shade800 : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? Colors.grey.shade700 : OsmeaColors.silver,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'User Profile Card',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: isDark ? Colors.white : OsmeaColors.nordicBlue,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              AvatarBuilder.buildAvatar(
                size: size,
                appearance: appearance,
                imageUrl: imageUrl,
                backgroundColor: backgroundColor,
                borderColor: borderColor,
                borderWidth: borderWidth,
                elevation: elevation,
                borderRadius: borderRadius,
                onTap: enableInteraction
                    ? () => _showSnackBar(context, 'Profile picture tapped!')
                    : null,
                heroTag: showHeroAnimation ? 'profile_avatar' : null,
                semanticLabel: 'User profile picture',
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'John Doe',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: isDark ? Colors.white : OsmeaColors.nordicBlue,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Senior Designer',
                      style: TextStyle(
                        fontSize: 14,
                        color:
                            isDark ? Colors.grey.shade300 : OsmeaColors.pewter,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Available for new projects',
                      style: TextStyle(
                        fontSize: 12,
                        color: OsmeaColors.forestHeart,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTeamMembersExample(BuildContext context) {
    final teamMembers = AvatarBuilder.getSampleTeamMembers();

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey.shade800 : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? Colors.grey.shade700 : OsmeaColors.silver,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Team Members',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: isDark ? Colors.white : OsmeaColors.nordicBlue,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: spacing,
            runSpacing: spacing,
            children: teamMembers.take(4).map((member) {
              return Column(
                children: [
                  AvatarBuilder.buildAvatar(
                    size: size,
                    appearance: appearance,
                    text: member['initials'],
                    backgroundColor: backgroundColor ?? member['color'],
                    borderColor: borderColor,
                    borderWidth: borderWidth,
                    elevation: elevation,
                    borderRadius: borderRadius,
                    onTap: enableInteraction
                        ? () =>
                            _showSnackBar(context, '${member['name']} selected')
                        : null,
                    semanticLabel: '${member['name']} avatar',
                  ),
                  const SizedBox(height: 8),
                  Text(
                    member['name'],
                    style: TextStyle(
                      fontSize: 12,
                      color: isDark ? Colors.grey.shade300 : OsmeaColors.pewter,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildChatAvatarExample(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey.shade800 : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? Colors.grey.shade700 : OsmeaColors.silver,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Chat Messages',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: isDark ? Colors.white : OsmeaColors.nordicBlue,
            ),
          ),
          const SizedBox(height: 16),
          _buildChatMessage('Alice', 'AB', 'Hey there! How are you doing?',
              OsmeaColors.forestHeart),
          const SizedBox(height: 12),
          _buildChatMessage(
              'Bob',
              'BB',
              'Great! Working on the new design system.',
              OsmeaColors.azureWave),
          const SizedBox(height: 12),
          _buildChatMessage('Charlie', 'CD',
              'Looks amazing! Can\'t wait to see it.', OsmeaColors.sunsetGlow),
        ],
      ),
    );
  }

  Widget _buildChatMessage(
      String name, String initials, String message, Color avatarColor) {
    return Builder(
      builder: (context) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AvatarBuilder.buildAvatar(
            size: ComponentSize.small,
            appearance: appearance,
            text: initials,
            backgroundColor: backgroundColor ?? avatarColor,
            borderColor: borderColor,
            borderWidth: borderWidth * 0.5, // Smaller border for chat
            borderRadius: borderRadius,
            onTap: enableInteraction
                ? () => _showSnackBar(context, '$name profile')
                : null,
            semanticLabel: '$name avatar',
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: isDark ? Colors.white : OsmeaColors.nordicBlue,
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: isDark
                        ? Colors.grey.shade700
                        : OsmeaColors.ash.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    message,
                    style: TextStyle(
                      fontSize: 14,
                      color: isDark ? Colors.grey.shade300 : OsmeaColors.pewter,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusAvatarsExample(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey.shade800 : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? Colors.grey.shade700 : OsmeaColors.silver,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Status Indicators',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: isDark ? Colors.white : OsmeaColors.nordicBlue,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: spacing,
            runSpacing: spacing,
            children: [
              _buildStatusAvatar(
                  'Online', Icons.person, OsmeaColors.forestHeart),
              _buildStatusAvatar('Busy', Icons.work, OsmeaColors.sunsetGlow),
              _buildStatusAvatar(
                  'Away', Icons.schedule, OsmeaColors.amberFlame),
              _buildStatusAvatar(
                  'Offline', Icons.person_outline, OsmeaColors.pewter),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusAvatar(String status, IconData icon, Color statusColor) {
    return Builder(
      builder: (context) => Column(
        children: [
          Stack(
            children: [
              AvatarBuilder.buildAvatar(
                size: size,
                appearance: appearance,
                icon: selectedIcon,
                backgroundColor: backgroundColor,
                borderColor: borderColor,
                borderWidth: borderWidth,
                elevation: elevation,
                borderRadius: borderRadius,
                onTap: enableInteraction
                    ? () => _showSnackBar(context, '$status user')
                    : null,
                semanticLabel: '$status user avatar',
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: AvatarBuilder.getAvatarSize(size) * 0.3,
                  height: AvatarBuilder.getAvatarSize(size) * 0.3,
                  decoration: BoxDecoration(
                    color: statusColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isDark ? Colors.grey.shade800 : Colors.white,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            status,
            style: TextStyle(
              fontSize: 12,
              color: isDark ? Colors.grey.shade300 : OsmeaColors.pewter,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: OsmeaColors.nordicBlue,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
