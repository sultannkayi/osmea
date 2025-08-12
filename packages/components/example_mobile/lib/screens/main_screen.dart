import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import '../routes/app_routes.dart';

class MainScreen extends StatefulWidget {
  final Widget child; // Added child parameter for ShellRoute

  const MainScreen({super.key, required this.child});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<NavbarItem> _navItems = [
    NavbarItem(
      text: 'Login',
      icon: const Icon(Icons.home_outlined),
      onTap: () {},
    ),
    NavbarItem(
      text: 'Components',
      icon: const Icon(Icons.widgets_outlined),
      onTap: () {},
    ),
    NavbarItem(
      text: 'Info',
      icon: const Icon(Icons.info_outline),
      onTap: () {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.scaffold(
      // AppBar kaldırıldı - navbar ile gezilen sayfalarda AppBar yok
      body: widget.child, // Displays the child from Go Router's ShellRoute
      bottomNavigationBar: OsmeaComponents.navbar(
        items: _navItems,
        variant: NavbarVariant.transparent,
        size: NavbarSize.small,
        currentIndex: _currentIndex,
        onItemTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          _navigateToPage(index);
        },
        activeColor: OsmeaColors.black,
        inactiveColor: OsmeaColors.grayMaterial,
        backgroundColor: OsmeaColors.white,
      ),
    );
  }

  void _navigateToPage(int index) {
    switch (index) {
      case 0:
        AppRoutes.goToHome(context); // Navigate to home
        break;
      case 1:
        AppRoutes.goToComponents(context); // Navigate to components
        break;
      case 2:
        AppRoutes.goToInfo(context); // Navigate to info
        break;
    }
  }
}
