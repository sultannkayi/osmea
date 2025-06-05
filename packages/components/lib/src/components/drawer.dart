import 'package:flutter/material.dart';
import 'package:osmea_components/src/theme/theme.dart';
import '../theme/component_dimensions.dart';
import 'avatar.dart';

class OsmeaDrawer extends StatelessWidget {
  final String? title;
  final Widget? titleWidget;
  final Widget? header;
  final List<OsmeaDrawerItem> items;
  final int? selectedIndex;
  final Function(int)? onItemSelected;
  final Widget? footer;
  final ThemeType themeType;
  final double? width;
  final bool showBorder;

  const OsmeaDrawer({
    Key? key,
    this.title,
    this.titleWidget,
    this.header,
    required this.items,
    this.selectedIndex,
    this.onItemSelected,
    this.footer,
    required this.themeType,
    this.width = 280,
    this.showBorder = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: OsmeaColors.surface(themeType),
        border: showBorder
            ? Border(
                right: BorderSide(
                  color: OsmeaColors.border(themeType),
                  width: ComponentDimensions.borderThin,
                ),
              )
            : null,
      ),
      child: Drawer(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Title or Header
              if (titleWidget != null)
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: ComponentDimensions.spaceM,
                    vertical: ComponentDimensions.spaceS,
                  ),
                  child: titleWidget!,
                )
              else if (title != null)
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: ComponentDimensions.spaceM,
                    vertical: ComponentDimensions.spaceS,
                  ),
                  child: Text(
                    title!,
                    style: OsmeaTypography.h5(themeType),
                  ),
                )
              else if (header != null)
                header!,

              // Divider after header
              if (title != null || titleWidget != null || header != null)
                Divider(color: OsmeaColors.border(themeType)),

              // Menu Items
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(
                      vertical: ComponentDimensions.spaceXS),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    final isSelected = index == selectedIndex;

                    if (item.isDivider) {
                      return Divider(
                        color: OsmeaColors.border(themeType),
                        height: ComponentDimensions.spaceM,
                        indent: ComponentDimensions.spaceM,
                        endIndent: ComponentDimensions.spaceM,
                      );
                    }

                    if (item.isHeader) {
                      return Padding(
                        padding: EdgeInsets.only(
                          left: ComponentDimensions.spaceM,
                          right: ComponentDimensions.spaceM,
                          top: ComponentDimensions.spaceM,
                          bottom: ComponentDimensions.spaceXS,
                        ),
                        child: Text(
                          item.title!,
                          style: OsmeaTypography.caption(themeType).copyWith(
                            color: OsmeaColors.textSecondary(themeType),
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                      );
                    }

                    return InkWell(
                      onTap: item.onTap ??
                          (onItemSelected != null
                              ? () => onItemSelected!(index)
                              : null),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: ComponentDimensions.spaceM,
                          vertical: ComponentDimensions.spaceS,
                        ),
                        color: isSelected
                            ? OsmeaColors.primary.withOpacity(0.1)
                            : Colors.transparent,
                        child: Row(
                          children: [
                            if (item.icon != null) ...[
                              Icon(
                                item.icon,
                                color: isSelected
                                    ? OsmeaColors.primary
                                    : OsmeaColors.textSecondary(themeType),
                                size: 20,
                              ),
                              SizedBox(width: ComponentDimensions.spaceS),
                            ],
                            Expanded(
                              child: Text(
                                item.title!,
                                style: OsmeaTypography.bodyMedium(themeType)
                                    .medium,
                              ),
                            ),
                            if (item.badge != null) ...[
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: OsmeaColors.primary,
                                  borderRadius: BorderRadius.circular(
                                      ComponentDimensions.radiusCircular),
                                ),
                                child: Text(
                                  item.badge!,
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                            if (item.trailing != null) item.trailing!,
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Footer
              if (footer != null) ...[
                Divider(color: OsmeaColors.border(themeType)),
                footer!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class OsmeaDrawerItem {
  final String? title;
  final IconData? icon;
  final String? badge;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool isDivider;
  final bool isHeader;

  OsmeaDrawerItem({
    this.title,
    this.icon,
    this.badge,
    this.trailing,
    this.onTap,
  })  : isDivider = false,
        isHeader = false;

  OsmeaDrawerItem.divider()
      : title = null,
        icon = null,
        badge = null,
        trailing = null,
        onTap = null,
        isDivider = true,
        isHeader = false;

  OsmeaDrawerItem.header(this.title)
      : icon = null,
        badge = null,
        trailing = null,
        onTap = null,
        isDivider = false,
        isHeader = true;
}

class OsmeaDrawerUserInfo extends StatelessWidget {
  final String name;
  final String? email;
  final String? imageUrl;
  final VoidCallback? onTap;
  final ThemeType themeType;

  const OsmeaDrawerUserInfo({
    Key? key,
    required this.name,
    this.email,
    this.imageUrl,
    this.onTap,
    required this.themeType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(ComponentDimensions.spaceM),
        child: Row(
          children: [
            OsmeaAvatar(
              type: OsmeaAvatarType.image,
              size: OsmeaAvatarSize.medium,
              imageUrl: imageUrl ??
                  'https://ui-avatars.com/api/?name=$name&background=4361EE&color=fff',
              themeType: themeType,
            ),
            SizedBox(width: ComponentDimensions.spaceS),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: OsmeaTypography.bodyMedium(themeType).copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (email != null)
                    Text(
                      email!,
                      style: OsmeaTypography.bodySmall(themeType).copyWith(
                        color: OsmeaColors.textSecondary(themeType),
                      ),
                    ),
                ],
              ),
            ),
            Icon(
              Icons.keyboard_arrow_right,
              color: OsmeaColors.textSecondary(themeType),
            ),
          ],
        ),
      ),
    );
  }
}
