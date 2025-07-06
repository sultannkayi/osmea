// @dart=3.0
/// 🟦 OSMEA Snackbar Component
///
/// Snackbar notification system for OSMEA UI Kit.
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea
import 'package:flutter/material.dart';
import 'package:osmea_components/src/components/align/align.dart';
import 'package:osmea_components/src/components/column/column.dart';
import 'package:osmea_components/src/components/container/container.dart';
import 'package:osmea_components/src/components/padding/padding.dart';
import 'package:osmea_components/src/components/stack/stack.dart';
import 'package:osmea_components/src/components/text/text.dart';
import 'package:osmea_components/src/enums/snackbar_enums.dart';
import 'package:osmea_components/src/styles/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osmea_components/src/components/snackbar/cubit/snackbar_cubit.dart';
import 'package:osmea_components/src/components/snackbar/cubit/snackbar_state.dart';
import 'dart:async';
import 'dart:ui';
import 'package:osmea_components/src/components/buttons/button.dart';
import 'package:osmea_components/src/components/progress/progress.dart';
import 'package:osmea_components/src/enums/button_enums.dart';
import 'package:osmea_components/src/enums/progress_enums.dart';
import 'dart:math' as math;

/// Global snackbar overlay handler that manages snackbar positioning and display
class GlobalSnackbarOverlay {
  static final GlobalSnackbarOverlay _instance =
      GlobalSnackbarOverlay._internal();
  factory GlobalSnackbarOverlay() => _instance;
  GlobalSnackbarOverlay._internal();
  OverlayEntry? _overlayEntry;
  bool _isShown = false;
  void ensureOverlay(BuildContext context) {
    if (_isShown && _overlayEntry != null) return;
    _overlayEntry = OverlayEntry(
      builder: (_) => const _SnackbarOverlayWidget(),
    );
    Overlay.of(context, rootOverlay: true).insert(_overlayEntry!);
    _isShown = true;
  }
}

class _SnackbarOverlayWidget extends StatelessWidget {
  const _SnackbarOverlayWidget();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SnackbarCubit, List<SnackbarState>>(
      bloc: SnackbarCubit.instance,
      builder: (context, snackbars) {
        if (snackbars.isEmpty) return const SizedBox.shrink();
        final Map<SnackbarPosition, List<SnackbarState>> grouped = {
          SnackbarPosition.top: [],
          SnackbarPosition.center: [],
          SnackbarPosition.bottom: [],
        };
        for (final snackbar in snackbars) {
          if (snackbar.visible) {
            grouped[snackbar.position]!.add(snackbar);
          }
        }
        for (final position in SnackbarPosition.values) {
          grouped[position]!.sort((a, b) => a.createdAt.compareTo(b.createdAt));
        }
        return OsmeaStack(
          fit: StackFit.expand,
          children: [
            if (grouped[SnackbarPosition.top]!.isNotEmpty)
              _PositionedSnackbarGroup(
                position: SnackbarPosition.top,
                snackbars: grouped[SnackbarPosition.top]!,
              ),
            if (grouped[SnackbarPosition.center]!.isNotEmpty)
              _PositionedSnackbarGroup(
                position: SnackbarPosition.center,
                snackbars: grouped[SnackbarPosition.center]!,
              ),
            if (grouped[SnackbarPosition.bottom]!.isNotEmpty)
              _PositionedSnackbarGroup(
                position: SnackbarPosition.bottom,
                snackbars: grouped[SnackbarPosition.bottom]!,
              ),
          ],
        );
      },
    );
  }
}

class _PositionedSnackbarGroup extends StatelessWidget {
  final SnackbarPosition position;
  final List<SnackbarState> snackbars;
  const _PositionedSnackbarGroup(
      {required this.position, required this.snackbars});
  @override
  Widget build(BuildContext context) {
    final List<SnackbarState> displaySnackbars =
        position == SnackbarPosition.bottom
            ? snackbars.reversed.toList()
            : snackbars;
    if (position != SnackbarPosition.bottom) return const SizedBox.shrink();
    return Align(
      alignment: Alignment.bottomCenter,
      child: SafeArea(
        bottom: true,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: math.max(MediaQuery.of(context).viewPadding.bottom, 12),
          ),
          child: ClipRect(
            child: OsmeaColumn(
              mainAxisSize: MainAxisSize.min,
              children: displaySnackbars
                  .map((snackbar) => OsmeaSnackbar(
                        key: ValueKey(snackbar.id),
                        state: snackbar,
                        onClose: () =>
                            SnackbarManager().hideSnackbar(snackbar.id),
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class OsmeaSnackbar extends StatefulWidget {
  final SnackbarState state;
  final VoidCallback? onClose;
  const OsmeaSnackbar({Key? key, required this.state, this.onClose})
      : super(key: key);

  @override
  State<OsmeaSnackbar> createState() => _OsmeaSnackbarState();
}

class _OsmeaSnackbarState extends State<OsmeaSnackbar>
    with TickerProviderStateMixin {
  late AnimationController _slideController;
  late AnimationController _progressController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _progressAnimation;
  bool _isDismissed = false;

  @override
  void initState() {
    super.initState();
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _progressController = AnimationController(
      duration: widget.state.duration,
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOutCubic,
    ));

    _progressAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(_progressController);

    _slideController.forward();
    _progressController.forward();
  }

  @override
  void dispose() {
    _slideController.dispose();
    _progressController.dispose();
    super.dispose();
  }

  void _dismiss() {
    if (_isDismissed) return;
    _isDismissed = true;
    _slideController.reverse().then((_) {
      widget.onClose?.call();
    });
  }

  Color _typeColor() {
    switch (widget.state.type) {
      case SnackbarType.success:
        return OsmeaColors.forestHeart;
      case SnackbarType.error:
        return OsmeaColors.amberFlame;
      case SnackbarType.warning:
        return OsmeaColors.sunsetGlow;
      case SnackbarType.info:
        return OsmeaColors.nordicBlue;
    }
  }

  IconData _iconData() {
    switch (widget.state.type) {
      case SnackbarType.success:
        return Icons.check_circle_outline;
      case SnackbarType.error:
        return Icons.error_outline;
      case SnackbarType.warning:
        return Icons.warning_amber_outlined;
      case SnackbarType.info:
        return Icons.info_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.state.visible) return const SizedBox.shrink();

    // Farklı visualStyle'lara göre farklı tasarımlar uygula
    switch (widget.state.visualStyle) {
      case SnackbarVisualStyle.modern:
        return _buildModernSnackbar(context);
      case SnackbarVisualStyle.glass:
        return _buildGlassSnackbar(context);
      case SnackbarVisualStyle.circle:
        return _buildCircleSnackbar(context);
      case SnackbarVisualStyle.patterned:
        return _buildPatternedSnackbar(context);
      case SnackbarVisualStyle.glow:
        return _buildGlowSnackbar(context);
      case SnackbarVisualStyle.classic:
        return _buildClassicSnackbar(context);
    }
  }

  Widget _buildClassicSnackbar(BuildContext context) {
    return _buildDismissibleWrapper(
      context,
      child: OsmeaContainer(
        decoration: BoxDecoration(
          color: _typeColor(),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: _buildContent(context, showProgress: true, useGlass: false),
      ),
    );
  }

  Widget _buildModernSnackbar(BuildContext context) {
    return _buildDismissibleWrapper(
      context,
      child: OsmeaContainer(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              _typeColor().withOpacity(0.95),
              _typeColor().withOpacity(0.7),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: _typeColor().withOpacity(0.25),
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: _buildContent(context,
            showProgress: true, useGlass: false, modern: true),
      ),
    );
  }

  Widget _buildGlassSnackbar(BuildContext context) {
    return _buildDismissibleWrapper(
      context,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
          child: OsmeaContainer(
            decoration: BoxDecoration(
              color: _typeColor().withOpacity(0.35),
              borderRadius: BorderRadius.circular(18),
              border:
                  Border.all(color: Colors.white.withOpacity(0.25), width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: _typeColor().withOpacity(0.18),
                  blurRadius: 32,
                  offset: const Offset(0, 12),
                ),
              ],
            ),
            child: _buildContent(context, showProgress: true, useGlass: true),
          ),
        ),
      ),
    );
  }

  Widget _buildCircleSnackbar(BuildContext context) {
    return _buildDismissibleWrapper(
      context,
      child: OsmeaContainer(
        width: 88,
        height: 88,
        decoration: BoxDecoration(
          color: _typeColor(),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: _typeColor().withOpacity(0.25),
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(_iconData(), color: Colors.white, size: 32),
              const SizedBox(height: 8),
              OsmeaText(
                widget.state.message,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              if (widget.state.actionLabel != null)
                OsmeaTextButton(
                  text: widget.state.actionLabel!,
                  onPressed: () {
                    widget.state.onAction?.call();
                    _dismiss();
                  },
                  variant: ButtonVariant.ghost,
                  size: ButtonSize.small,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPatternedSnackbar(BuildContext context) {
    return _buildDismissibleWrapper(
      context,
      child: OsmeaContainer(
        decoration: BoxDecoration(
          color: _typeColor().withOpacity(0.95),
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: _typeColor().withOpacity(0.18),
              blurRadius: 32,
              offset: const Offset(0, 12),
            ),
          ],
          image: const DecorationImage(
            image: AssetImage('assets/pattern.png'),
            fit: BoxFit.cover,
            opacity: 0.08,
          ),
        ),
        child: _buildContent(context, showProgress: true, useGlass: false),
      ),
    );
  }

  Widget _buildGlowSnackbar(BuildContext context) {
    return _buildDismissibleWrapper(
      context,
      child: OsmeaContainer(
        decoration: BoxDecoration(
          color: _typeColor().withOpacity(0.92),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: _typeColor().withOpacity(0.7),
              blurRadius: 32,
              spreadRadius: 4,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: _buildContent(context,
            showProgress: true, useGlass: false, glow: true),
      ),
    );
  }

  Widget _buildDismissibleWrapper(BuildContext context,
      {required Widget child}) {
    return SlideTransition(
      position: _slideAnimation,
      child: Dismissible(
        key: Key(widget.state.id),
        direction: DismissDirection.horizontal,
        onDismissed: (_) => _dismiss(),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          constraints: const BoxConstraints(maxWidth: 600),
          width: double.infinity,
          child: child,
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context,
      {bool showProgress = true,
      bool useGlass = false,
      bool modern = false,
      bool glow = false}) {
    final hasAction =
        widget.state.actionLabel != null && widget.state.onAction != null;
    return OsmeaColumn(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OsmeaPadding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(_iconData(), color: Colors.white, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: OsmeaText(
                  widget.state.message,
                  style: TextStyle(
                    color: useGlass
                        ? Colors.white.withOpacity(0.95)
                        : Colors.white,
                    fontSize: modern ? 15 : 14,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              if (hasAction)
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: OsmeaTextButton(
                    text: widget.state.actionLabel!,
                    onPressed: () {
                      widget.state.onAction?.call();
                      _dismiss();
                    },
                    variant:
                        useGlass ? ButtonVariant.outlined : ButtonVariant.ghost,
                    size: ButtonSize.small,
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(left: 2),
                child: IconButton(
                  onPressed: _dismiss,
                  icon: const Icon(Icons.close, color: Colors.white, size: 18),
                  padding: EdgeInsets.zero,
                  constraints:
                      const BoxConstraints(minWidth: 32, minHeight: 32),
                  splashRadius: 18,
                ),
              ),
            ],
          ),
        ),
        if (showProgress)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(2),
              child: SizedBox(
                height: 3,
                child: AnimatedBuilder(
                  animation: _progressAnimation,
                  builder: (context, child) {
                    return OsmeaProgress(
                      type: ProgressType.linear,
                      value: _progressAnimation.value,
                      size: ProgressSize.small,
                      progressColor: Colors.white,
                      showPercentage: false,
                    );
                  },
                ),
              ),
            ),
          ),
        if (showProgress) const SizedBox(height: 8),
      ],
    );
  }
}

Widget snackbarBuilder(SnackbarState state, VoidCallback onClose) =>
    OsmeaSnackbar(state: state, onClose: onClose);

/// Snackbar Manager to handle snackbar operations and cubit interactions
class SnackbarManager {
  static final SnackbarManager _instance = SnackbarManager._internal();
  factory SnackbarManager() => _instance;
  SnackbarManager._internal();
  final List<_SnackbarEntry> _entries = [];
  final Map<String, Timer> _timers = {};
  static const int _defaultMaxSnackbars = 3;

  void showSnackbar({
    required BuildContext context,
    String? title,
    required String message,
    SnackbarType type = SnackbarType.info,
    SnackbarStyle style = SnackbarStyle.defaultStyle,
    SnackbarPosition position = SnackbarPosition.bottom,
    SnackbarAnimation animation = SnackbarAnimation.slide,
    Duration? duration,
    bool stacked = true,
    int maxSnackbars = _defaultMaxSnackbars,
    String? actionLabel,
    VoidCallback? onAction,
  }) {
    final overlay = Overlay.of(context, rootOverlay: true);
    final id = UniqueKey().toString();
    final snackbarState = SnackbarState(
      id: id,
      visible: true,
      title: title,
      message: message,
      type: type,
      position: position,
      animation: animation,
      style: style,
      duration: duration ?? const Duration(seconds: 4),
      actionLabel: actionLabel,
      onAction: onAction,
    );
    if (!stacked) {
      for (final entry in _entries) {
        entry.overlayEntry.remove();
        _timers[entry.id]?.cancel();
        _timers.remove(entry.id);
      }
      _entries.clear();
    } else if (_entries.length >= maxSnackbars) {
      _timers[_entries.first.id]?.cancel();
      _entries.first.overlayEntry.remove();
      _entries.removeAt(0);
    }
    late OverlayEntry entry;
    entry = OverlayEntry(
      builder: (ctx) => _SingleSnackbarOverlay(
        state: snackbarState,
        onClose: () => hideSnackbar(id),
        onAutoHide: () => hideSnackbar(id),
      ),
    );
    _entries.add(_SnackbarEntry(id, entry));
    overlay.insert(entry);
    if (_entries.length == 1 || _entries.last.id == id) {
      _startAutoHideTimer(_entries.last.id, snackbarState.duration);
    }
  }

  void _startAutoHideTimer(String id, Duration duration) {
    _timers[id]?.cancel();
    _timers[id] = Timer(duration, () {
      hideSnackbar(id);
    });
  }

  void hideAllSnackbars() {
    for (final entry in _entries) {
      entry.overlayEntry.remove();
    }
    _entries.clear();
  }

  void hideSnackbar(String id) {
    final idx = _entries.indexWhere((e) => e.id == id);
    if (idx != -1) {
      _timers[id]?.cancel();
      _timers.remove(id);
      _entries[idx].overlayEntry.remove();
      _entries.removeAt(idx);
      if (_entries.isNotEmpty) {
        final nextId = _entries.last.id;
        _startAutoHideTimer(nextId, const Duration(seconds: 4));
      }
    }
  }
}

class _SnackbarEntry {
  final String id;
  final OverlayEntry overlayEntry;
  _SnackbarEntry(this.id, this.overlayEntry);
}

class _SingleSnackbarOverlay extends StatelessWidget {
  final SnackbarState state;
  final VoidCallback onClose;
  final VoidCallback onAutoHide;
  const _SingleSnackbarOverlay({
    required this.state,
    required this.onClose,
    required this.onAutoHide,
  });
  @override
  Widget build(BuildContext context) {
    Alignment alignment = _getAlignment(state.position);
    EdgeInsets padding = _getPadding(state.position);
    return IgnorePointer(
      ignoring: false,
      child: SafeArea(
        child: OsmeaStack(
          children: [
            OsmeaAlign(
              alignment: alignment,
              child: OsmeaPadding(
                padding: padding,
                child: OsmeaSnackbar(
                  state: state,
                  onClose: onClose,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Alignment _getAlignment(SnackbarPosition position) {
    switch (position) {
      case SnackbarPosition.top:
        return Alignment.topCenter;
      case SnackbarPosition.center:
        return Alignment.center;
      case SnackbarPosition.bottom:
        return Alignment.bottomCenter;
    }
  }

  EdgeInsets _getPadding(SnackbarPosition position) {
    switch (position) {
      case SnackbarPosition.top:
        return const EdgeInsets.only(top: 24, left: 16, right: 16);
      case SnackbarPosition.center:
        return const EdgeInsets.symmetric(horizontal: 16);
      case SnackbarPosition.bottom:
        return const EdgeInsets.only(bottom: 24, left: 16, right: 16);
    }
  }
}
