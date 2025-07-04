/// 🔢 **OSMEA Component Enums**
///
/// Copyright (c) 2025, OSMEA Team
/// https://github.com/masterfabric-mobile/osmea/tree/dev/packages/components
///
/// Common enum definitions shared across all component types.
/// These enums ensure consistent behavior and styling options.
///
/// {@category Enums}
/// {@subCategory Components}
///
/// Enums:
/// * 📏 ComponentSize - Universal size variants
/// * 🎨 ComponentVariant - Semantic style variants
/// * 🔄 ComponentState - Interactive states
/// * 🖼️ ComponentAppearance - Visual styling options
/// * 📍 ComponentPosition - Position options
/// * 📊 ComponentDensity - Spacing density options
///
/// ```dart
/// OsmeaComponent(
///   size: ComponentSize.medium,
///   variant: ComponentVariant.primary,
///   state: ComponentState.enabled,
/// )
/// ```

/// 📏 **Component Size**
///
/// Universal size variants that can be used across all components.
/// Provides consistent sizing hierarchy throughout the design system.
///
/// **Size Guidelines:**
/// - `extraSmall`: Minimal size for tight spaces
/// - `small`: Compact size for supporting elements
/// - `medium`: Standard size for most use cases
/// - `large`: Prominent size for important elements
/// - `extraLarge`: Hero size for critical elements
///
/// **Usage:**
/// ```dart
/// OsmeaButton(
///   size: ComponentSize.medium, // Standard size
///   child: Text('Button'),
/// )
/// ```
enum ComponentSize {
  /// 🔹 **Extra Small** - Compact elements for constrained spaces
  /// - Use for: Tags, chips, indicators, tight layouts
  extraSmall,

  /// 🔸 **Small** - Supporting elements with modest presence
  /// - Use for: Secondary actions, form controls, inline elements
  small,

  /// 🔶 **Medium** - Standard size for most interfaces (default)
  /// - Use for: Primary UI elements, standard controls
  medium,

  /// 🔷 **Large** - Prominent elements that need emphasis
  /// - Use for: Important actions, featured content, CTAs
  large,

  /// 🔵 **Extra Large** - Hero elements with maximum impact
  /// - Use for: Hero sections, critical actions, promotional content
  extraLarge,
}

/// 🎨 **Component Variant**
///
/// Common visual variants that can be applied to various components.
/// Provides semantic meaning and consistent styling.
///
/// **Variant Guidelines:**
/// - `primary`: Main actions and primary elements
/// - `secondary`: Supporting elements and alternatives
/// - `success`: Positive feedback and confirmation
/// - `warning`: Caution and attention-needed indicators
/// - `danger`: Error states and destructive actions
/// - `info`: Informational and neutral messaging
///
/// **Usage:**
/// ```dart
/// OsmeaAlert(
///   variant: ComponentVariant.warning,
///   message: 'Please review before continuing',
/// )
/// ```
enum ComponentVariant {
  /// 🔵 **Primary** - Main actions and primary elements
  /// - Use for: Main CTAs, critical paths, brand elements
  primary,

  /// 🔘 **Secondary** - Supporting elements and alternatives
  /// - Use for: Alternative actions, supporting UI elements
  secondary,

  /// ✅ **Success** - Positive feedback and confirmation
  /// - Use for: Confirmations, completions, positive outcomes
  success,

  /// ⚠️ **Warning** - Caution and attention-needed indicators
  /// - Use for: Warning notifications, cautionary messages
  warning,

  /// 🚨 **Danger** - Error states and destructive actions
  /// - Use for: Errors, destructive actions, critical alerts
  danger,

  /// ℹ️ **Info** - Informational and neutral messaging
  /// - Use for: Hints, tips, general information
  info,
}

/// 🔄 **Component State**
///
/// Interactive states that can apply to any component.
/// Controls component responsiveness and appearance based on interaction.
///
/// **State Guidelines:**
/// - `idle`: Default, resting state
/// - `hovered`: Mouse pointer is over the component
/// - `focused`: Component has keyboard focus
/// - `pressed`: Currently being clicked/touched
/// - `disabled`: Non-interactive, unavailable
/// - `loading`: Processing, waiting for completion
/// - `active`: Currently selected or active state
/// - `error`: Has an error or invalid state
///
/// **Usage:**
/// ```dart
/// OsmeaInput(
///   state: hasError ? ComponentState.error : ComponentState.idle,
///   value: inputValue,
/// )
/// ```
enum ComponentState {
  /// 🔄 **Idle** - Default resting state
  /// - Normal appearance, ready for interaction
  idle,

  /// 👆 **Hovered** - Mouse is hovering over component
  /// - Subtle visual feedback for potential interaction
  hovered,

  /// 🎯 **Focused** - Has keyboard/input focus
  /// - Clear indication of current focus target
  focused,

  /// 👇 **Pressed** - Currently being clicked/touched
  /// - Immediate tactile feedback for user action
  pressed,

  /// ⚫ **Disabled** - Not interactive
  /// - Visually muted, prevents interaction
  disabled,

  /// 🔄 **Loading** - Processing or waiting
  /// - Shows activity indicator, temporarily non-interactive
  loading,

  /// ✅ **Active** - Selected or current item
  /// - Visually emphasized to show current selection
  active,

  /// ❌ **Error** - Has error or invalid state
  /// - Visually indicates problem requiring attention
  error,
}

/// 🖼️ **Component Appearance**
///
/// Visual styling options for components.
/// Controls how components are visually presented.
///
/// **Appearance Guidelines:**
/// - `filled`: Solid background color
/// - `outlined`: Border with transparent background
/// - `ghost`: Minimal styling with no background or border
/// - `elevated`: Includes shadow/elevation effect
/// - `flat`: No elevation, flat appearance
///
/// **Usage:**
/// ```dart
/// OsmeaCard(
///   appearance: ComponentAppearance.elevated,
///   child: content,
/// )
/// ```
enum ComponentAppearance {
  /// 🎨 **Filled** - Solid background color
  /// - Strong visual presence with background color
  filled,

  /// 📦 **Outlined** - Border with transparent background
  /// - Defined boundary with clean interior
  outlined,

  /// 👻 **Ghost** - Minimal styling
  /// - Subtle presence with minimal visual weight
  ghost,

  /// 🔝 **Elevated** - Includes shadow/elevation
  /// - Appears raised above the surface
  elevated,

  /// 📄 **Flat** - No elevation or shadow
  /// - Appears flush with the surface
  flat,
}

/// 📍 **Component Position**
///
/// Positioning options for elements within components.
/// Controls where elements are placed relative to each other.
///
/// **Position Guidelines:**
/// - `start`: Beginning of main axis
/// - `center`: Middle of main axis
/// - `end`: End of main axis
/// - `top`: Top edge
/// - `bottom`: Bottom edge
/// - `left`: Left edge (or start in LTR)
/// - `right`: Right edge (or end in LTR)
///
/// **Usage:**
/// ```dart
/// OsmeaDialog(
///   buttonPosition: ComponentPosition.end,
///   content: dialogContent,
/// )
/// ```
enum ComponentPosition {
  /// ⬆️ **Top** - Top edge
  /// - Placed at the top of the container
  top,

  /// ⬇️ **Bottom** - Bottom edge
  /// - Placed at the bottom of the container
  bottom,

  /// ⬅️ **Left** - Left edge
  /// - Placed at the left of the container
  left,

  /// ➡️ **Right** - Right edge
  /// - Placed at the right of the container
  right,

  /// 🔄 **Start** - Beginning of reading direction
  /// - Respects text direction (LTR/RTL)
  start,

  /// 🔄 **End** - End of reading direction
  /// - Respects text direction (LTR/RTL)
  end,

  /// ⭕ **Center** - Centered position
  /// - Placed in the center of the container
  center,
}

/// 📊 **Component Density**
///
/// Controls spacing and sizing density within components.
/// Allows components to adapt to different space constraints.
///
/// **Density Guidelines:**
/// - `compact`: Reduced spacing for tight layouts
/// - `standard`: Default spacing for most interfaces
/// - `comfortable`: Increased spacing for relaxed layouts
///
/// **Usage:**
/// ```dart
/// OsmeaDataTable(
///   density: ComponentDensity.compact,
///   data: tableData,
/// )
/// ```
enum ComponentDensity {
  /// 🤏 **Compact** - Minimal spacing
  /// - Reduced padding and spacing for tight layouts
  compact,

  /// 📏 **Standard** - Default spacing
  /// - Balanced spacing suitable for most interfaces
  standard,

  /// 🛋️ **Comfortable** - Generous spacing
  /// - More padding and spacious layout
  comfortable,
}

/// 📱 **Component Orientation**
///
/// Direction/orientation options for component layouts.
/// Controls how elements are arranged within a component.
///
/// **Orientation Guidelines:**
/// - `horizontal`: Elements arranged in a row
/// - `vertical`: Elements arranged in a column
///
/// **Usage:**
/// ```dart
/// OsmeaButtonGroup(
///   orientation: ComponentOrientation.horizontal,
///   buttons: [button1, button2],
/// )
/// ```
enum ComponentOrientation {
  /// ↔️ **Horizontal** - Row layout
  /// - Elements arranged side by side
  horizontal,

  /// ↕️ **Vertical** - Column layout
  /// - Elements arranged top to bottom
  vertical,
}

/// 🌓 **Component Theme Mode**
///
/// Theme mode options for components.
/// Controls light/dark appearance of components.
///
/// **Theme Guidelines:**
/// - `light`: Light mode styling (default)
/// - `dark`: Dark mode styling
/// - `system`: Follows system settings
///
/// **Usage:**
/// ```dart
/// OsmeaComponent(
///   themeMode: ComponentThemeMode.dark,
///   child: content,
/// )
/// ```
enum ComponentThemeMode {
  /// ☀️ **Light** - Light theme
  /// - Bright backgrounds with dark text
  light,

  /// 🌙 **Dark** - Dark theme
  /// - Dark backgrounds with light text
  dark,

  /// 🔄 **System** - Follow system setting
  /// - Adapts based on device settings
  system,
}

/// 🎯 **Component Alignment**
///
/// Alignment options for component contents.
/// Controls how content is aligned within a component.
///
/// **Alignment Guidelines:**
/// - `start`: Aligned to the start
/// - `center`: Centered alignment
/// - `end`: Aligned to the end
/// - `stretch`: Stretched to fill space
/// - `spaceBetween`: Equal spacing between elements
///
/// **Usage:**
/// ```dart
/// OsmeaToolbar(
///   alignment: ComponentAlignment.spaceBetween,
///   items: toolbarItems,
/// )
/// ```
enum ComponentAlignment {
  /// ⬅️ **Start** - Beginning alignment
  /// - Content aligned to start of container
  start,

  /// ⭕ **Center** - Center alignment
  /// - Content centered in container
  center,

  /// ➡️ **End** - End alignment
  /// - Content aligned to end of container
  end,

  /// 📏 **Stretch** - Fill available space
  /// - Content stretched to fill container
  stretch,

  /// 🔄 **Space Between** - Equal spacing
  /// - Equal space between elements, none at ends
  spaceBetween,

  /// 🔄 **Space Around** - Distributed spacing
  /// - Equal space around elements (half-space at ends)
  spaceAround,

  /// 🔄 **Space Evenly** - Even spacing
  /// - Equal space between elements and at ends
  spaceEvenly,
}

/// 🎭 **Component Emphasis**
///
/// Visual emphasis levels for components.
/// Controls how much attention a component draws.
///
/// **Emphasis Guidelines:**
/// - `subtle`: Minimal visual weight
/// - `low`: Reduced visual weight
/// - `medium`: Standard visual weight
/// - `high`: Increased visual weight
/// - `critical`: Maximum visual weight
///
/// **Usage:**
/// ```dart
/// OsmeaBadge(
///   emphasis: ComponentEmphasis.high,
///   label: 'New',
/// )
/// ```
enum ComponentEmphasis {
  /// 🤫 **Subtle** - Very low emphasis
  /// - Barely noticeable, background information
  subtle,

  /// 🔽 **Low** - Reduced emphasis
  /// - Supporting elements, secondary information
  low,

  /// 🔶 **Medium** - Standard emphasis
  /// - Normal interface elements
  medium,

  /// 🔼 **High** - Increased emphasis
  /// - Important elements, primary CTAs
  high,

  /// 🚨 **Critical** - Maximum emphasis
  /// - Critical alerts, destructive actions
  critical,
}

/// 🔤 **TextField Size**
///
/// Size variants for text input fields.
/// Controls height, padding, and font size of text fields.
///
/// **Size Guidelines:**
/// - `extraSmall`: Compact text fields for tight spaces
/// - `small`: Reduced size for secondary inputs
/// - `medium`: Standard size for most forms (default)
/// - `large`: Prominent size for important inputs
/// - `extraLarge`: Hero size for primary form fields
///
/// **Usage:**
/// ```dart
/// OsmeaComponents.textField(
///   size: TextFieldSize.medium,
///   label: 'Email',
/// )
/// ```
enum TextFieldSize {
  /// 🔹 **Extra Small** - Compact text fields
  /// - Height: ~32px
  /// - Font: 12px
  /// - Use for: Inline editing, table cells, compact forms
  extraSmall,

  /// 🔸 **Small** - Reduced size text fields
  /// - Height: ~36px
  /// - Font: 13px
  /// - Use for: Secondary inputs, filter fields
  small,

  /// 🔶 **Medium** - Standard text fields (default)
  /// - Height: ~44px
  /// - Font: 14px
  /// - Use for: Most form inputs, standard UI
  medium,

  /// 🔷 **Large** - Prominent text fields
  /// - Height: ~52px
  /// - Font: 16px
  /// - Use for: Important inputs, mobile-first design
  large,

  /// 🔵 **Extra Large** - Hero text fields
  /// - Height: ~60px
  /// - Font: 18px
  /// - Use for: Primary forms, hero sections
  extraLarge,
}

/// 🎨 **TextField Variant**
///
/// Visual style variants for text input fields.
/// Controls the appearance and styling of text fields.
///
/// **Variant Guidelines:**
/// - `outlined`: Border with transparent background
/// - `filled`: Solid background with subtle border
/// - `underlined`: Bottom border only, minimal style
/// - `borderless`: No border, background only
///
/// **Usage:**
/// ```dart
/// OsmeaComponents.textField(
///   variant: TextFieldVariant.outlined,
///   label: 'Username',
/// )
/// ```
enum TextFieldVariant {
  /// 📦 **Outlined** - Border with transparent background
  /// - Clear boundary definition
  /// - Good for forms and structured layouts
  outlined,

  /// 🎨 **Filled** - Solid background with subtle border
  /// - Emphasized input area
  /// - Good for modern, card-based designs
  filled,

  /// 📝 **Underlined** - Bottom border only
  /// - Minimal, clean appearance
  /// - Good for simple forms and clean designs
  underlined,

  /// 👻 **Borderless** - No border, background only
  /// - Seamless integration
  /// - Good for inline editing and minimal interfaces
  borderless,
}

/// 🔄 **TextField State**
///
/// Interactive and validation states for text input fields.
/// Controls appearance based on user interaction and validation.
///
/// **State Guidelines:**
/// - `enabled`: Normal interactive state
/// - `disabled`: Non-interactive state
/// - `focused`: Has keyboard focus
/// - `error`: Has validation error
/// - `success`: Validation passed
/// - `warning`: Requires attention
///
/// **Usage:**
/// ```dart
/// OsmeaComponents.textField(
///   state: hasError ? TextFieldState.error : TextFieldState.enabled,
///   errorText: errorMessage,
/// )
/// ```
enum TextFieldState {
  /// ✅ **Enabled** - Normal interactive state
  /// - Ready for user input
  /// - Default appearance
  enabled,

  /// ⚫ **Disabled** - Non-interactive state
  /// - Grayed out appearance
  /// - No user interaction possible
  disabled,

  /// 🎯 **Focused** - Has keyboard focus
  /// - Highlighted border/background
  /// - Active input state
  focused,

  /// ❌ **Error** - Has validation error
  /// - Red/error coloring
  /// - Shows error message
  error,

  /// ✅ **Success** - Validation passed
  /// - Green/success coloring
  /// - Positive feedback
  success,

  /// ⚠️ **Warning** - Requires attention
  /// - Yellow/warning coloring
  /// - Cautionary message
  warning,
}

/// 🎯 **TextField Type**
///
/// Input types that determine keyboard and behavior.
/// Automatically configures appropriate keyboard and validation.
///
/// **Type Guidelines:**
/// - `text`: General text input
/// - `email`: Email address with email keyboard
/// - `password`: Password with obscured text
/// - `number`: Numeric input with number keyboard
/// - `phone`: Phone number with phone keyboard
/// - `url`: URL input with URL keyboard
/// - `search`: Search input with search keyboard
/// - `multiline`: Multi-line text area
///
/// **Usage:**
/// ```dart
/// OsmeaComponents.textField(
///   type: TextFieldType.email,
///   label: 'Email Address',
/// )
/// ```
enum TextFieldType {
  /// 📝 **Text** - General text input
  /// - Standard text keyboard
  /// - No special formatting
  text,

  /// 📧 **Email** - Email address input
  /// - Email keyboard with @ symbol
  /// - Email validation support
  email,

  /// 🔒 **Password** - Password input
  /// - Obscured text display
  /// - Security-focused keyboard
  password,

  /// 🔢 **Number** - Numeric input
  /// - Number keyboard
  /// - Numeric validation
  number,

  /// 📱 **Phone** - Phone number input
  /// - Phone keyboard
  /// - Phone formatting support
  phone,

  /// 🌐 **URL** - URL input
  /// - URL keyboard with shortcuts
  /// - URL validation support
  url,

  /// 🔍 **Search** - Search input
  /// - Search keyboard
  /// - Search action button
  search,

  /// 📄 **Multiline** - Multi-line text area
  /// - Multiline text input
  /// - Expanded height support
  multiline,

  /// 🔢 **OTP** - One-Time Password input
  /// - Numeric keyboard
  /// - Single digit input fields
  /// - Auto-navigation between fields
  otp,
}

/// 🔍 **Searchbar Variant**
///
/// Visual style variants for search input fields.
/// Controls the appearance and styling of search bars.
///
/// **Variant Guidelines:**
/// - `outlined`: Border with transparent background
/// - `filled`: Solid background with subtle border
/// - `underlined`: Bottom border only, minimal style
/// - `borderless`: No border, background only
/// - `rounded`: Rounded corners with background
///
/// **Usage:**
/// ```dart
/// OsmeaComponents.searchbar(
///   variant: SearchbarVariant.outlined,
///   hint: 'Search...',
/// )
/// ```
enum SearchbarVariant {
  /// 📦 **Outlined** - Border with transparent background
  /// - Clear boundary definition
  /// - Good for forms and structured layouts
  outlined,

  /// 🎨 **Filled** - Solid background with subtle border
  /// - Emphasized input area
  /// - Good for modern, card-based designs
  filled,

  /// 📝 **Underlined** - Bottom border only
  /// - Minimal, clean appearance
  /// - Good for simple forms and clean designs
  underlined,

  /// 👻 **Borderless** - No border, background only
  /// - Seamless integration
  /// - Good for inline editing and minimal interfaces
  borderless,

  /// 🔵 **Rounded** - Rounded corners with background
  /// - Modern, pill-shaped appearance
  /// - Good for mobile-first designs and modern interfaces
  rounded,
}

/// 🎨 **Searchbar Style**
///
/// Functional style variants for search bars.
/// Controls the behavior and layout of search components.
///
/// **Style Guidelines:**
/// - `standard`: Default search bar with search icon and clear button
/// - `minimal`: Simplified search bar with just search icon
/// - `expanded`: Full-width search bar with suggestions
/// - `compact`: Small search bar for tight spaces
/// - `hero`: Large, prominent search bar for main search
///
/// **Usage:**
/// ```dart
/// OsmeaComponents.searchbar(
///   style: SearchbarStyle.standard,
///   hint: 'Search products...',
/// )
/// ```
enum SearchbarStyle {
  /// 🔍 **Standard** - Default search bar
  /// - Search icon on left, clear button on right
  /// - Standard height and padding
  /// - Good for most search use cases
  standard,

  /// 🔹 **Minimal** - Simplified search bar
  /// - Only search icon, no clear button
  /// - Compact appearance
  /// - Good for secondary search areas
  minimal,

  /// 🔷 **Expanded** - Full-featured search bar
  /// - Search icon, clear button, and suggestions
  /// - Larger size for prominent search
  /// - Good for main search functionality
  expanded,

  /// 🔸 **Compact** - Small search bar
  /// - Reduced size for tight spaces
  /// - Minimal padding and icons
  /// - Good for headers and toolbars
  compact,

  /// 🔵 **Hero** - Large, prominent search bar
  /// - Maximum size and visual impact
  /// - Enhanced styling and animations
  /// - Good for landing pages and main search
  hero,
}

/// 📏 **Expand Direction**
///
/// Direction options for expandable components.
/// Controls how components expand or collapse.
///
/// **Direction Guidelines:**
/// - `left`: Expand towards the left
/// - `right`: Expand towards the right (default)
/// - `up`: Expand upwards
/// - `down`: Expand downwards
///
/// **Usage:**
/// ```dart
/// OsmeaComponents.expandableSearchbar(
///   expandDirection: ExpandDirection.right,
///   onSearch: (query) => performSearch(query),
/// )
/// ```
enum ExpandDirection {
  /// ⬅️ **Left** - Expand towards the left
  /// - Good for right-aligned components
  /// - Common in app bars and headers
  left,

  /// ➡️ **Right** - Expand towards the right (default)
  /// - Good for left-aligned components
  /// - Most common expansion direction
  right,

  /// ⬆️ **Up** - Expand upwards
  /// - Good for bottom-aligned components
  /// - Useful in floating action buttons
  up,

  /// ⬇️ **Down** - Expand downwards
  /// - Good for top-aligned components
  /// - Common in dropdown menus
  down,
}
