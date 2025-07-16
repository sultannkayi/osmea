# 📱 OSMEA Components Example Mobile App

<div align="center">

[![Flutter](https://img.shields.io/badge/Flutter-3.19.0+-blue?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-2.17.0+-blue?logo=dart)](https://dart.dev)
[![Live Demo](https://img.shields.io/badge/Live%20Demo-osmea--app.web.app-brightgreen?logo=google-chrome)](https://osmea-app.web.app)
[![License](https://img.shields.io/badge/License-GNU%20AGPL%20v3.0-green.svg)](../LICENSE)

**A comprehensive Flutter showcase app demonstrating the power and flexibility of the OSMEA Components UI library**

[🚀 Live Demo](https://osmea-app.web.app) • [📚 Documentation](https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components) • [🐛 Report Issues](https://github.com/masterfabric-mobile/osmea/issues)

</div>

---

## 🌟 Overview

The **OSMEA Components Example Mobile App** is a production-ready Flutter application that serves as both a comprehensive showcase and practical reference for the [OSMEA Components](https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components) UI library. This app demonstrates how to build modern, accessible, and beautiful mobile applications using OSMEA's extensive component library.

### 🎯 Key Features

- **📱 Cross-Platform Support**: Runs seamlessly on iOS, Android, and Web
- **🎨 Modern UI Design**: Beautiful, themed, and accessible components
- **⚡ Performance Optimized**: Built with Flutter's latest features and best practices
- **🔧 Developer Friendly**: Comprehensive examples and clear code patterns
- **📖 Learning Resource**: Perfect for understanding OSMEA component usage
- **🚀 Production Ready**: Real-world implementation patterns and architecture

---

## 🚀 Live Demo

<div align="center">

> **Experience OSMEA Components in Action**  
> 🌐 **[osmea-app.web.app](https://osmea-app.web.app)**

*Interactive playground showcasing all OSMEA components with real-time examples*

</div>

---

## ✨ What's Inside?

### 🎨 UI Components Showcase

#### **Basic Components**
- **Buttons**: Primary, Secondary, Outline, Ghost variants with different sizes
- **Text & Typography**: Rich text formatting, headings, body text, captions
- **Badges & Chips**: Status indicators, labels, and interactive chips
- **Avatars**: User profile images with fallback options
- **Cards**: Information containers with various layouts and styles

#### **Form Components**
- **Input Fields**: Text fields, password fields, search bars with validation
- **Checkboxes & Radio Buttons**: Selection controls with custom styling
- **Switches & Toggles**: Binary state controls
- **Dropdowns**: Selection menus with search and multi-select options
- **Steppers**: Multi-step form navigation
- **Ticket Widget**: Specialized form component for support tickets

#### **Layout Components**
- **Containers**: Flexible layout containers with padding and styling
- **Grid System**: Row, Column, Stack, Wrap for responsive layouts
- **Spacing**: Padding, Margin, Spacer, SizedBox for precise spacing
- **Alignment**: Center, Align, Positioned for element positioning
- **Flexible Layouts**: Expanded, Flexible, FittedBox for dynamic sizing

#### **Navigation Components**
- **App Bars**: Customizable headers with actions and navigation
- **Navigation Bars**: Bottom navigation with icons and labels
- **Tab Bars**: Horizontal tab navigation
- **Bottom Sheets**: Modal overlays for additional content
- **Popups**: Contextual information and actions

#### **Dynamics Components**
- **Loading Indicators**: Spinners, progress bars, skeleton screens
- **Toast Notifications**: Temporary success, error, and info messages
- **Progress Indicators**: Linear and circular progress displays
- **Alerts & Dialogs**: Modal dialogs for user confirmation

#### **Advanced Components**
- **Carousels**: Image and content sliders
- **Search Bars**: Intelligent search with suggestions
- **Rich Text**: Formatted text with styling options
- **List Items**: Structured list components


### 🏗️ Architecture Features

- **📱 Responsive Design**: Adapts to different screen sizes and orientations
- **🎯 Type Safety**: Full TypeScript-like type safety with Dart
- **🔧 Customization**: Extensive theming and styling options
- **📦 Modular Structure**: Clean separation of concerns and reusable components

---

## 🏗️ Project Structure

<details>
<summary><b>📁 Click to expand full project structure</b></summary>

```
example_mobile/
├── 📱 lib/                          # Main application code
│   ├── 🎯 main.dart                 # App entry point and navigation
│   ├── 🎨 Component Examples        # Individual component demonstrations
│   │   ├── align_example.dart       # Alignment utilities
│   │   ├── appbar_example.dart      # App bar components
│   │   ├── avatar_example.dart      # User avatar components
│   │   ├── badge_example.dart       # Status badges and labels
│   │   ├── bottom_sheet_example.dart # Modal bottom sheets
│   │   ├── button_example.dart      # Button variants and states
│   │   ├── card_example.dart        # Card layouts and styling
│   │   ├── carousel_example.dart    # Image/content carousels
│   │   ├── center_example.dart      # Centering utilities
│   │   ├── checkbox_example.dart    # Checkbox controls
│   │   ├── chips_example.dart       # Interactive chips
│   │   ├── clip_r_rect_example.dart # Clipping utilities
│   │   ├── colors_example.dart      # Color system showcase
│   │   ├── column_example.dart      # Vertical layouts
│   │   ├── container_example.dart   # Layout containers
│   │   ├── counter_example.dart     # Counter components
│   │   ├── divider_example.dart     # Visual separators
│   │   ├── dropdown_example.dart    # Dropdown menus
│   │   ├── expanded_example.dart    # Flexible layout expansion
│   │   ├── fitted_box_example.dart  # Size-fitting containers
│   │   ├── flexible_example.dart    # Flexible layout components
│   │   ├── footer_example.dart      # Footer components
│   │   ├── image_example.dart       # Image handling
│   │   ├── list_item_example.dart   # List item components
│   │   ├── loading_example.dart     # Loading indicators
│   │   ├── padding_example.dart     # Spacing utilities
│   │   ├── popup_example.dart       # Popup dialogs
│   │   ├── positioned_example.dart  # Positioned elements
│   │   ├── progress_example.dart    # Progress indicators
│   │   ├── radio_button_example.dart # Radio button controls
│   │   ├── rich_text_example.dart   # Rich text formatting
│   │   ├── row_example.dart         # Horizontal layouts
│   │   ├── scaffold_example.dart    # Page scaffolding
│   │   ├── searchbar_example.dart   # Search functionality
│   │   ├── single_child_scroll_view_example.dart # Scrollable content
│   │   ├── sized_box_example.dart   # Fixed-size containers
│   │   ├── spacer_example.dart      # Spacing components
│   │   ├── stack_example.dart       # Layered layouts
│   │   ├── stepper_example.dart     # Multi-step forms
│   │   ├── switch_button_example.dart # Toggle switches
│   │   ├── tabbar_example.dart      # Tab navigation
│   │   ├── text_example.dart        # Text components
│   │   ├── text_field_example.dart  # Input fields
│   │   ├── ticket_widget_example.dart # Support ticket form
│   │   ├── toast_example.dart       # Toast notifications
│   │   └── wrap_example.dart        # Wrapping layouts
│   └── 🔧 services/                 # Business logic and services
│       └── mock_auth_service.dart   # Authentication service mock
├── 📦 assets/                       # Static assets
│   └── ticket_form_example.json     # Sample form configuration
├── 🍎 ios/                          # iOS platform configuration
│   ├── Runner/                      # iOS app bundle
│   ├── Runner.xcodeproj/            # Xcode project
│   ├── Runner.xcworkspace/          # Xcode workspace
│   ├── Flutter/                     # Flutter iOS configuration
│   ├── Pods/                        # CocoaPods dependencies
│   ├── RunnerTests/                 # iOS unit tests
│   ├── Podfile                      # CocoaPods configuration
│   └── Podfile.lock                 # Dependency lock file
├── 🌐 web/                          # Web platform configuration
│   ├── favicon.png                  # Web app icon
│   ├── index.html                   # Web entry point
│   ├── manifest.json                # PWA manifest
│   └── icons/                       # Web app icons
│       ├── Icon-192.png             # Small icon
│       ├── Icon-512.png             # Large icon
│       ├── Icon-maskable-192.png    # Maskable icon (small)
│       └── Icon-maskable-512.png    # Maskable icon (large)
├── 📋 pubspec.yaml                  # Flutter dependencies
└── 📖 README.md                     # This file
```

</details>

---

## 🛠️ Getting Started

### 📋 Prerequisites

Before you begin, ensure you have the following installed:

- **Flutter SDK** (3.19.0 or higher)
- **Dart SDK** (2.17.0 or higher)
- **Android Studio** or **VS Code** with Flutter extensions
- **Git** for version control

### 🚀 Quick Start

<div align="center">

[![Get Started](https://img.shields.io/badge/Start%20Now-Flutter%20Run-blue?logo=playstation&style=for-the-badge)](#getting-started)

</div>

#### **1. Clone the Repository**
```bash
# Clone the main OSMEA repository
git clone https://github.com/masterfabric-mobile/osmea.git

# Navigate to the example mobile app
cd osmea/packages/components/example_mobile
```

#### **2. Install Dependencies**
```bash
# Get Flutter dependencies
flutter pub get

# For iOS (if developing on macOS)
cd ios && pod install && cd ..
```

#### **3. Run the Application**

**Mobile (iOS/Android):**
```bash
# Run on connected device or simulator
flutter run

# Run on specific device
flutter run -d <device-id>

# Run in release mode
flutter run --release
```

### 🔧 Development Setup

#### **IDE Configuration**

**VS Code (Recommended):**
1. Install the Flutter extension
2. Install the Dart extension
3. Configure your workspace settings


#### **Hot Reload Development**
```bash
# Start with hot reload enabled (default)
flutter run

# Use 'r' for hot reload, 'R' for hot restart
# Press 'q' to quit
```

---

## 💡 Usage Examples

### 🎨 Basic Component Usage

```dart
import 'package:osmea_components/osmea_components.dart';

// Simple button
OsmeaComponents.button(
  text: 'Click Me',
  variant: ButtonVariant.primary,
  onPressed: () => print('Button clicked!'),
)

// Text with styling
OsmeaComponents.text(
  'Hello OSMEA!',
  color: OsmeaColors.nordicBlue,
  size: TextSize.large,
  weight: TextWeight.bold,
)

// Card with content
OsmeaComponents.card(
  child: OsmeaComponents.padding(
    padding: context.paddingMedium,
    child: OsmeaComponents.text('Card content'),
  ),
)
```

### 🏗️ Layout Examples

```dart
// Responsive column layout
OsmeaComponents.column(
  children: [
    OsmeaComponents.text('Header'),
    OsmeaComponents.spacer(),
    OsmeaComponents.text('Content'),
    OsmeaComponents.sizedBox(height: 16),
    OsmeaComponents.button(text: 'Action'),
  ],
)

// Flexible row layout
OsmeaComponents.row(
  children: [
    OsmeaComponents.expanded(
      child: OsmeaComponents.text('Flexible content'),
    ),
    OsmeaComponents.button(text: 'Fixed button'),
  ],
)
```

### 🎯 Form Components

```dart
// Text field with validation
OsmeaComponents.textField(
  controller: _controller,
  label: 'Email',
  variant: TextFieldVariant.outlined,
  type: TextFieldType.email,
  validator: (value) {
    if (value?.isEmpty ?? true) return 'Email is required';
    return null;
  },
)

// Checkbox with label
OsmeaComponents.checkbox(
  value: _isChecked,
  onChanged: (value) => setState(() => _isChecked = value!),
  label: 'I agree to terms',
)
```

---

## 🎨 Customization

### 🎨 Color System

OSMEA provides a comprehensive color system:

```dart
// Primary colors
OsmeaColors.nordicBlue    // Primary brand color
OsmeaColors.white         // Pure white
OsmeaColors.black         // Pure black

// Semantic colors
OsmeaColors.green         // Success states
OsmeaColors.red           // Error states
OsmeaColors.orange        // Warning states
OsmeaColors.blue          // Information states

// Neutral colors
OsmeaColors.gray50        // Lightest gray
OsmeaColors.gray100       // Very light gray
// ... up to gray900
```

---


## 🔧 Configuration

### 📦 Dependencies

The app uses the following key dependencies:

```yaml
dependencies:
  flutter:
    sdk: flutter
  osmea_components:     # Main UI component library
    path: ../
  intl: ^0.18.0         # Internationalization
  url_launcher: ^6.3.1  # URL handling

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^2.0.0  # Code quality
```

### ⚙️ Build Configuration

```bash
# Debug build
flutter build apk --debug

# Release build
flutter build apk --release

# Web build
flutter build web

# iOS build
flutter build ios
```

---

## 🚀 Deployment

### 📱 Mobile Deployment

**iOS:**
```bash
# Build for iOS
flutter build ios --release

# Archive for App Store
# Use Xcode to archive and upload
```

---

## 🤝 Contributing

We welcome contributions! Here's how you can help:

### 🐛 Reporting Issues

1. Check existing issues first
2. Create a new issue with detailed information
3. Include steps to reproduce
4. Add screenshots if applicable

### 💡 Suggesting Features

1. Open a feature request issue
2. Describe the use case
3. Provide mockups if possible
4. Discuss implementation approach

### 🔧 Code Contributions

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

### 📋 Contribution Guidelines

- Follow Dart/Flutter style guidelines
- Write clear commit messages
- Add documentation for new features
- Ensure all tests pass
- Update examples if needed

---

## 📄 License

<div align="center">

> 🔐 **License:** GNU AGPL v3.0  
> 📜 This project is protected under the **GNU Affero General Public License v3.0**.  
> If you modify and deploy this project publicly, you must also **publish your changes** under the same license.

📎 Full details available in the [`LICENSE`](https://github.com/masterfabric-mobile/osmea/blob/dev/LICENSE) file.

</div>

---
**Built with ❤️ by the OSMEA Team**

© 2025 MasterFabric Mobile • Maintained by the OSMEA Engineering Team
