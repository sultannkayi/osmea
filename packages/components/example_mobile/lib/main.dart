import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';
import 'package:osmea_components_example/align_example.dart';
import 'package:osmea_components_example/avatar_example.dart';
import 'package:osmea_components_example/carousel_example.dart';
import 'package:osmea_components_example/chips_example.dart';
import 'package:osmea_components_example/divider_example.dart';
import 'package:osmea_components_example/footer_example.dart';
import 'package:osmea_components_example/loading_example.dart';
import 'package:osmea_components_example/progress_example.dart';
import 'package:osmea_components_example/services/mock_auth_service.dart';
import 'package:osmea_components_example/center_example.dart';
import 'package:osmea_components_example/appbars_demo.dart';
import 'package:osmea_components_example/switch_button_example.dart';
import 'package:osmea_components_example/radio_button_example.dart';
import 'package:osmea_components_example/text_example.dart';
import 'package:osmea_components_example/text_field_example.dart';
import 'package:osmea_components_example/card_example.dart';
import 'package:osmea_components_example/colors_example.dart';
import 'package:osmea_components_example/button_example.dart';
import 'package:osmea_components_example/badge_example.dart';
import 'package:osmea_components_example/checkbox_example.dart';
import 'package:osmea_components_example/container_example.dart';
import 'package:osmea_components_example/row_example.dart';
import 'package:osmea_components_example/column_example.dart';
import 'package:osmea_components_example/expanded_example.dart';
import 'package:osmea_components_example/flexible_example.dart';
import 'package:osmea_components_example/padding_example.dart';
import 'package:osmea_components_example/sized_box_example.dart';
import 'package:osmea_components_example/scaffold_example.dart';
import 'package:osmea_components_example/single_child_scroll_view_example.dart';
import 'package:osmea_components_example/fitted_box_example.dart';
import 'package:osmea_components_example/clip_r_rect_example.dart';
import 'package:osmea_components_example/wrap_example.dart';
import 'package:osmea_components_example/list_item_example.dart';
import 'package:osmea_components_example/ticket_widget_example.dart';
import 'package:osmea_components_example/bottom_sheet_example.dart';
import 'package:osmea_components_example/popup_example.dart';
import 'package:osmea_components_example/stack_example.dart';
import 'package:osmea_components_example/positioned_example.dart';
import 'package:osmea_components_example/spacer_example.dart';
import 'package:osmea_components_example/rich_text_example.dart';
import 'package:osmea_components_example/stepper_example.dart';
import 'package:osmea_components_example/searchbar_example.dart';
import 'package:osmea_components_example/toast_example.dart';
import 'package:osmea_components_example/dropdown_example.dart';
import 'package:osmea_components_example/tabbar_example.dart';
import 'package:osmea_components_example/image_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OSMEA Components Example',
      theme: CoreTheme.lightTheme,
      darkTheme: CoreTheme.darkTheme,
      themeMode: ThemeMode.light,
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<NavbarItem> _navItems = [
    NavbarItem(
      text: 'Home',
      icon: const Icon(Icons.home),
      onTap: () {},
    ),
    NavbarItem(
      text: 'Components',
      icon: const Icon(Icons.widgets),
      onTap: () {},
    ),
    NavbarItem(
      text: 'Examples',
      icon: const Icon(Icons.code),
      onTap: () {},
    ),
    NavbarItem(
      text: 'Settings',
      icon: const Icon(Icons.settings),
      onTap: () {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.scaffold(
      appBar: OsmeaComponents.appBar(
        title: OsmeaComponents.text(
          'OSMEA Components',
        ),
        backgroundColor: OsmeaColors.nordicBlue,
        foregroundColor: OsmeaColors.white,
      ),
      body: _buildCurrentPage(),
      bottomNavigationBar: OsmeaComponents.navbar(
        items: _navItems,
        variant: NavbarVariant.primary,
        size: NavbarSize.medium,
        position: NavbarPosition.bottom,
        currentIndex: _currentIndex,
        centerItems: true,
        onItemTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildCurrentPage() {
    switch (_currentIndex) {
      case 0:
        return const LoginScreen();
      case 1:
        return const ComponentsScreen();
      case 2:
        return const ExamplesScreen();
      case 3:
        return const SettingsScreen();
      default:
        return const LoginScreen();
    }
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final AuthService _authService = MyAuthService();

  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.padding(
      padding: context.paddingMedium,
      child: OsmeaComponents.column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OsmeaComponents.text(
            'Welcome to OSMEA',
            color: OsmeaColors.nordicBlue,
          ),
          OsmeaComponents.sizedBox(height: 32),
          OsmeaComponents.textField(
            controller: _usernameController,
            label: 'Username',
            variant: TextFieldVariant.outlined,
          ),
          OsmeaComponents.sizedBox(height: 16),
          OsmeaComponents.textField(
            controller: _passwordController,
            label: 'Password',
            variant: TextFieldVariant.outlined,
            type: TextFieldType.password,
          ),
          OsmeaComponents.sizedBox(height: 32),
          OsmeaComponents.loginButton(
            text: 'Sign In',
            authService: _authService,
            getUsername: () => _usernameController.text,
            getPassword: () => _passwordController.text,
            onLoginSuccess: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: OsmeaComponents.text('Login successful!'),
                  backgroundColor: OsmeaColors.green,
                ),
              );
            },
            onLoginFailure: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: OsmeaComponents.text('Login failed.'),
                  backgroundColor: OsmeaColors.red,
                ),
              );
            },
            size: ButtonSize.medium,
            fullWidth: true,
            variant: ButtonVariant.primary,
            icon: const Icon(Icons.login),
          ),
        ],
      ),
    );
  }
}

class ComponentsScreen extends StatelessWidget {
  const ComponentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.padding(
      padding: context.paddingNormal,
      child: OsmeaComponents.column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OsmeaComponents.text(
            'OSMEA Components',
          ),
          OsmeaComponents.sizedBox(height: 16),
          OsmeaComponents.expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _buildComponentCard(
                  context,
                  'AppBar',
                  Icons.border_top,
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AppbarDemo(),
                    ),
                  ),
                ),
                _buildComponentCard(
                  context,
                  'Avatar',
                  Icons.account_circle,
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AvatarExample(),
                    ),
                  ),
                ),
                _buildComponentCard(
                  context,
                  'Text Components',
                  Icons.text_fields,
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TextExample(),
                    ),
                  ),
                ),
                _buildComponentCard(
                  context,
                  'Rich Text',
                  Icons.format_color_text,
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RichTextExample(),
                    ),
                  ),
                ),
                _buildComponentCard(
                  context,
                  'Text Fields',
                  Icons.input,
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TextFieldExample(),
                    ),
                  ),
                ),
                _buildComponentCard(
                  context,
                  'Buttons',
                  Icons.smart_button,
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ButtonExample(),
                    ),
                  ),
                ),
                _buildComponentCard(
                  context,
                  'loading',
                  Icons.animation,
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoadingExample(),
                    ),
                  ),
                ),
                _buildComponentCard(
                  context,
                  'progress',
                  Icons.timelapse,
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProgressExample(),
                    ),
                  ),
                ),
                _buildComponentCard(
                  context,
                  'Badges',
                  Icons.label,
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BadgeExample(),
                    ),
                  ),
                ),
                _buildComponentCard(
                  context,
                  'Chips',
                  Icons.local_offer,
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChipsExample(),
                    ),
                  ),
                ),
                _buildComponentCard(
                  context,
                  'Carousel',
                  Icons.swipe,
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CarouselExample(),
                    ),
                  ),
                ),
                _buildComponentCard(
                  context,
                  'Cards',
                  Icons.credit_card,
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CardExample(),
                    ),
                  ),
                ),
                _buildComponentCard(
                  context,
                  'Checkboxes',
                  Icons.check_box,
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CheckboxExample(),
                    ),
                  ),
                ),
                _buildComponentCard(
                  context,
                  'Colors',
                  Icons.palette,
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ColorsExample(),
                    ),
                  ),
                ),
                _buildComponentCard(
                  context,
                  'Dividers',
                  Icons.horizontal_rule,
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DividerExample(),
                    ),
                  ),
                ),
                _buildComponentCard(
                  context,
                  'Footer',
                  Icons.vertical_align_bottom,
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FooterExample(),
                    ),
                  ),
                ),
                _buildComponentCard(
                    context,
                    'SearchBar',
                    Icons.search,
                    () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SearchbarExample(),
                        ))),
                _buildComponentCard(
                  context,
                  'Stepper',
                  Icons.palette,
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StepperExample(),
                    ),
                  ),
                ),
                _buildComponentCard(
                  context,
                  'Ticket Widget',
                  Icons.support_agent,
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TicketWidgetExample(),
                    ),
                  ),
                ),
                _buildComponentCard(
                  context,
                  'Bottom Sheet',
                  Icons.vertical_align_bottom,
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BottomSheetExample(),
                    ),
                  ),
                ),
                _buildComponentCard(
                  context,
                  'Popup (S, M, L)',
                  Icons.open_in_new,
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PopupExample(),
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

  Widget _buildComponentCard(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: OsmeaComponents.padding(
          padding: context.paddingNormal,
          child: OsmeaComponents.column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 48,
                color: OsmeaColors.blue,
              ),
              OsmeaComponents.sizedBox(height: 12),
              OsmeaComponents.text(
                title,
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExamplesScreen extends StatelessWidget {
  const ExamplesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.padding(
      padding: context.paddingNormal,
      child: OsmeaComponents.column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OsmeaComponents.text(
              'Interactive Examples',
              textStyle: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            OsmeaComponents.sizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  _buildExampleTile(
                    context,
                    'Positioned Examples',
                    'Precise widget placement within a Stack',
                    Icons.fullscreen,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PositionedExampleScreen(),
                      ),
                    ),
                  ),
                  _buildExampleTile(
                    context,
                    'Stack Examples',
                    'Layered widget stack with alignment control',
                    Icons.layers,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const StackExample(),
                      ),
                    ),
                  ),
                  _buildExampleTile(
                    context,
                    'Switch Examples',
                    'Toggle switches with different styles',
                    Icons.toggle_on,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SwitchButtonExample(),
                      ),
                    ),
                  ),
                  _buildExampleTile(
                    context,
                    'Avatar Examples',
                    'User avatars with icons, images, and text',
                    Icons.account_circle,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AvatarExample(),
                      ),
                    ),
                  ),
                  _buildExampleTile(
                    context,
                    'Image Examples',
                    'Universal image component with variants and animations',
                    Icons.image,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ImageExample(),
                      ),
                    ),
                  ),
                  _buildExampleTile(
                    context,
                    'Radio Button Examples',
                    'Single and multiple selection options',
                    Icons.radio_button_checked,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RadioButtonExample(),
                      ),
                    ),
                  ),
                  _buildExampleTile(
                    context,
                    'Navbar Examples',
                    'Navigation bar variants and positions',
                    Icons.navigation,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NavbarExample(),
                      ),
                    ),
                  ),
                  _buildExampleTile(
                    context,
                    'Container Examples',
                    'Flexible container with styling options',
                    Icons.crop_square,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ContainerExampleScreen(),
                      ),
                    ),
                  ),
                  _buildExampleTile(
                    context,
                    'Row Examples',
                    'Horizontal layout with enhanced features',
                    Icons.view_week,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RowExampleScreen(),
                      ),
                    ),
                  ),
                  _buildExampleTile(
                    context,
                    'Column Examples',
                    'Vertical layout with enhanced features',
                    Icons.view_stream,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ColumnExampleScreen(),
                      ),
                    ),
                  ),
                  _buildExampleTile(
                    context,
                    'Colors Examples',
                    'OSMEA design system color palette',
                    Icons.color_lens,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ColorsExample(),
                      ),
                    ),
                  ),
                  _buildExampleTile(
                    context,
                    'Expanded Examples',
                    'Flexible widget that expands to fill available space',
                    Icons.expand,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ExpandedExampleScreen(),
                      ),
                    ),
                  ),
                  _buildExampleTile(
                    context,
                    'Padding Examples',
                    'Enhanced padding with styling and interactive features',
                    Icons.space_bar,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PaddingExample(),
                      ),
                    ),
                  ),
                  _buildExampleTile(
                    context,
                    'SizedBox Examples',
                    'Enhanced sized box with styling and interactive features',
                    Icons.crop_square_rounded,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SizedBoxExample(),
                      ),
                    ),
                  ),
                  _buildExampleTile(
                    context,
                    'Align Examples',
                    'Enhanced alignment with styling and interactive features',
                    Icons.align_horizontal_center,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AlignExample(),
                      ),
                    ),
                  ),
                  _buildExampleTile(
                    context,
                    'Center Examples',
                    'Enhanced centering with styling and interactive features',
                    Icons.center_focus_strong,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CenterExample(),
                      ),
                    ),
                  ),
                  _buildExampleTile(
                    context,
                    'Scaffold Examples',
                    'Flexible application structure with multiple customization options',
                    Icons.web_asset,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ScaffoldExample(),
                      ),
                    ),
                  ),
                  _buildExampleTile(
                    context,
                    'SingleChildScrollView Examples',
                    'Scrollable container with various scroll behaviors',
                    Icons.swipe_vertical,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const SingleChildScrollViewExample(),
                      ),
                    ),
                  ),
                  _buildExampleTile(
                    context,
                    'FittedBox Examples',
                    'Scale and fit child widgets with various fit modes',
                    Icons.fit_screen,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FittedBoxExample(),
                      ),
                    ),
                  ),
                  _buildExampleTile(
                    context,
                    'ClipRRect Examples',
                    'Clip child widgets with rounded corners and custom borders',
                    Icons.crop,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ClipRRectExample(),
                      ),
                    ),
                  ),
                  _buildExampleTile(
                    context,
                    'Wrap Examples',
                    'Flexible layout for multiple children with wrapping behavior',
                    Icons.wrap_text,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WrapExample(),
                      ),
                    ),
                  ),
                  _buildExampleTile(
                    context,
                    'Card Examples',
                    'Cards with actions and interactive content',
                    Icons.touch_app,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CardExample(),
                      ),
                    ),
                  ),
                  _buildExampleTile(
                    context,
                    'List Item Examples',
                    'Comprehensive list item component with multiple types and variants',
                    Icons.list,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ListItemExample(),
                      ),
                    ),
                  ),
                  _buildExampleTile(
                    context,
                    'Spacer Examples',
                    'Flexible space distribution in layouts',
                    Icons.space_bar,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SpacerExampleScreen(),
                      ),
                    ),
                  ),
                  _buildExampleTile(
                    context,
                    'Flexible Examples',
                    'Flexible space allocation in layouts',
                    Icons.aspect_ratio,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FlexibleExampleScreen(),
                      ),
                    ),
                  ),
                  _buildExampleTile(
                    context,
                    'TabBar Examples',
                    'Flexible tab bar with variants, sizes, and animation',
                    Icons.tab,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TabBarExample(),
                      ),
                    ),
                  ),
                  _buildExampleTile(
                    context,
                    'Searchbar Examples',
                    'Advanced search component with suggestions and history',
                    Icons.search,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SearchbarExample(),
                      ),
                    ),
                  ),
                  _buildExampleTile(
                    context,
                    'Toast Example',
                    'Toast notification examples',
                    Icons.notifications,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ToastExamplePage(),
                      ),
                    ),
                  ),
                  _buildExampleTile(
                    context,
                    'Dropdown Examples',
                    'Comprehensive dropdown component with all variants and types',
                    Icons.arrow_drop_down,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DropdownExample(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
    );
  }

  Widget _buildExampleTile(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(icon, color: OsmeaColors.blue),
        title: OsmeaComponents.text(title),
        subtitle: OsmeaComponents.text(description),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.padding(
      padding: context.paddingNormal,
      child: OsmeaComponents.column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OsmeaComponents.text(
            'Settings',
            textStyle: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          OsmeaComponents.sizedBox(height: 16),
          Card(
            child: ListTile(
              leading: const Icon(Icons.info),
              title: OsmeaComponents.text('About OSMEA'),
              subtitle: OsmeaComponents.text('Version 1.0.0'),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.code),
              title: OsmeaComponents.text('GitHub Repository'),
              subtitle: OsmeaComponents.text('github.com/osmea/components'),
            ),
          ),
        ],
      ),
    );
  }
}

/// 🧭 **Navbar Example Screen**
///
/// Demonstrates the OsmeaNavbar component with different variants,
/// sizes, and positions.
class NavbarExample extends StatefulWidget {
  const NavbarExample({super.key});

  @override
  State<NavbarExample> createState() => _NavbarExampleState();
}

class _NavbarExampleState extends State<NavbarExample> {
  int _currentIndex = 0;

  final List<NavbarItem> _navItems = [
    NavbarItem(
      text: 'Home',
      icon: const Icon(Icons.home),
      onTap: () => debugPrint('Home tapped'),
    ),
    NavbarItem(
      text: 'Search',
      icon: const Icon(Icons.search),
      onTap: () => debugPrint('Search tapped'),
    ),
    NavbarItem(
      text: 'Profile',
      icon: const Icon(Icons.person),
      onTap: () => debugPrint('Profile tapped'),
    ),
    NavbarItem(
      text: 'Settings',
      icon: const Icon(Icons.settings),
      onTap: () => debugPrint('Settings tapped'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.scaffold(
      appBar: OsmeaComponents.appBar(
        title: OsmeaComponents.text('🧭 Navbar Examples'),
        backgroundColor: OsmeaColors.blue,
        foregroundColor: OsmeaColors.white,
      ),
      body: OsmeaComponents.column(
        children: [
          // Top Navbar Example
          OsmeaComponents.navbar(
            items: _navItems,
            variant: NavbarVariant.primary,
            size: NavbarSize.medium,
            position: NavbarPosition.top,
            currentIndex: _currentIndex,
            onItemTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          OsmeaComponents.expanded(
            child: OsmeaComponents.padding(
              padding: context.paddingNormal,
              child: OsmeaComponents.column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OsmeaComponents.text(
                    'Different Navbar Variants:',
                    textStyle: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  OsmeaComponents.sizedBox(height: 16),

                  // Secondary Navbar
                  OsmeaComponents.navbar(
                    items: _navItems.take(3).toList(),
                    variant: NavbarVariant.secondary,
                    size: NavbarSize.small,
                    currentIndex: 1,
                  ),
                  OsmeaComponents.sizedBox(height: 16),

                  // Outlined Navbar
                  OsmeaComponents.navbar(
                    items: _navItems.take(2).toList(),
                    variant: NavbarVariant.outlined,
                    size: NavbarSize.large,
                    currentIndex: 0,
                  ),
                  OsmeaComponents.sizedBox(height: 16),

                  OsmeaComponents.text(
                    'Selected Index: $_currentIndex',
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: OsmeaComponents.navbar(
        items: _navItems,
        variant: NavbarVariant.glass,
        size: NavbarSize.medium,
        position: NavbarPosition.bottom,
        currentIndex: _currentIndex,
        onItemTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
