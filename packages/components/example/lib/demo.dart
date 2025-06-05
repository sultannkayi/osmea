import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:osmea_components/osmea_ui_kit.dart';
import 'package:osmea_components/src/components/advanced_buttons.dart';
import 'package:osmea_components/src/theme/theme_provider.dart';
import 'package:osmea_components/src/theme/theme.dart';

void main() {
  runApp(const OsmeaButtonDemoApp());
}

class OsmeaButtonDemoApp extends StatelessWidget {
  const OsmeaButtonDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          OsmeaThemeProvider(initialThemeType: ThemeType.light),
      child: Consumer<OsmeaThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'OSMEA Button Components Demo',
            theme: OsmeaTheme(themeType: ThemeType.light).toThemeData(),
            darkTheme: OsmeaTheme(themeType: ThemeType.dark).toThemeData(),
            themeMode:
                themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            home: const ButtonDemoHomePage(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}

class ButtonDemoHomePage extends StatefulWidget {
  const ButtonDemoHomePage({super.key});

  @override
  State<ButtonDemoHomePage> createState() => _ButtonDemoHomePageState();
}

class _ButtonDemoHomePageState extends State<ButtonDemoHomePage> {
  bool _isToggled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OSMEA Button Components'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Standard Button Variants'),
            _buildStandardButtonSection(),
            const SizedBox(height: 32),
            _buildSectionTitle('Button Sizes'),
            _buildButtonSizesSection(),
            const SizedBox(height: 32),
            _buildSectionTitle('Animation Effects'),
            _buildAnimationSection(),
            const SizedBox(height: 32),
            _buildSectionTitle('Gradient Buttons'),
            _buildGradientButtonSection(),
            const SizedBox(height: 32),
            _buildSectionTitle('Advanced Buttons'),
            _buildAdvancedButtonSection(),
            const SizedBox(height: 32),
            _buildSectionTitle('Full-Width Buttons'),
            _buildFullWidthButtonSection(),
            const SizedBox(height: 32),
            _buildSectionTitle('Icon Buttons'),
            _buildIconButtonSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  Widget _buildStandardButtonSection() {
    return Column(
      children: [
        _buildSectionTitle('Button Variants'),
        _buildButtonRow([
          OsmeaButton(
            label: 'Primary',
            onPressed: () => _showSnackBar('Primary button pressed'),
            variant: OsmeaButtonVariant.primary,
            themeType: ThemeType.light,
          ),
          OsmeaButton(
            label: 'Secondary',
            onPressed: () => _showSnackBar('Secondary button pressed'),
            variant: OsmeaButtonVariant.secondary,
            themeType: ThemeType.light,
          ),
        ]),
        const SizedBox(height: 12),
        _buildButtonRow([
          OsmeaButton(
            label: 'Outline',
            onPressed: () => _showSnackBar('Outline button pressed'),
            variant: OsmeaButtonVariant.outline,
            themeType: ThemeType.light,
          ),
          OsmeaButton(
            label: 'Text',
            onPressed: () => _showSnackBar('Text button pressed'),
            variant: OsmeaButtonVariant.text,
            themeType: ThemeType.light,
          ),
        ]),
        const SizedBox(height: 12),
        _buildButtonRow([
          OsmeaButton(
            label: 'Success',
            onPressed: () => _showSnackBar('Success button pressed'),
            variant: OsmeaButtonVariant.success,
            themeType: ThemeType.light,
          ),
          OsmeaButton(
            label: 'Danger',
            onPressed: () => _showSnackBar('Danger button pressed'),
            variant: OsmeaButtonVariant.danger,
            themeType: ThemeType.light,
          ),
        ]),
        const SizedBox(height: 12),
        _buildButtonRow([
          OsmeaButton(
            label: 'Warning',
            onPressed: () => _showSnackBar('Warning button pressed'),
            variant: OsmeaButtonVariant.warning,
            themeType: ThemeType.light,
          ),
          OsmeaButton(
            label: 'Info',
            onPressed: () => _showSnackBar('Info button pressed'),
            variant: OsmeaButtonVariant.info,
            themeType: ThemeType.light,
          ),
        ]),
      ],
    );
  }

  Widget _buildButtonSizesSection() {
    return Column(
      children: [
        _buildButtonRow([
          OsmeaButton(
            label: 'Small',
            onPressed: () => _showSnackBar('Small button pressed'),
            size: OsmeaButtonSize.small,
            variant: OsmeaButtonVariant.primary,
            themeType: ThemeType.light,
          ),
          OsmeaButton(
            label: 'Medium',
            onPressed: () => _showSnackBar('Medium button pressed'),
            size: OsmeaButtonSize.medium,
            variant: OsmeaButtonVariant.primary,
            themeType: ThemeType.light,
          ),
        ]),
        const SizedBox(height: 12),
        _buildButtonRow([
          OsmeaButton(
            label: 'Large',
            onPressed: () => _showSnackBar('Large button pressed'),
            size: OsmeaButtonSize.large,
            variant: OsmeaButtonVariant.primary,
            themeType: ThemeType.light,
          ),
          OsmeaButton(
            label: 'Extra Large',
            onPressed: () => _showSnackBar('Extra Large button pressed'),
            size: OsmeaButtonSize.extraLarge,
            variant: OsmeaButtonVariant.primary,
            themeType: ThemeType.light,
          ),
        ]),
      ],
    );
  }

  Widget _buildAnimationSection() {
    return Column(
      children: [
        _buildButtonRow([
          OsmeaButton(
            label: 'Scale Animation',
            onPressed: () => _showSnackBar('Scale animation triggered'),
            animation: OsmeaButtonAnimation.scale,
            variant: OsmeaButtonVariant.primary,
            themeType: ThemeType.light,
          ),
          OsmeaButton(
            label: 'Fade Animation',
            onPressed: () => _showSnackBar('Fade animation triggered'),
            animation: OsmeaButtonAnimation.fade,
            variant: OsmeaButtonVariant.secondary,
            themeType: ThemeType.light,
          ),
        ]),
        const SizedBox(height: 12),
        _buildButtonRow([
          OsmeaButton(
            label: 'Pulse Animation',
            onPressed: () => _showSnackBar('Pulse animation triggered'),
            animation: OsmeaButtonAnimation.pulse,
            variant: OsmeaButtonVariant.success,
            themeType: ThemeType.light,
          ),
          OsmeaButton(
            label: 'No Animation',
            onPressed: () => _showSnackBar('No animation'),
            animation: OsmeaButtonAnimation.none,
            variant: OsmeaButtonVariant.outline,
            themeType: ThemeType.light,
          ),
        ]),
      ],
    );
  }

  Widget _buildGradientButtonSection() {
    return Column(
      children: [
        _buildButtonRow([
          OsmeaGradientButton(
            label: 'Blue Gradient',
            onPressed: () => _showSnackBar('Blue gradient pressed'),
            gradientColors: const [Colors.blue, Colors.blueAccent],
            themeType: ThemeType.light,
          ),
          OsmeaGradientButton(
            label: 'Purple Gradient',
            onPressed: () => _showSnackBar('Purple gradient pressed'),
            gradientColors: const [Colors.purple, Colors.pinkAccent],
            themeType: ThemeType.light,
          ),
        ]),
        const SizedBox(height: 12),
        _buildButtonRow([
          OsmeaGradientButton(
            label: 'Orange Gradient',
            onPressed: () => _showSnackBar('Orange gradient pressed'),
            gradientColors: const [Colors.orange, Colors.deepOrange],
            themeType: ThemeType.light,
          ),
          OsmeaGradientButton(
            label: 'Green Gradient',
            onPressed: () => _showSnackBar('Green gradient pressed'),
            gradientColors: const [Colors.green, Colors.teal],
            themeType: ThemeType.light,
          ),
        ]),
      ],
    );
  }

  Widget _buildAdvancedButtonSection() {
    return Column(
      children: [
        // Toggle Button
        Row(
          children: [
            Expanded(
              child: OsmeaToggleButton(
                value: _isToggled,
                onChanged: (value) {
                  setState(() {
                    _isToggled = value;
                  });
                  _showSnackBar('Toggle: ${value ? "ON" : "OFF"}');
                },
                activeText: 'ON',
                inactiveText: 'OFF',
                themeType: ThemeType.light,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Loading Button
        Row(
          children: [
            Expanded(
              child: OsmeaLoadingButton(
                label: 'Loading Button',
                onPressed: () => _showSnackBar('Loading button clicked'),
                onLoadingPressed: () async {
                  // Simulate async operation
                  await Future.delayed(const Duration(seconds: 3));
                  _showSnackBar('Loading completed!');
                },
                themeType: ThemeType.light,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Social Buttons
        _buildButtonRow([
          OsmeaSocialButton(
            platform: SocialPlatform.github,
            onPressed: () => _showSnackBar('GitHub button pressed'),
          ),
          OsmeaSocialButton(
            platform: SocialPlatform.google,
            onPressed: () => _showSnackBar('Google button pressed'),
          ),
        ]),
        const SizedBox(height: 12),
        _buildButtonRow([
          OsmeaSocialButton(
            platform: SocialPlatform.apple,
            onPressed: () => _showSnackBar('Apple button pressed'),
          ),
          OsmeaSocialButton(
            platform: SocialPlatform.facebook,
            onPressed: () => _showSnackBar('Facebook button pressed'),
          ),
        ]),
        const SizedBox(height: 12),
        _buildButtonRow([
          OsmeaSocialButton(
            platform: SocialPlatform.twitter,
            onPressed: () => _showSnackBar('Twitter button pressed'),
          ),
          const SizedBox(width: 8), // Empty space for last button
        ]),
      ],
    );
  }

  Widget _buildFullWidthButtonSection() {
    return Column(
      children: [
        // Full-width primary button
        OsmeaButton(
          label: 'Full-Width Primary Button',
          onPressed: () => _showSnackBar('Full-width primary pressed'),
          variant: OsmeaButtonVariant.primary,
          themeType: ThemeType.light,
          isFullWidth: true,
        ),
        const SizedBox(height: 12),
        // Full-width secondary button with icon
        OsmeaButton(
          label: 'Full-Width with Icon',
          onPressed: () => _showSnackBar('Full-width with icon pressed'),
          variant: OsmeaButtonVariant.secondary,
          themeType: ThemeType.light,
          isFullWidth: true,
          icon: Icons.star,
        ),
        const SizedBox(height: 12),
        // Full-width outline button
        OsmeaButton(
          label: 'Full-Width Outline Button',
          onPressed: () => _showSnackBar('Full-width outline pressed'),
          variant: OsmeaButtonVariant.outline,
          themeType: ThemeType.light,
          isFullWidth: true,
        ),
        const SizedBox(height: 12),
        // Full-width gradient button
        OsmeaGradientButton(
          label: 'Full-Width Gradient Button',
          onPressed: () => _showSnackBar('Full-width gradient pressed'),
          gradientColors: const [Colors.purple, Colors.blue],
          themeType: ThemeType.light,
          isFullWidth: true,
          icon: Icons.rocket_launch,
        ),
      ],
    );
  }

  Widget _buildIconButtonSection() {
    return Column(
      children: [
        // Small icon buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OsmeaIconButton(
              icon: Icons.favorite,
              onPressed: () => _showSnackBar('Small heart pressed'),
              size: OsmeaButtonSize.small,
              themeType: ThemeType.light,
              tooltip: 'Small Heart Button',
            ),
            OsmeaIconButton(
              icon: Icons.share,
              onPressed: () => _showSnackBar('Small share pressed'),
              size: OsmeaButtonSize.small,
              themeType: ThemeType.light,
              tooltip: 'Small Share Button',
            ),
            OsmeaIconButton(
              icon: Icons.bookmark,
              onPressed: () => _showSnackBar('Small bookmark pressed'),
              size: OsmeaButtonSize.small,
              themeType: ThemeType.light,
              tooltip: 'Small Bookmark Button',
            ),
            OsmeaIconButton(
              icon: Icons.download,
              onPressed: () => _showSnackBar('Small download pressed'),
              size: OsmeaButtonSize.small,
              themeType: ThemeType.light,
              tooltip: 'Small Download Button',
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Medium icon buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OsmeaIconButton(
              icon: Icons.edit,
              onPressed: () => _showSnackBar('Medium edit pressed'),
              size: OsmeaButtonSize.medium,
              themeType: ThemeType.light,
              tooltip: 'Edit Button',
            ),
            OsmeaIconButton(
              icon: Icons.delete,
              onPressed: () => _showSnackBar('Medium delete pressed'),
              size: OsmeaButtonSize.medium,
              themeType: ThemeType.light,
              color: Colors.red,
              tooltip: 'Delete Button',
            ),
            OsmeaIconButton(
              icon: Icons.settings,
              onPressed: () => _showSnackBar('Medium settings pressed'),
              size: OsmeaButtonSize.medium,
              themeType: ThemeType.light,
              tooltip: 'Settings Button',
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Large icon buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OsmeaIconButton(
              icon: Icons.play_arrow,
              onPressed: () => _showSnackBar('Large play pressed'),
              size: OsmeaButtonSize.large,
              themeType: ThemeType.light,
              backgroundColor: Colors.green.shade100,
              color: Colors.green.shade800,
              tooltip: 'Play Button',
            ),
            OsmeaIconButton(
              icon: Icons.pause,
              onPressed: () => _showSnackBar('Large pause pressed'),
              size: OsmeaButtonSize.large,
              themeType: ThemeType.light,
              backgroundColor: Colors.orange.shade100,
              color: Colors.orange.shade800,
              tooltip: 'Pause Button',
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Extra large icon button
        Center(
          child: OsmeaIconButton(
            icon: Icons.add,
            onPressed: () => _showSnackBar('Extra large add pressed'),
            size: OsmeaButtonSize.extraLarge,
            themeType: ThemeType.light,
            backgroundColor: Colors.blue.shade100,
            color: Colors.blue.shade800,
            tooltip: 'Add Button',
          ),
        ),
      ],
    );
  }

  Widget _buildButtonRow(List<Widget> buttons) {
    return Row(
      children: buttons
          .map((button) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: button,
                ),
              ))
          .toList(),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
