import 'package:flutter/material.dart';
import 'package:osmea_components/src/components/column/column.dart';
import 'package:osmea_components/src/components/container/container.dart';
import 'package:osmea_components/src/components/padding/padding.dart';
import 'package:osmea_components/src/components/stack/stack.dart';
import 'package:osmea_components/src/components/text/text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osmea_components/src/components/snackbar/cubit/snackbar_cubit.dart';
import 'package:osmea_components/src/components/snackbar/cubit/snackbar_state.dart';
import 'dart:ui';
import 'package:osmea_components/src/components/buttons/button.dart';
import 'package:osmea_components/src/components/progress/progress.dart';
import 'dart:math' as math;
import 'package:osmea_components/osmea_components.dart';

/// Global snackbar overlay handler that manages snackbar positioning and display
class GlobalSnackbarOverlay {
  static final GlobalSnackbarOverlay _instance =
      GlobalSnackbarOverlay._internal();
  factory GlobalSnackbarOverlay() => _instance;
  GlobalSnackbarOverlay._internal();
  OverlayEntry? _overlayEntry;
  void ensureOverlay(BuildContext context) {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
    }
    _overlayEntry = OverlayEntry(
      builder: (_) => const _SnackbarOverlayWidget(),
    );
    Overlay.of(context, rootOverlay: true).insert(_overlayEntry!);
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

    Alignment alignment;
    EdgeInsets padding;

    switch (position) {
      case SnackbarPosition.top:
        alignment = Alignment.topCenter;
        padding = const EdgeInsets.only(top: 24, left: 16, right: 16);
        break;
      case SnackbarPosition.center:
        alignment = Alignment.center;
        padding = const EdgeInsets.symmetric(horizontal: 16);
        break;
      case SnackbarPosition.bottom:
        alignment = Alignment.bottomCenter;
        padding = EdgeInsets.only(
          bottom: math.max(MediaQuery.of(context).viewPadding.bottom, 12),
          left: 16,
          right: 16,
        );
        break;
    }

    return Align(
      alignment: alignment,
      child: SafeArea(
        bottom: position == SnackbarPosition.bottom,
        top: position == SnackbarPosition.top,
        child: Padding(
          padding: padding,
          child: ClipRect(
            child: OsmeaStack(
              children: displaySnackbars.asMap().entries.map((entry) {
                final index = entry.key;
                final snackbar = entry.value;
                return Positioned(
                  bottom: index * 8.0,
                  left: 0,
                  right: 0,
                  child: Transform.translate(
                    offset: Offset(0, -index * 2.0),
                    child: OsmeaSnackbar(
                      key: ValueKey(snackbar.id),
                      state: snackbar,
                      onClose: () =>
                          SnackbarManager().hideSnackbar(snackbar.id),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class OsmeaSnackbar extends StatelessWidget {
  final SnackbarState state;
  final VoidCallback? onClose;
  final Color? actionLabelColor;
  const OsmeaSnackbar({
    Key? key,
    required this.state,
    this.onClose,
    this.actionLabelColor,
  }) : super(key: key);

  Color _typeColor() {
    switch (state.type) {
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

  Color _lighterTypeColor() {
    final base = _typeColor();
    final hsl = HSLColor.fromColor(base);
    final light = hsl.withLightness((hsl.lightness + 0.15).clamp(0.0, 1.0));
    return light.toColor();
  }

  IconData _iconData() {
    switch (state.type) {
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

  Color _actionTextColor() {
    switch (state.type) {
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

  @override
  Widget build(BuildContext context) {
    if (!state.visible ||
        state.animationStatus == SnackbarAnimationStatus.dismissed) {
      return const SizedBox.shrink();
    }
    switch (state.visualStyle) {
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
      child: Stack(
        children: [
          OsmeaContainer(
            padding:
                const EdgeInsets.only(bottom: 8, top: 6, left: 8, right: 8),
            decoration: BoxDecoration(
              color: _typeColor(),
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: _buildContent(context, showProgress: false, useGlass: false),
          ),
          if (state.progress != null)
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: OsmeaProgress(
                type: ProgressType.linear,
                value: state.progress!,
                size: ProgressSize.extraSmall,
                progressColor: _lighterTypeColor(),
                showPercentage: false,
                strokeWidth: 0.5,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildModernSnackbar(BuildContext context) {
    return _buildDismissibleWrapper(
      context,
      child: OsmeaContainer(
        padding: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              _typeColor().withAlpha((0.95 * 255).toInt()),
              _typeColor().withAlpha((0.7 * 255).toInt()),
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
            padding: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: _typeColor().withAlpha((0.35 * 255).toInt()),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                  color: Colors.white.withAlpha((0.25 * 255).toInt()),
                  width: 1.5),
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
                state.message,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              if (state.actionLabel != null && state.onAction != null)
                OsmeaTextButton(
                  text: state.actionLabel!,
                  onPressed: () {
                    state.onAction?.call();
                    onClose?.call();
                  },
                  variant: ButtonVariant.ghost,
                  size: ButtonSize.small,
                  textColor: state.actionLabelColor ??
                      actionLabelColor ??
                      _actionTextColor(),
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
        padding: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: _typeColor().withAlpha((0.95 * 255).toInt()),
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
        padding: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: _typeColor().withAlpha((0.92 * 255).toInt()),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: _typeColor().withAlpha((0.7 * 255).toInt()),
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
    return Dismissible(
      key: Key(state.id),
      direction: DismissDirection.horizontal,
      onDismissed: (_) {
        onClose?.call();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        constraints: const BoxConstraints(maxWidth: 600),
        width: double.infinity,
        child: child,
      ),
    );
  }

  Widget _buildContent(BuildContext context,
      {bool showProgress = true,
      bool useGlass = false,
      bool modern = false,
      bool glow = false}) {
    return OsmeaColumn(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OsmeaPadding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(_iconData(), color: Colors.white, size: 16),
              const SizedBox(width: 6),
              Expanded(
                child: OsmeaText(
                  state.message,
                  style: TextStyle(
                    color: useGlass
                        ? Colors.white.withOpacity(0.95)
                        : Colors.white,
                    fontSize: modern ? 13 : 12,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              if (state.actionLabel != null && state.onAction != null)
                Padding(
                  padding: const EdgeInsets.only(left: 2),
                  child: OsmeaTextButton(
                    text: state.actionLabel!,
                    onPressed: () {
                      state.onAction?.call();
                      onClose?.call();
                    },
                    variant: ButtonVariant.ghost,
                    size: ButtonSize.small,
                    textColor: state.actionLabelColor ??
                        actionLabelColor ??
                        _actionTextColor(),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(left: 2),
                child: IconButton(
                  onPressed: onClose,
                  icon: const Icon(Icons.close, color: Colors.white, size: 16),
                  padding: EdgeInsets.zero,
                  constraints:
                      const BoxConstraints(minWidth: 24, minHeight: 24),
                  splashRadius: 14,
                ),
              ),
            ],
          ),
        ),
        if (showProgress && state.progress != null)
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 4, right: 4),
            child: OsmeaProgress(
              type: ProgressType.linear,
              value: state.progress!,
              size: ProgressSize.extraSmall,
              progressColor: _lighterTypeColor(),
              showPercentage: false,
              strokeWidth: 1.0,
            ),
          ),
      ],
    );
  }
}

Widget snackbarBuilder(SnackbarState state, VoidCallback onClose) =>
    OsmeaSnackbar(state: state, onClose: onClose);

class SnackbarManager {
  static final SnackbarManager _instance = SnackbarManager._internal();
  factory SnackbarManager() => _instance;
  SnackbarManager._internal();

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
    int maxSnackbars = 3,
    String? actionLabel,
    VoidCallback? onAction,
    Color? actionLabelColor,
  }) {
    // Cubit tabanlı sisteme geçiş
    SnackbarCubit.instance.show(
      context: context,
      builder: snackbarBuilder,
      title: title,
      message: message,
      type: type,
      position: position,
      animation: animation,
      style: style,
      duration: duration,
      stacked: stacked,
      maxSnackbars: maxSnackbars,
      actionLabel: actionLabel,
      onAction: onAction,
      actionLabelColor: actionLabelColor,
    );
  }

  void hideAllSnackbars() {
    SnackbarCubit.instance.hideAll();
  }

  void hideSnackbar(String id) {
    SnackbarCubit.instance.hide(id);
  }
}

class OsmeaTextButton extends OsmeaButton {
  const OsmeaTextButton({
    super.key,
    required String text,
    super.variant,
    super.size,
    super.state,
    super.onPressed,
    super.onLongPress,
    super.tooltip,
    super.autofocus,
    super.customTheme,
    super.fullWidth,
    super.backgroundColor,
    Color? textColor,
  }) : super(text: text, textColor: textColor);
}
