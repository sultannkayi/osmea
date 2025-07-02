# Showcase Folder Template

This folder contains the main showcase widgets that orchestrate the component demo.

## Required Files

### 1. `{component}_showcase_widget.dart`
**Purpose**: Main showcase widget that coordinates all sections
**Responsibilities**:
- Accept parameters from Storybook knobs
- Render the component being showcased
- Organize and display all content sections
- Handle component state and interactions

### 2. `unified_{component}_showcase.dart`
**Purpose**: Storybook story definition with knobs configuration
**Responsibilities**:
- Define the Story for Storybook
- Configure all interactive knobs (variant, size, state, etc.)
- Pass knob values to the showcase widget
- Provide story name and description

## File Structure Example
```
showcase/
├── button_showcase_widget.dart       # Main showcase orchestrator
└── unified_button_showcase.dart      # Storybook story definition
```

## Implementation Guidelines

### Showcase Widget
- Should be a StatelessWidget
- Accept all configurable properties as constructor parameters
- Use Scaffold for layout (AppBar components use appBar, others use body)
- Organize content in logical sections using Column/SingleChildScrollView
- Import and use section widgets from `../sections/`

### Unified Showcase
- Import the showcase widget
- Define a List<Story> function that returns the story
- Use context.knobs for all interactive controls
- Group related knobs logically
- Use descriptive labels with emojis for better UX

## Naming Conventions
- Use snake_case for file names
- Include component name in all files
- Use PascalCase for class names
- Prefix showcase classes with component name
