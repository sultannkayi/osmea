import 'package:flutter/material.dart';
import 'package:osmea_components/src/theme/theme.dart';
import '../theme/colors.dart';
import '../theme/component_dimensions.dart';

enum OsmeaAvatarType { image, text, icon }

enum OsmeaAvatarSize { small, medium, large }

class OsmeaAvatar extends StatelessWidget {
  final OsmeaAvatarType type;
  final OsmeaAvatarSize size;
  final String? imageUrl;
  final String? text;
  final IconData? icon;
  final ThemeType themeType;
  final Color? backgroundColor;

  const OsmeaAvatar({
    Key? key,
    required this.type,
    required this.themeType,
    this.size = OsmeaAvatarSize.medium,
    this.imageUrl,
    this.text,
    this.icon,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Determine size
    double diameter;
    double fontSize;
    double iconSize;

    switch (size) {
      case OsmeaAvatarSize.small:
        diameter = 32.0;
        fontSize = 12.0;
        iconSize = 16.0;
        break;
      case OsmeaAvatarSize.large:
        diameter = 64.0;
        fontSize = 24.0;
        iconSize = 32.0;
        break;
      case OsmeaAvatarSize.medium:
      default:
        diameter = 48.0;
        fontSize = 18.0;
        iconSize = 24.0;
        break;
    }

    // Default background color
    final bgColor = backgroundColor ?? OsmeaColors.primary;

    // Build avatar based on type
    Widget avatarContent;

    switch (type) {
      case OsmeaAvatarType.image:
        if (imageUrl == null || imageUrl!.isEmpty) {
          avatarContent = Icon(
            Icons.person,
            size: iconSize,
            color: Colors.white,
          );
        } else {
          avatarContent = ClipRRect(
            borderRadius:
                BorderRadius.circular(ComponentDimensions.radiusCircular),
            child: Image.network(
              imageUrl!,
              width: diameter,
              height: diameter,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  Icons.person,
                  size: iconSize,
                  color: Colors.white,
                );
              },
            ),
          );
        }
        break;

      case OsmeaAvatarType.text:
        avatarContent = Text(
          text ?? '',
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        );
        break;

      case OsmeaAvatarType.icon:
        avatarContent = Icon(
          icon ?? Icons.person,
          size: iconSize,
          color: Colors.white,
        );
        break;
    }

    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(
        color: type == OsmeaAvatarType.image &&
                imageUrl != null &&
                imageUrl!.isNotEmpty
            ? Colors.transparent
            : bgColor,
        borderRadius: BorderRadius.circular(ComponentDimensions.radiusCircular),
      ),
      child: Center(child: avatarContent),
    );
  }
}
