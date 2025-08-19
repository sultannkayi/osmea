import 'package:apis/services/store_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:apis/apis.dart';
import 'package:core/core.dart';
import 'dart:async';

/// Widget that displays current store profile information
class StoreProfileWidget extends StatefulWidget {
  final VoidCallback? onProfileTap;
  final VoidCallback? onStoreChange;

  const StoreProfileWidget({
    super.key,
    this.onProfileTap,
    this.onStoreChange,
  });

  @override
  State<StoreProfileWidget> createState() => _StoreProfileWidgetState();
}

class _StoreProfileWidgetState extends State<StoreProfileWidget> {
  Map<String, dynamic>? _storeProfile;
  bool _isLoading = true;
  StreamSubscription<StoreChangeEvent>? _storeChangeSubscription;

  @override
  void initState() {
    super.initState();
    _loadStoreProfile();
    _listenToStoreChanges();
  }

  @override
  void dispose() {
    _storeChangeSubscription?.cancel();
    super.dispose();
  }

  void _listenToStoreChanges() {
    try {
      _storeChangeSubscription = WizardHelper.storeChangeStream.listen(
        (event) {
          debugPrint('🔄 Store change detected: ${event.type}');
          _loadStoreProfile();
        },
        onError: (error) {
          debugPrint('❌ Error listening to store changes: $error');
        },
      );
    } catch (e) {
      debugPrint('❌ Error setting up store change listener: $e');
    }
  }

  Future<void> _loadStoreProfile() async {
    try {
      setState(() {
        _isLoading = true;
      });

      final profile = await WizardHelper.getStoreProfile();

      if (mounted) {
        setState(() {
          _storeProfile = profile;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _refreshProfile() {
    _loadStoreProfile();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    if (_isLoading) {
      return OsmeaComponents.container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: colorScheme.outline.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
        child: OsmeaComponents.row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor:
                    AlwaysStoppedAnimation<Color>(OsmeaColors.nordicBlue),
              ),
            ),
            OsmeaComponents.sizedBox(width: 8),
            OsmeaComponents.text(
              'Loading...',
              textStyle: OsmeaTextStyle.bodySmall(context).copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      );
    }

    if (_storeProfile == null) {
      return OsmeaComponents.container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: colorScheme.outline.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: OsmeaComponents.row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.store_outlined,
              size: 16,
              color: colorScheme.outline,
            ),
            OsmeaComponents.sizedBox(width: 6),
            OsmeaComponents.text(
              'No Store',
              textStyle: OsmeaTextStyle.bodySmall(context).copyWith(
                color: colorScheme.outline,
                fontWeight: FontWeight.w500,
              ),
            ),
            OsmeaComponents.sizedBox(width: 4),
            IconButton(
              onPressed: _refreshProfile,
              icon: Icon(
                Icons.refresh,
                size: 14,
                color: colorScheme.outline,
              ),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(
                minWidth: 20,
                minHeight: 20,
              ),
              tooltip: 'Refresh store info',
            ),
          ],
        ),
      );
    }

    final profile = _storeProfile!;
    final platformColor =
        Color(int.parse(profile['color'].replaceAll('#', '0xFF')));

    return OsmeaComponents.container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: platformColor.withValues(alpha: 0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: platformColor.withValues(alpha: 0.1),
            offset: const Offset(0, 2),
            blurRadius: 8,
          ),
        ],
      ),
      child: OsmeaComponents.row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Platform Icon
          OsmeaComponents.container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: platformColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: OsmeaComponents.text(
              profile['icon'],
              textStyle: OsmeaTextStyle.bodySmall(context).copyWith(
                fontSize: 14,
              ),
            ),
          ),
          OsmeaComponents.sizedBox(width: 10),

          // Store Info
          OsmeaComponents.column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              OsmeaComponents.text(
                profile['name'] ?? 'Unknown Store',
                textStyle: OsmeaTextStyle.bodyMedium(context).copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onSurface,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              OsmeaComponents.text(
                profile['platformDisplayName'] ?? 'Unknown',
                textStyle: OsmeaTextStyle.bodySmall(context).copyWith(
                  fontSize: 11,
                  color: colorScheme.onSurface.withValues(alpha: 0.7),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          OsmeaComponents.sizedBox(width: 10),

          // Status Indicator
          OsmeaComponents.container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: (profile['status'] ?? 'Unknown') == 'Active'
                  ? OsmeaColors.forestHeart.withValues(alpha: 0.15)
                  : OsmeaColors.amberFlame.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: (profile['status'] ?? 'Unknown') == 'Active'
                    ? OsmeaColors.forestHeart.withValues(alpha: 0.3)
                    : OsmeaColors.amberFlame.withValues(alpha: 0.3),
                width: 1,
              ),
            ),
            child: OsmeaComponents.text(
              profile['status'] ?? 'Unknown',
              textStyle: OsmeaTextStyle.captionSmall(context).copyWith(
                fontSize: 10,
                color: (profile['status'] ?? 'Unknown') == 'Active'
                    ? OsmeaColors.forestHeart
                    : OsmeaColors.amberFlame,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          OsmeaComponents.sizedBox(width: 8),

          // Actions
          PopupMenuButton<String>(
            icon: Icon(
              Icons.more_vert,
              size: 18,
              color: colorScheme.onSurface.withValues(alpha: 0.7),
            ),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(
              minWidth: 24,
              minHeight: 24,
            ),
            tooltip: 'Store actions',
            onSelected: (value) {
              switch (value) {
                case 'refresh':
                  _refreshProfile();
                  break;
                case 'change':
                  widget.onStoreChange?.call();
                  break;
                case 'profile':
                  widget.onProfileTap?.call();
                  break;
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'refresh',
                child: OsmeaComponents.row(
                  children: [
                    Icon(Icons.refresh, size: 16),
                    OsmeaComponents.sizedBox(width: 8),
                    OsmeaComponents.text(
                      'Refresh',
                      textStyle: OsmeaTextStyle.bodyMedium(context),
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'change',
                child: OsmeaComponents.row(
                  children: [
                    Icon(Icons.swap_horiz, size: 16),
                    OsmeaComponents.sizedBox(width: 8),
                    OsmeaComponents.text(
                      'Change Store',
                      textStyle: OsmeaTextStyle.bodyMedium(context),
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'profile',
                child: OsmeaComponents.row(
                  children: [
                    Icon(Icons.person, size: 16),
                    OsmeaComponents.sizedBox(width: 8),
                    OsmeaComponents.text(
                      'Store Profile',
                      textStyle: OsmeaTextStyle.bodyMedium(context),
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
}
