import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import 'package:go_router/go_router.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>
    with TickerProviderStateMixin {
  late PageController _pageController;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  int _currentPage = 0;
  final List<IntroPage> _introPages = [
    IntroPage(
      title: 'Welcome to OSMEA',
      subtitle: 'Enterprise-grade Flutter UI Components',
      description:
          'Build beautiful, consistent, and accessible Flutter applications with our comprehensive component library.',
      icon: Icons.widgets_outlined,
      color: OsmeaColors.nordicBlue,
    ),
    IntroPage(
      title: 'Modern Design',
      subtitle: 'Built for the Future',
      description:
          'Clean, intuitive interfaces that follow Material Design 3 principles and modern UX patterns.',
      icon: Icons.design_services_outlined,
      color: OsmeaColors.green,
    ),
    IntroPage(
      title: 'Developer Experience',
      subtitle: 'Built for Developers',
      description:
          'Comprehensive documentation, examples, and easy-to-use APIs that make development a breeze.',
      icon: Icons.code_outlined,
      color: OsmeaColors.orange,
    ),
    IntroPage(
      title: 'Ready to Start?',
      subtitle: 'Let\'s Begin Your Journey',
      description:
          'Explore our component library and see how OSMEA can transform your Flutter development experience.',
      icon: Icons.rocket_launch_outlined,
      color: OsmeaColors.purple,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeOut,
    ));

    _fadeController.forward();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _introPages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _goToLogin();
    }
  }

  void _goToLogin() {
    context.go('/'); // Ana sayfaya git (ShellRoute ile)
  }

  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.scaffold(
      backgroundColor: OsmeaColors.black,
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: OsmeaComponents.column(
            children: [
              // Skip button
              OsmeaComponents.align(
                alignment: Alignment.topRight,
                child: OsmeaComponents.padding(
                  padding: const EdgeInsets.all(16.0),
                  child: OsmeaComponents.button(
                    text: 'Skip',
                    variant: ButtonVariant.ghost,
                    onPressed: _goToLogin,
                    textColor: OsmeaColors.white,
                  ),
                ),
              ),

              // Page content
              OsmeaComponents.expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemCount: _introPages.length,
                  itemBuilder: (context, index) {
                    return _buildIntroPage(_introPages[index]);
                  },
                ),
              ),

              // Bottom navigation
              OsmeaComponents.padding(
                padding: const EdgeInsets.all(24.0),
                child: OsmeaComponents.column(
                  children: [
                    // Page indicators
                    OsmeaComponents.row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _introPages.length,
                        (index) => OsmeaComponents.container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: _currentPage == index ? 24 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: _currentPage == index
                                ? OsmeaColors.white
                                : OsmeaColors.grayMaterial,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),

                    OsmeaComponents.sizedBox(height: 32),

                    // Next/Get Started button
                    OsmeaComponents.button(
                      text: _currentPage == _introPages.length - 1
                          ? 'Get Started'
                          : 'Next',
                      variant: ButtonVariant.primary,
                      onPressed: _nextPage,
                      fullWidth: true,
                      backgroundColor: OsmeaColors.white,
                      textColor: OsmeaColors.black,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIntroPage(IntroPage page) {
    return OsmeaComponents.padding(
      padding: const EdgeInsets.all(24.0),
      child: OsmeaComponents.column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Logo Image instead of Icon
          OsmeaComponents.container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: OsmeaColors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(60),
            ),
            child: OsmeaComponents.center(
              child: OsmeaComponents.image(
                imageUrl: 'assets/images/osmea_logo_black.png',
                variant: ImageVariant.normal,
                size: ImageSize.medium,
              ),
            ),
          ),

          OsmeaComponents.sizedBox(height: 48),

          // Title
          OsmeaComponents.text(
            page.title,
            variant: OsmeaTextVariant.headlineLarge,
            color: OsmeaColors.white,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
          ),

          OsmeaComponents.sizedBox(height: 16),

          // Subtitle
          OsmeaComponents.text(
            page.subtitle,
            variant: OsmeaTextVariant.titleMedium,
            color: OsmeaColors.grayMaterial,
            textAlign: TextAlign.center,
          ),

          OsmeaComponents.sizedBox(height: 24),

          // Description
          OsmeaComponents.text(
            page.description,
            variant: OsmeaTextVariant.bodyLarge,
            color: OsmeaColors.white.withOpacity(0.8),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class IntroPage {
  final String title;
  final String subtitle;
  final String description;
  final IconData icon;
  final Color color;

  IntroPage({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.icon,
    required this.color,
  });
}
