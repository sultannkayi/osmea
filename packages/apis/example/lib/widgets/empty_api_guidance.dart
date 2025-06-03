import 'package:example/styles/app_theme.dart';
import 'package:flutter/material.dart';

class EmptyApiGuidance extends StatefulWidget {
  const EmptyApiGuidance({super.key});

  @override
  State<EmptyApiGuidance> createState() => _EmptyApiGuidanceState();
}

class _EmptyApiGuidanceState extends State<EmptyApiGuidance>
    with TickerProviderStateMixin {
  late AnimationController _pulseController;
  late AnimationController _slideController;
  late Animation<double> _pulseAnimation;
  late Animation<Offset> _slideAnimation;
  late AnimationController _staggeredController;
  late List<Animation<Offset>> _stepAnimations;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat(reverse: true);

    _slideController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _staggeredController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _pulseAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOutCubic,
    ));

    _stepAnimations = List.generate(3, (index) {
      return Tween<Offset>(
        begin: const Offset(0, 0.2),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: _staggeredController,
        curve: Interval(
          index * 0.3,
          (index + 1) * 0.3,
          curve: Curves.easeOut,
        ),
      ));
    });

    _slideController.forward();
    _staggeredController.forward();
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _slideController.dispose();
    _staggeredController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final isNarrow = screenWidth < 600;

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: Container(
              margin: EdgeInsets.all(isNarrow ? 8 : 16),
              decoration: BoxDecoration(
                gradient: AppTheme.createGradient(
                  theme.colorScheme.primary
                      .withValues(alpha: isDark ? 0.1 : 0.05),
                  theme.colorScheme.secondary
                      .withValues(alpha: isDark ? 0.05 : 0.02),
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: theme.colorScheme.primary.withValues(alpha: 0.2),
                ),
              ),
              child: SlideTransition(
                position: _slideAnimation,
                child: Padding(
                  padding: EdgeInsets.all(isNarrow ? 24 : 48),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Animated icon
                      AnimatedBuilder(
                        animation: _pulseAnimation,
                        builder: (context, child) {
                          return Transform.scale(
                            scale: _pulseAnimation.value,
                            child: Container(
                              width: isNarrow ? 60 : 80,
                              height: isNarrow ? 60 : 80,
                              decoration: BoxDecoration(
                                gradient: AppTheme.createGradient(
                                  AppTheme.primaryColor,
                                  AppTheme.primaryVariant,
                                ),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: theme.colorScheme.primary
                                        .withValues(alpha: 0.2),
                                    blurRadius: 20,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                              child: Icon(
                                Icons.explore_rounded,
                                color: theme.colorScheme.onPrimary,
                                size: isNarrow ? 30 : 40,
                              ),
                            ),
                          );
                        },
                      ),

                      SizedBox(height: isNarrow ? 24 : 32),

                      // Title
                      Text(
                        'Welcome to OSMEA API Explorer',
                        style: TextStyle(
                          fontSize: isNarrow ? 20 : 24,
                          fontWeight: FontWeight.w700,
                          color: theme.colorScheme.onSurface,
                          letterSpacing: -0.5,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(height: isNarrow ? 12 : 16),

                      // Subtitle
                      Text(
                        'Select an API from the sidebar to start exploring and testing endpoints',
                        style: TextStyle(
                          fontSize: isNarrow ? 14 : 16,
                          color: theme.colorScheme.onSurface
                              .withValues(alpha: 0.7),
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(height: isNarrow ? 24 : 32),

                      // Steps - staggered animation
                      for (int i = 0; i < 3; i++)
                        SlideTransition(
                          position: _stepAnimations[i],
                          child: Padding(
                            padding:
                                EdgeInsets.only(bottom: isNarrow ? 12 : 16),
                            child: _buildStepItem(
                              icon: i == 0
                                  ? Icons.list_rounded
                                  : i == 1
                                      ? Icons.tune_rounded
                                      : Icons.rocket_launch_rounded,
                              title: i == 0
                                  ? 'Browse APIs'
                                  : i == 1
                                      ? 'Configure Request'
                                      : 'Test & Explore',
                              subtitle: i == 0
                                  ? 'Choose from organized categories'
                                  : i == 1
                                      ? 'Set parameters and method'
                                      : 'Send requests and view responses',
                              step: '${i + 1}',
                              theme: theme,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildStepItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required String step,
    required ThemeData theme,
  }) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: theme.colorScheme.primary.withValues(alpha: 0.2),
            ),
          ),
          child: Center(
            child: Text(
              step,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: theme.colorScheme.primary,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Icon(
          icon,
          color: theme.colorScheme.primary,
          size: 24,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 12,
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
