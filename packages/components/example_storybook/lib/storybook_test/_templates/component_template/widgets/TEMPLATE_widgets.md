# Widgets Folder Template

This folder contains reusable UI components used across the showcase.

## Required Files

### 1. `info_chip_widget.dart` (Shared across all components)
**Purpose**: Display configuration information in chip format
**Usage**:
- Show current variant, size, state
- Display key-value pairs
- Consistent styling across all showcases
- Reusable across all component showcases

### 2. `section_container_widget.dart` (Shared across all components)
**Purpose**: Consistent container styling for sections
**Usage**:
- Wrap section content with standard styling
- Provide consistent spacing and elevation
- Maintain visual hierarchy
- Standard Card/Container behavior

### 3. `{component}_example_widget.dart` (Component-specific)
**Purpose**: Component-specific example widgets
**Usage**:
- Demonstrate different component configurations
- Show component in various states
- Provide interactive examples
- Component-specific styling and behavior

## File Structure Example
```
widgets/
├── info_chip_widget.dart              # Shared info chips
├── section_container_widget.dart      # Shared section containers
└── button_example_widget.dart         # Button-specific examples
```

## Implementation Guidelines

### Shared Widgets (info_chip, section_container)
- Should be highly reusable
- Minimal dependencies
- Consistent styling
- Well-documented APIs
- Copy from existing modular components

### Component-Specific Widgets
- Focus on component demonstration
- Show different states and variants
- Interactive where appropriate
- Component-specific styling

### Widget Design Principles
- Single responsibility
- Reusable and composable
- Consistent styling
- Clear, simple APIs
- Minimal external dependencies

## Naming Conventions
- Use snake_case for file names
- End with `_widget.dart`
- Use PascalCase for class names
- Be descriptive about widget purpose

## Reusability Strategy
- Copy shared widgets from existing modular components
- Create component-specific widgets for unique needs
- Keep widgets focused and simple
- Document widget APIs clearly
