#!/usr/bin/env dart

import 'dart:io';

/// 🔍 **OSMEA Storybook Structure Validator**
/// 
/// Automatically scans all component folders in storybook_test and validates 
/// their structure against the modular template standard.
/// 
/// Usage: dart storybook_validator.dart
class StorybookValidator {
  static const String storybookPath = '/Users/ayberkgorgun/Documents/GitHub/osmea/packages/components/example_mobile/lib/storybook_test';
  static const String templatePath = '/Users/ayberkgorgun/Documents/GitHub/osmea/packages/components/example_mobile/lib/storybook_test/_templates/component_template';
  
  /// Template structure - loaded dynamically from _templates
  static late List<String> requiredFolders;
  static late List<String> requiredFiles;
  static late Map<String, List<String>> recommendedFiles;

  /// 🚀 **Main validation entry point**
  static void validateAll() {
    print('🔍 OSMEA Storybook Structure Validator');
    print('═' * 50);
    
    // Load template structure dynamically
    if (!_loadTemplateStructure()) {
      print('❌ Could not load template structure from _templates folder');
      return;
    }
    
    print('📋 Template structure loaded:');
    print('   📁 Required folders: ${requiredFolders.join(', ')}');
    print('   📄 Required files: ${requiredFiles.length} files');
    print('   💡 Recommended files: ${recommendedFiles.values.fold<int>(0, (sum, list) => sum + list.length)} files');
    print('');
    
    final components = _scanComponentFolders();
    
    if (components.isEmpty) {
      print('❌ No component folders found in $storybookPath');
      return;
    }
    
    print('📁 Found ${components.length} component folder(s):');
    for (final component in components) {
      print('  • ${component.name} (${component.type})');
    }
    print('');
    
    // Validate each component
    final results = <ComponentValidationResult>[];
    for (final component in components) {
      final result = _validateComponent(component);
      results.add(result);
      _printComponentResult(result);
      print(''); // Spacing between components
    }
    
    // Print overall summary
    _printOverallSummary(results);
  }
  
  /// 📂 **Scan for all component folders**
  static List<ComponentInfo> _scanComponentFolders() {
    final storybookDir = Directory(storybookPath);
    final components = <ComponentInfo>[];
    
    if (!storybookDir.existsSync()) {
      return components;
    }
    
    final entries = storybookDir.listSync();
    
    for (final entry in entries) {
      if (entry is Directory) {
        final dirName = entry.path.split('/').last;
        
        // Skip templates and non-component files
        if (dirName.startsWith('_') || !dirName.contains('_test')) {
          continue;
        }
        
        // Determine component type and name
        String componentName;
        ComponentType type;
        
        if (dirName.endsWith('_test_modular')) {
          componentName = dirName.replaceAll('_test_modular', '');
          type = ComponentType.modular;
        } else if (dirName.endsWith('_test')) {
          componentName = dirName.replaceAll('_test', '');
          type = ComponentType.singleFile;
        } else {
          continue; // Skip unknown patterns
        }
        
        components.add(ComponentInfo(
          name: componentName,
          fullPath: entry.path,
          type: type,
        ));
      }
    }
    
    // Sort by name for consistent output
    components.sort((a, b) => a.name.compareTo(b.name));
    
    return components;
  }
  
  /// ✅ **Validate a single component**
  static ComponentValidationResult _validateComponent(ComponentInfo component) {
    final result = ComponentValidationResult(component);
    
    if (component.type == ComponentType.singleFile) {
      result.addWarning('📄 Single-file component - consider migrating to modular structure');
      result.compliance = ComplianceLevel.legacy;
      return result;
    }
    
    // Validate modular component structure
    _validateFolders(component, result);
    _validateRequiredFiles(component, result);
    _validateRecommendedFiles(component, result);
    
    // Determine compliance level
    if (result.errors.isEmpty && result.warnings.isEmpty) {
      result.compliance = ComplianceLevel.perfect;
    } else if (result.errors.isEmpty) {
      result.compliance = ComplianceLevel.good;
    } else {
      result.compliance = ComplianceLevel.incomplete;
    }
    
    return result;
  }
  
  /// 📁 **Validate folder structure**
  static void _validateFolders(ComponentInfo component, ComponentValidationResult result) {
    for (final folderName in requiredFolders) {
      final folderPath = '${component.fullPath}/$folderName';
      final folder = Directory(folderPath);
      
      if (folder.existsSync()) {
        result.addSuccess('✅ Folder: $folderName/');
      } else {
        result.addError('❌ Missing folder: $folderName/');
      }
    }
  }
  
  /// 📄 **Validate required files**
  static void _validateRequiredFiles(ComponentInfo component, ComponentValidationResult result) {
    for (final fileTemplate in requiredFiles) {
      final fileName = fileTemplate.replaceAll('{component}', component.name);
      final filePath = '${component.fullPath}/$fileName';
      final file = File(filePath);
      
      if (file.existsSync()) {
        result.addSuccess('✅ Required: $fileName');
      } else {
        result.addError('❌ Missing required: $fileName');
      }
    }
  }
  
  /// 💡 **Validate recommended files**
  static void _validateRecommendedFiles(ComponentInfo component, ComponentValidationResult result) {
    recommendedFiles.forEach((folder, files) {
      for (final fileTemplate in files) {
        final fileName = fileTemplate.replaceAll('{component}', component.name);
        final filePath = '${component.fullPath}/$folder/$fileName';
        final file = File(filePath);
        
        if (file.existsSync()) {
          result.addInfo('💡 Recommended: $folder/$fileName');
        } else {
          result.addWarning('⚠️ Missing recommended: $folder/$fileName');
        }
      }
    });
  }
  
  /// 📊 **Print component validation result**
  static void _printComponentResult(ComponentValidationResult result) {
    final component = result.component;
    final icon = _getComplianceIcon(result.compliance);
    
    print('$icon ${component.name} (${component.type.name})');
    print('   Path: ${component.fullPath.split('/').last}');
    
    if (result.errors.isNotEmpty) {
      print('   ❌ Errors (${result.errors.length}):');
      for (final error in result.errors.take(3)) {
        print('      $error');
      }
      if (result.errors.length > 3) {
        print('      ... and ${result.errors.length - 3} more errors');
      }
    }
    
    if (result.warnings.isNotEmpty && result.warnings.length <= 5) {
      print('   ⚠️ Warnings (${result.warnings.length}):');
      for (final warning in result.warnings.take(2)) {
        print('      $warning');
      }
      if (result.warnings.length > 2) {
        print('      ... and ${result.warnings.length - 2} more warnings');
      }
    }
    
    final successCount = result.successes.length;
    final infoCount = result.infos.length;
    if (successCount > 0 || infoCount > 0) {
      print('   ✅ Valid items: $successCount   💡 Recommended items: $infoCount');
    }
    
    print('   📊 Compliance: ${result.compliance.description}');
  }
  
  /// 🌍 **Print overall summary**
  static void _printOverallSummary(List<ComponentValidationResult> results) {
    print('═' * 50);
    print('🌍 OVERALL VALIDATION SUMMARY');
    print('═' * 50);
    
    final byCompliance = <ComplianceLevel, int>{};
    for (final level in ComplianceLevel.values) {
      byCompliance[level] = results.where((r) => r.compliance == level).length;
    }
    
    print('📊 Component Status:');
    print('   🎉 Perfect:    ${byCompliance[ComplianceLevel.perfect]} components');
    print('   ✅ Good:       ${byCompliance[ComplianceLevel.good]} components');
    print('   ⚠️ Incomplete: ${byCompliance[ComplianceLevel.incomplete]} components');
    print('   📄 Legacy:     ${byCompliance[ComplianceLevel.legacy]} components');
    print('   📁 Total:      ${results.length} components');
    
    final modularComponents = results.where((r) => r.component.type == ComponentType.modular).length;
    final legacyComponents = results.where((r) => r.component.type == ComponentType.singleFile).length;
    
    if (modularComponents > 0) {
      final compliantModular = results
          .where((r) => r.component.type == ComponentType.modular && r.compliance != ComplianceLevel.incomplete)
          .length;
      final complianceRate = (compliantModular / modularComponents * 100).toStringAsFixed(1);
      print('');
      print('🎯 Modular Compliance Rate: $complianceRate% ($compliantModular/$modularComponents)');
    }
    
    if (legacyComponents > 0) {
      print('');
      print('🔄 Migration Recommendations:');
      final legacyList = results
          .where((r) => r.component.type == ComponentType.singleFile)
          .map((r) => r.component.name)
          .take(5)
          .toList();
      
      for (final name in legacyList) {
        print('   • Migrate $name to modular structure');
      }
      
      if (legacyComponents > 5) {
        print('   • ... and ${legacyComponents - 5} more components');
      }
    }
    
    // Success message
    if (byCompliance[ComplianceLevel.incomplete] == 0) {
      print('');
      print('🎉 All modular components are properly structured!');
    }
  }
  
  /// 🎨 **Get compliance icon**
  static String _getComplianceIcon(ComplianceLevel level) {
    switch (level) {
      case ComplianceLevel.perfect:
        return '🎉';
      case ComplianceLevel.good:
        return '✅';
      case ComplianceLevel.incomplete:
        return '⚠️';
      case ComplianceLevel.legacy:
        return '📄';
    }
  }
  
  /// 📋 **Load template structure from _templates folder**
  static bool _loadTemplateStructure() {
    try {
      final templateDir = Directory(templatePath);
      
      if (!templateDir.existsSync()) {
        print('❌ Template directory does not exist: $templatePath');
        return false;
      }
      
      // Get required folders by scanning template directory
      final templateEntries = templateDir.listSync();
      final folders = templateEntries
          .whereType<Directory>()
          .map((dir) => dir.path.split('/').last)
          .where((name) => !name.startsWith('.'))
          .toList();
      
      if (folders.isEmpty) {
        print('❌ No folders found in template directory');
        return false;
      }
      
      requiredFolders = folders..sort();
      
      // Define required files (these are standard across all components)
      requiredFiles = [
        '{component}s.dart',                                    // Main aggregator
        'showcase/{component}_showcase_widget.dart',            // Main showcase widget
        'showcase/unified_{component}_showcase.dart',           // Unified story
      ];
      
      // Scan each template folder for recommended files
      recommendedFiles = {};
      for (final folder in requiredFolders) {
        final folderPath = '$templatePath/$folder';
        final folderDir = Directory(folderPath);
        
        if (folderDir.existsSync()) {
          // Look for template markdown files to understand expected structure
          final templateMd = '$folderPath/TEMPLATE_$folder.md';
          final templateFile = File(templateMd);
          
          if (templateFile.existsSync()) {
            // Extract recommended files from template content
            final content = templateFile.readAsStringSync();
            final recommendedForFolder = _extractRecommendedFiles(content, folder);
            if (recommendedForFolder.isNotEmpty) {
              recommendedFiles[folder] = recommendedForFolder;
            }
          }
        }
      }
      
      print('✅ Template structure loaded successfully');
      return true;
    } catch (e) {
      print('❌ Error loading template structure: $e');
      return false;
    }
  }
  
  /// 📝 **Extract recommended files from template markdown content**
  static List<String> _extractRecommendedFiles(String content, String folder) {
    final files = <String>[];
    
    // Define standard file patterns based on folder type
    switch (folder) {
      case 'sections':
        files.addAll([
          'header_section.dart',
          'variant_info_section.dart', 
          'size_info_section.dart',
          'usage_guidelines_section.dart',
          'sample_content_section.dart',
        ]);
        break;
      case 'widgets':
        files.addAll([
          'info_chip_widget.dart',
          'section_container_widget.dart',
        ]);
        break;
      case 'data':
        files.addAll([
          '{component}_descriptions.dart',
          '{component}_guidelines.dart',
        ]);
        break;
      case 'utils':
        files.addAll([
          '{component}_builder.dart',
          'knobs_config.dart',
        ]);
        break;
    }
    
    return files;
  }
}

/// 📋 **Component Information**
class ComponentInfo {
  final String name;
  final String fullPath;
  final ComponentType type;
  
  ComponentInfo({
    required this.name,
    required this.fullPath,
    required this.type,
  });
}

/// 🏷️ **Component Types**
enum ComponentType {
  modular('modular'),
  singleFile('single-file');
  
  const ComponentType(this.name);
  final String name;
}

/// 📊 **Compliance Levels**
enum ComplianceLevel {
  perfect('Perfect - All required and recommended files present'),
  good('Good - All required files present, some recommendations missing'),
  incomplete('Incomplete - Missing required files or folders'),
  legacy('Legacy - Single-file component, needs migration');
  
  const ComplianceLevel(this.description);
  final String description;
}

/// 📋 **Validation Result for a Component**
class ComponentValidationResult {
  final ComponentInfo component;
  final List<String> successes = [];
  final List<String> errors = [];
  final List<String> warnings = [];
  final List<String> infos = [];
  ComplianceLevel compliance = ComplianceLevel.incomplete;
  
  ComponentValidationResult(this.component);
  
  void addSuccess(String message) => successes.add(message);
  void addError(String message) => errors.add(message);
  void addWarning(String message) => warnings.add(message);
  void addInfo(String message) => infos.add(message);
}

/// 🚀 **Main Entry Point**
void main() {
  StorybookValidator.validateAll();
}
