# Sections Folder Template

This folder contains individual content sections that make up the component showcase.

## Required Files

### 1. `header_section.dart`
**Purpose**: Component header with title and configuration chips
**Content**:
- Component name and description
- Current configuration info chips (variant, size, state)
- Visual summary of active settings

### 2. `variant_info_section.dart`
**Purpose**: Information about the current component variant
**Content**:
- Current variant name and description
- Explanation of when to use this variant
- Visual characteristics of the variant

### 3. `size_info_section.dart`
**Purpose**: Information about the current component size
**Content**:
- Current size name and description
- Dimensions and spacing details
- Best use cases for this size

### 4. `usage_guidelines_section.dart`
**Purpose**: Best practices and usage guidelines
**Content**:
- Do's and don'ts
- Accessibility guidelines
- Implementation tips
- Common mistakes to avoid

### 5. `sample_content_section.dart`
**Purpose**: Example content and sample implementations
**Content**:
- Sample cards or content items
- Example usage in different contexts
- Demonstration content

## File Structure Example
```
sections/
├── header_section.dart              # Title and config chips
├── variant_info_section.dart        # Current variant details
├── size_info_section.dart          # Current size details
├── usage_guidelines_section.dart    # Best practices
└── sample_content_section.dart     # Example content
```

## Implementation Guidelines

### All Sections Should:
- Be StatelessWidget classes
- Accept necessary parameters (variant, size, etc.)
- Use consistent styling and spacing
- Be focused on a single responsibility
- Import shared widgets from `../widgets/`

### Section Container
- Use consistent Card or Container styling
- Apply standard padding and margins
- Include section titles and descriptions
- Maintain visual hierarchy

### Content Guidelines
- Keep sections focused and concise
- Use clear, descriptive text
- Include visual examples where helpful
- Maintain consistency across all sections

## Naming Conventions
- Use snake_case for file names
- End all files with `_section.dart`
- Use PascalCase for class names
- Be descriptive but concise in naming
