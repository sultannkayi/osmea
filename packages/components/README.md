# �� OSMEA Components

<div align="center">

[![Flutter](https://img.shields.io/badge/Flutter-3.19.0+-blue?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-2.17.0+-blue?logo=dart)](https://dart.dev)
[![License](https://img.shields.io/badge/License-GNU%20AGPL%20v3.0-green.svg)](LICENSE)

**A powerful, mobile-first Flutter UI library built for e-commerce.**  
**Modular. Themed. Ready to scale.**

[🚀 Live Demo](https://osmea-app.web.app) • [📚 Documentation](https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components) • [🐛 Report Issues](https://github.com/masterfabric-mobile/osmea/issues)

</div>

---

## 📦 What's Inside?

### ✔️ 50+ Production-ready Components  
From layout scaffolds to dynamic carousels and complex form controls.

### ✔️ Built-in Theming System  
Powered by design tokens and Material 3. Global consistency, effortless customization.

### ✔️ Mobile-first Design  
Optimized for high-performance e-commerce interfaces.

### ✔️ Variants, Sizes & Styles  
Each component is fully customizable with sensible defaults.

---

## 🗂️ Project Examples

OSMEA provides two main example environments to help you get started:

### 📖 Storybook Example
**Path:** `packages/components/example_storybook/`

Interactive playground for all OSMEA components with live property controls, code snippets, and design guidelines.

**Key Features:**
- Live component demos with real-time property changes
- Code examples and copy-paste snippets
- Design guidelines and best practices
- Modular templates for new components
- Device frame previews

**Run it:**
```bash
cd packages/components/example_storybook
flutter run
```

### 📱 Mobile Example
**Path:** `packages/components/example_mobile/`

Real-world mobile app examples using OSMEA components in practical, production-like flows.

**Features:**
- Complete app screens (login, product grid, checkout, etc.)
- Asset and theme integration
- Demonstrates best practices for app structure

**Run it:**
```bash
cd packages/components/example_mobile
flutter run
```

---

## 🏗️ Package Structure

```
packages/components/
├── lib/
│   ├── osmea_components.dart          # Main export file
│   └── src/
│       ├── components/                # Individual component implementations
│       │   ├── align/                 # Alignment widget
│       │   ├── appbar/                # AppBar components
│       │   ├── avatar/                # Avatar components
│       │   ├── badge/                 # Badge components
│       │   ├── bottom_sheet/          # Bottom sheet components
│       │   ├── buttons/               # Button components
│       │   ├── cards/                 # Card components
│       │   ├── carousel/              # Carousel/slider components
│       │   ├── center/                # Center widget
│       │   ├── checkbox/              # Checkbox components
│       │   ├── chips/                 # Chips components
│       │   ├── clip_r_rect/           # Clipping widgets
│       │   ├── column/                # Column widget
│       │   ├── container/             # Container widget
│       │   ├── divider/               # Divider components
│       │   ├── dropdown/              # Dropdown components
│       │   ├── expanded/              # Expanded widget
│       │   ├── fitted_box/            # FittedBox widget
│       │   ├── flexible/              # Flexible widget
│       │   ├── footer/                # Footer components
│       │   ├── list_item/             # List item components
│       │   ├── loading/               # Loading indicators
│       │   ├── login_button/          # Login button with auth logic
│       │   ├── navbar/                # Navigation bar components
│       │   ├── padding/               # Padding widget
│       │   ├── popup/                 # Popup/modal components
│       │   ├── positioned/            # Positioned widget
│       │   ├── progress/              # Progress indicators
│       │   ├── radio_button/          # Radio button components
│       │   ├── rich_text/             # Rich text and text span
│       │   ├── row/                   # Row widget
│       │   ├── scaffold/              # Scaffold/page layout
│       │   ├── searchbar/             # Search bar components
│       │   ├── single_child_scroll_view/ # Scroll view
│       │   ├── sized_box/             # SizedBox widget
│       │   ├── spacer/                # Spacer widget
│       │   ├── stack/                 # Stack widget
│       │   ├── stepper/               # Stepper components
│       │   ├── switch_button/         # Switch components
│       │   ├── tabbar/                # Tab bar components
│       │   ├── text/                  # Text components
│       │   ├── text_field/            # Text field, OTP, search
│       │   ├── ticket_widget/         # Ticket creation widget
│       │   ├── toast/                 # Toast/alert components
│       │   └── wrap/                  # Wrap widget
│       ├── core/                      # Core functionality and shared logic
│       ├── enums/                     # Component variants, sizes, and state enums
│       ├── styles/                    # Text styles and color definitions
│       ├── theme/                     # Theme system and design tokens
│       └── utils/                     # Extension methods and utility functions
├── example_storybook/                 # Interactive component showcase
└── example_mobile/                    # Mobile app examples
```

---

## 🎯 Component Categories

### 🔲 Layout & Structure
| Component           | Description                                              |
|---------------------|----------------------------------------------------------|
| `Container`         | Flexible box with styling capabilities                  |
| `Row / Column`      | Arrange widgets horizontally or vertically              |
| `Stack`             | Overlay widgets on top of each other                    |
| `Scaffold`          | Provides page structure with app bar and body           |
| `Padding / SizedBox`| Space and dimension helpers                             |
| `Align / Center`    | Alignment and centering utilities                       |
| `Expanded / Flexible / Spacer / Wrap` | Advanced layout and spacing           |

### 🎨 UI Elements
| Component   | Description                                      |
|-------------|--------------------------------------------------|
| `Avatar`    | User images with fallback and styling options     |
| `Badge`     | Notification indicators and status tags           |
| `Chips`     | Interactive tags or compact buttons               |
| `Divider`   | Visual separators for content grouping            |
| `Progress`  | Loading indicators and progress bars              |
| `List Item` | Rich list rows with expansion/selection           |

### 📝 Form Controls
| Component       | Description                                           |
|----------------|-------------------------------------------------------|
| `Text Field`      | Basic input with validation support                |
| `OTP Text Field`  | Input field for one-time passwords                 |
| `Checkbox`        | Multi-select toggle option                         |
| `Radio Button`    | Single-select input from a group                   |
| `Switch`          | Binary toggle with on/off states                   |
| `Dropdown`        | Select from a list of options                      |

### 🔘 Interactive Elements
| Component      | Description                                               |
|----------------|-----------------------------------------------------------|
| `Button`        | Action triggers: primary, secondary, icon-based, etc.    |
| `Card`          | Content blocks with optional actions and visuals         |
| `Carousel`      | Swipable image or content sliders                        |
| `Bottom Sheet`  | Modal slide-up panel for actions or content              |
| `Popup`         | Modal windows and overlays for dialogs                   |
| `Toast`         | Temporary alert or success messages                      |

### 🧭 Navigation
| Component   | Description                                      |
|-------------|--------------------------------------------------|
| `AppBar`    | Top bar with title, actions, and navigation      |
| `Navbar`    | Bottom or top navigation menus                   |
| `Stepper`   | Visual step-based navigation flow                |
| `TabBar`    | Tabbed navigation                                |
| `Searchbar` | Search input with suggestions and history        |

### 🎪 Specialized
| Component       | Description                                          |
|----------------|------------------------------------------------------ |
| `Login Button`    | Auth-ready button with prebuilt logic              |
| `Ticket Widget`   | Dynamic ticket creation UI for support flows       |

---

### 🟦 Expandable & Collapsible Components

| Component                | Description                                                       |
|--------------------------|------------------------------------------------------------------ |
| `Expandable List Item`   | Flexible list/menu item acting as expansion panel                 |
| `Expandable Searchbar`   | Searchbar that expands from an icon/button into a full search UI  |

**Key Features:**
- Multi-level nesting and smooth animation
- State control: `initiallyExpanded`, `expanded`, `onExpansionChanged`, `maintainState`
- Customizable expand/collapse icons
- Supports all standard searchbar features (suggestions, history, etc.)
- Themeable and highly customizable



**Expandable Searchbar:**
```dart
OsmeaComponents.expandableSearchbar(
  onSearch: (query) => performSearch(query),
  expandDirection: ExpandDirection.right,
  expandWidth: 300,
)
```

---

## 🚀 Quick Start

### Installation
Add the package to your `pubspec.yaml`:
```yaml
dependencies:
  osmea_components:
    git:
      url: https://github.com/masterfabric-mobile/osmea.git
      ref: dev
      path: packages/components
```

### Import and Usage
```dart
import 'package:osmea_components/osmea_components.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: OsmeaTheme.lightTheme, // Use OSMEA theme
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.scaffold(
      appBar: OsmeaComponents.appBar(
        title: OsmeaComponents.text('My E-commerce App'),
        actions: [
          AppBarAction(
            icon: Icon(Icons.search),
            onPressed: () => print('Search tapped'),
          ),
        ],
      ),
      body: OsmeaComponents.column(
        children: [
          OsmeaComponents.button(
            text: 'Shop Now',
            variant: ButtonVariant.primary,
            size: ButtonSize.large,
            onPressed: () => print('Shop button tapped'),
          ),
          OsmeaComponents.spacer(),
          OsmeaComponents.basicCard(
            title: 'Featured Product',
            subtitle: 'Limited Time Offer',
            content: 'Get 20% off on all electronics!',
            onTap: () => print('Card tapped'),
          ),
        ],
      ),
    );
  }
}
```

---

## 🧩 Core Architecture

- **Core (`lib/src/core/`)**: Abstract widgets, basic layout and behavior infrastructure for all components
- **Enums (`lib/src/enums/`)**: Central enum definitions for size, variant, state, style options for all components
- **Styles (`lib/src/styles/`)**: Color palettes, typography and other style constants
- **Utils (`lib/src/utils/`)**: Frequently used helper functions, extensions and component-specific helpers

---

## 💡 Basic Examples

### Simple Login Form
```dart
class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.container(
      padding: EdgeInsets.all(24),
      child: OsmeaComponents.column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          OsmeaComponents.text(
            'Welcome Back',
            variant: OsmeaTextVariant.headlineMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 32),
          OsmeaComponents.textField(
            controller: _emailController,
            label: 'Email Address',
            keyboardType: TextInputType.emailAddress,
            prefixIcon: Icon(Icons.email_outlined),
          ),
          SizedBox(height: 16),
          OsmeaComponents.textField(
            controller: _passwordController,
            label: 'Password',
            obscureText: true,
            prefixIcon: Icon(Icons.lock_outlined),
          ),
          SizedBox(height: 24),
          OsmeaComponents.loginButton(
            text: 'Sign In',
            variant: ButtonVariant.primary,
            size: ButtonSize.large,
            authService: MyAuthService(),
            getUsername: () => _emailController.text,
            getPassword: () => _passwordController.text,
            onLoginSuccess: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
        ],
      ),
    );
  }
}
```

### Product Card Grid
```dart
class ProductGrid extends StatelessWidget {
  final List<Product> products;
  const ProductGrid({Key? key, required this.products}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return OsmeaComponents.imageCard(
          title: product.name,
          subtitle: '\$${product.price}',
          imageUrl: product.imageUrl,
          variant: ComponentAppearance.elevated,
          onTap: () => Navigator.pushNamed(
            context, 
            '/product', 
            arguments: product,
          ),
          badge: product.isOnSale 
            ? OsmeaComponents.badge(
                content: 'SALE',
                variant: BadgeVariant.danger,
                size: BadgeSize.small,
              )
            : null,
        );
      },
    );
  }
}
```

### Interactive Checkout Stepper
```dart
class CheckoutStepper extends StatefulWidget {
  @override
  _CheckoutStepperState createState() => _CheckoutStepperState();
}

class _CheckoutStepperState extends State<CheckoutStepper> {
  int currentStep = 0;
  
  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.stepper(
      currentStep: currentStep,
      onStepChanged: (step) => setState(() => currentStep = step),
      steps: [
        OsmeaStep(
          label: 'Cart Review',
          content: CartReviewWidget(),
          isActive: currentStep >= 0,
          isCompleted: currentStep > 0,
        ),
        OsmeaStep(
          label: 'Shipping Info',
          content: ShippingFormWidget(),
          isActive: currentStep >= 1,
          isCompleted: currentStep > 1,
        ),
        OsmeaStep(
          label: 'Payment',
          content: PaymentFormWidget(),
          isActive: currentStep >= 2,
          isCompleted: currentStep > 2,
        ),
        OsmeaStep(
          label: 'Confirmation',
          content: OrderConfirmationWidget(),
          isActive: currentStep >= 3,
          isCompleted: currentStep > 3,
        ),
      ],
    );
  }
}
```

---

## 🎨 Interactive Storybook

Explore all components interactively in our comprehensive Storybook:

```bash
cd packages/components/example_storybook
flutter run
```

**Storybook Features:**
- **Live Component Demos** – See components in action with real-time property changes
- **Code Examples** – Copy-paste ready code snippets
- **Design Guidelines** – Best practices and usage recommendations
- **Component Templates** – Easily scaffold new components

---

## 📚 Additional Resources

- **[Component Templates](example_storybook/lib/storybook_test/_templates/)** – Templates for creating new components
- **[Examples](example_mobile/)** – Complete mobile app examples

---

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guidelines](../../CONTRIBUTING.md) for details on:
- Adding new components
- Following our coding standards  
- Testing requirements
- Documentation expectations

---

## 📄 License

> 🔐 **License:** GNU AGPL v3.0  
> 📜 This project is protected under the **GNU Affero General Public License v3.0**.  
> If you modify and deploy this project publicly, you must also **publish your changes** under the same license.

📎 Full details available in the [`LICENSE`](https://github.com/masterfabric-mobile/osmea/blob/dev/LICENSE) file.

---

**Built with ❤️ by the OSMEA Team**

© 2025 MasterFabric Mobile • Maintained by the OSMEA Engineering Team


