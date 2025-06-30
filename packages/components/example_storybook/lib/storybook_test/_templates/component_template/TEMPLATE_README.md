# Component Template - Modular Structure

This template provides the standard modular structure for OSMEA Storybook component showcases.

## 📁 Folder Structure

```
{component_name}_test_modular/
├── {component_name}s.dart              # Main aggregator/entry point
├── showcase/                           # Main showcase widgets
│   ├── {component}_showcase_widget.dart
│   └── unified_{component}_showcase.dart
├── sections/                           # Individual content sections
│   ├── header_section.dart
│   ├── variant_info_section.dart
│   ├── size_info_section.dart
│   ├── usage_guidelines_section.dart
│   └── sample_content_section.dart
├── widgets/                            # Reusable UI components
│   ├── info_chip_widget.dart (shared)
│   ├── section_container_widget.dart (shared)
│   └── {component}_example_widget.dart
├── data/                               # Static data and descriptions
│   ├── {component}_descriptions.dart
│   └── {component}_guidelines.dart
└── utils/                              # Helper utilities
    ├── {component}_builder.dart
    └── knobs_config.dart
```

## 📋 Template Files

Each folder contains a `TEMPLATE_*.md` file with detailed implementation guidelines:

- `showcase/TEMPLATE_showcase.md` - Main showcase widget guidelines
- `sections/TEMPLATE_sections.md` - Content section implementation
- `widgets/TEMPLATE_widgets.md` - Reusable widget guidelines  
- `data/TEMPLATE_data.md` - Static data and configuration
- `utils/TEMPLATE_utils.md` - Helper utilities and knobs

## 🚀 Quick Start

1. **Copy this template structure**:
   ```bash
   cp -r component_template/ ../{component_name}_test_modular/
   ```

2. **Or use the generator**:
   ```bash
   ../create_component_structure.sh {component_name}
   ```

3. **Read the template files** in each folder for implementation details

4. **Replace placeholders** with your actual component name

5. **Implement the files** following the guidelines in each template

6. **Validate structure**:
   ```bash
   ../folder_structure_validator.dart {component_name}
   ```

## ✅ Implementation Checklist

### Phase 1: Structure Setup
- [ ] Create/copy folder structure
- [ ] Read all template MD files
- [ ] Understand the modular approach

### Phase 2: Data Layer
- [ ] Implement `data/{component}_descriptions.dart`
- [ ] Implement `data/{component}_guidelines.dart`

### Phase 3: Utils Layer  
- [ ] Implement `utils/{component}_builder.dart`
- [ ] Implement `utils/knobs_config.dart`

### Phase 4: Widgets Layer
- [ ] Copy shared widgets (`info_chip_widget.dart`, `section_container_widget.dart`)
- [ ] Implement `widgets/{component}_example_widget.dart`

### Phase 5: Sections Layer
- [ ] Implement all section files
- [ ] Ensure consistent styling
- [ ] Connect to data and utils

### Phase 6: Showcase Layer
- [ ] Implement main showcase widget
- [ ] Implement unified showcase with knobs
- [ ] Test all functionality

### Phase 7: Integration
- [ ] Create main aggregator file
- [ ] Add to main `testing.dart`
- [ ] Validate and test

## 🎯 Guidelines

- **Keep files under 150 lines** for maintainability
- **Follow naming conventions** consistently
- **Reuse shared widgets** where possible
- **Focus on single responsibility** per file
- **Document complex logic** clearly

---

**📖 Read the TEMPLATE_*.md files in each folder for detailed implementation guidelines!**
