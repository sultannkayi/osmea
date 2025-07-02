# 🏗️ OSMEA Storybook - Modular Component Templates

This directory contains templates and tools for creating modular component showcases in the OSMEA Storybook.

## 📁 Contents

### 🔍 Validation Tools  
- `storybook_validator.dart` - Unified validator that scans all components automatically
- Run with: `dart storybook_validator.dart`

### 🏗️ Generation Tools
- `create_component_structure.sh` - Creates folder structure for new components
- Run with: `./create_component_structure.sh <component_name>`

### 📂 Template Structure
- `component_template/` - Empty folder structure template
  - Contains only the required folder structure
  - Ready to copy for new components

## 🚀 Quick Start

### 1. Validate All Components
```bash
# Automatically scan and validate all components
dart storybook_validator.dart
```

### 2. Create New Component Structure
```bash
# Generate folder structure
./create_component_structure.sh button
```

## 📏 Standard Structure

Every modular component must follow this structure:

```
{component_name}_test_modular/
├── {component_name}s.dart              # Main aggregator
├── showcase/                           # Main showcase widgets
├── sections/                           # Content sections
├── widgets/                            # Reusable UI components
├── data/                               # Static data
└── utils/                              # Helper utilities
```

## ✅ Validation Rules

The validator automatically reads the `_templates/component_template/` structure to determine:

1. ✅ Required folders (dynamically detected from template)
2. ✅ Required files: Main aggregator, showcase widgets, unified story
3. ✅ Recommended files: Standard patterns for each folder type
4. ✅ Naming conventions and compliance levels

## 🎯 Current Status

As of last check:
- **🆕 Modular Components**: 1 (appbar)
- **📜 Single-file Components**: 7 (need migration)
- **📊 Compliance Rate**: 100% (for modular components)

---

**🎯 This template system ensures consistency and maintainability across all OSMEA component showcases!**
