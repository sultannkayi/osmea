import 'package:apis/services/store_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:apis/apis.dart';
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
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: colorScheme.outline.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(colorScheme.primary),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'Loading...',
              style: TextStyle(
                fontSize: 12,
                color: colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      );
    }

    if (_storeProfile == null) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: colorScheme.outline.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.store_outlined,
              size: 16,
              color: colorScheme.outline,
            ),
            const SizedBox(width: 6),
            Text(
              'No Store',
              style: TextStyle(
                fontSize: 12,
                color: colorScheme.outline,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 4),
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

    return Container(
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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Platform Icon
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: platformColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              profile['icon'],
              style: const TextStyle(fontSize: 14),
            ),
          ),
          const SizedBox(width: 10),

          // Store Info
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                profile['name'] ?? 'Unknown Store',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onSurface,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                profile['platformDisplayName'] ?? 'Unknown',
                style: TextStyle(
                  fontSize: 11,
                  color: colorScheme.onSurface.withValues(alpha: 0.7),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          const SizedBox(width: 10),

          // Status Indicator
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: (profile['status'] ?? 'Unknown') == 'Active'
                  ? Colors.green.withValues(alpha: 0.15)
                  : Colors.orange.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: (profile['status'] ?? 'Unknown') == 'Active'
                    ? Colors.green.withValues(alpha: 0.3)
                    : Colors.orange.withValues(alpha: 0.3),
                width: 1,
              ),
            ),
            child: Text(
              profile['status'] ?? 'Unknown',
              style: TextStyle(
                fontSize: 10,
                color: (profile['status'] ?? 'Unknown') == 'Active'
                    ? Colors.green
                    : Colors.orange,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          const SizedBox(width: 8),

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
                child: Row(
                  children: [
                    Icon(Icons.refresh, size: 16),
                    const SizedBox(width: 8),
                    const Text('Refresh'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'change',
                child: Row(
                  children: [
                    Icon(Icons.swap_horiz, size: 16),
                    const SizedBox(width: 8),
                    const Text('Change Store'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'profile',
                child: Row(
                  children: [
                    Icon(Icons.person, size: 16),
                    const SizedBox(width: 8),
                    const Text('Store Profile'),
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
