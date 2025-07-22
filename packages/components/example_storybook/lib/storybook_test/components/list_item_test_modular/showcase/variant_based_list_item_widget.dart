import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

import '../utils/size_mapper.dart';

/// 🎨 **List Item Widget**
/// 
/// Comprehensive widget showcasing all list item features:
/// - Variant drives configuration for standard list items
/// - Expandable widget section with custom features  
/// - Selection components (checkbox, radio, switch) section
/// - Size knob affects all widgets (icons, avatars, badges)
class VariantBasedListItemWidget extends StatefulWidget {
  const VariantBasedListItemWidget({
    super.key,
    this.variant = ListItemVariant.standard,
    this.size = ListItemSize.medium,
    this.borderVariant = ListItemBorderVariant.none,
    this.titleText = 'Variant Test Item',
    this.subtitleText = 'Subtitle text',
    this.showSubtitle = true,
    
    // Selection-related (for selection showcase section)
    this.selectionType = 'checkbox',
    this.selectionPosition = 'right',
    this.selectionValue = false,
    
    // Expandable-related
    this.expandableTitle = 'Expandable Item',
    this.expandableSubtitle = 'Tap to expand/collapse',
    this.expandIconType = 'default',
    this.leadingIconType = 'settings',
    
    // Styling
    this.backgroundColor = Colors.transparent,
    this.borderColor = Colors.grey,
    this.padding = const EdgeInsets.all(16),
  });

  final ListItemVariant variant;
  final ListItemSize size;
  final ListItemBorderVariant borderVariant;
  final String titleText;
  final String subtitleText;
  final bool showSubtitle;
  
  // Selection-related
  final String selectionType;
  final String selectionPosition;
  final bool selectionValue;
  
  // Expandable-related
  final String expandableTitle;
  final String expandableSubtitle;
  final String expandIconType;
  final String leadingIconType;
  
  // Styling
  final Color backgroundColor;
  final Color borderColor;
  final EdgeInsets padding;

  @override
  State<VariantBasedListItemWidget> createState() => _VariantBasedListItemWidgetState();
}

class _VariantBasedListItemWidgetState extends State<VariantBasedListItemWidget> {
  late bool isExpanded;

  @override
  void initState() {
    super.initState();
    isExpanded = false; // Default to false
  }

  @override
  void didUpdateWidget(VariantBasedListItemWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // No need to update based on initiallyExpanded since it's removed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('🎨 List Item Showcase'),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Header
            _buildHeader(context),
            
            const SizedBox(height: 20),
            
            // Main variant showcase
            _buildVariantShowcase(context),
            
            const SizedBox(height: 30),
            
            // Expandable widget showcase
            _buildExpandableWidget(context),
            
            const SizedBox(height: 30),
            
            // Selection widget showcase  
            _buildSelectionWidget(context),
            
            const SizedBox(height: 30),
            
            // Current configuration display
            _buildConfigurationDisplay(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue[200]!),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Icon(Icons.tune, color: Colors.blue, size: 32),
              const SizedBox(width: 12),
              Flexible(
                child: Text(
                  'Variant-Driven Configuration',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.blue[800],
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Flexible(
            child: Text(
              'Variant: ${widget.variant.toString().split('.').last} - Related knobs appear based on variant selection',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.blue[700],
              ),
              overflow: TextOverflow.visible,
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVariantShowcase(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Main Variant: ${widget.variant.toString().split('.').last}',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.blue[800],
            ),
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
          
          const SizedBox(height: 16),
          
          // The main list item
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue[200]!),
              borderRadius: BorderRadius.circular(8),
            ),
            child: _buildMainListItem(),
          ),
        ],
      ),
    );
  }

  Widget _buildExpandableWidget(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Expandable Widget',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.green[800],
            ),
          ),
          
          const SizedBox(height: 16),
          
          // The expandable list item
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green[200]!),
              borderRadius: BorderRadius.circular(8),
            ),
            child: OsmeaComponents.listItem(
              variant: ListItemVariant.expandable,
              size: widget.size,
              
              title: Text(widget.expandableTitle),
              subtitle: widget.showSubtitle ? Text(widget.expandableSubtitle) : null,
              
              leading: _buildExpandableLeadingIcon(),
              
              // Expandable specific properties
              initiallyExpanded: isExpanded,
              expandIcon: _buildExpandIcon(),
              collapseIcon: _buildCollapseIcon(),
              
              onExpansionChanged: (expanded) {
                setState(() {
                  isExpanded = expanded;
                });
              },
              
              // Children
              children: _buildExpandableChildren(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectionWidget(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.radio_button_checked, color: Colors.orange, size: 28),
              const SizedBox(width: 12),
              Flexible(
                child: Text(
                  'Selection Components',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.orange[800],
                  ),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 8),
          
          Text(
            'Type: ${widget.selectionType} • Position: ${widget.selectionPosition}',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.orange[700],
            ),
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
          
          const SizedBox(height: 16),
          
          // The selection list item
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.orange[200]!),
              borderRadius: BorderRadius.circular(8),
            ),
            child: _buildSelectionListItem(),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectionListItem() {
    ListItemVariant actualVariant;
    
    // Determine variant based on selection type and position
    switch (widget.selectionType) {
      case 'checkbox':
        actualVariant = widget.selectionPosition == 'left' 
            ? ListItemVariant.checkboxLeft 
            : ListItemVariant.checkboxRight;
        break;
      case 'radio':
        actualVariant = widget.selectionPosition == 'left' 
            ? ListItemVariant.radioLeft 
            : ListItemVariant.radioRight;
        break;
      case 'switch':
        actualVariant = widget.selectionPosition == 'left' 
            ? ListItemVariant.switchLeft 
            : ListItemVariant.switchRight;
        break;
      default:
        actualVariant = ListItemVariant.checkboxRight;
    }

    return OsmeaComponents.listItem(
      variant: actualVariant,
      size: widget.size,
      
      title: Text('${widget.selectionType.toUpperCase()} Selection'),
      subtitle: widget.showSubtitle ? Text('Selection positioned ${widget.selectionPosition}') : null,
      
      // Selection value
      value: widget.selectionValue,
      onChanged: (value) {
        // In a real implementation, this would update state
      },
      
      // Styling
      backgroundColor: widget.backgroundColor,
      borderColor: widget.borderColor,
      padding: widget.padding,
      
      // Interaction
      onTap: () {
        // Handle tap
      },
    );
  }

  Widget _buildMainListItem() {
    return OsmeaComponents.listItem(
      variant: widget.variant,
      size: widget.size,
      borderVariant: widget.borderVariant,
      
      title: Text(widget.titleText),
      subtitle: widget.showSubtitle ? Text(widget.subtitleText) : null,
      
      // Leading/trailing based on variant (some variants control these automatically)
      leading: _buildLeading(),
      trailing: _buildTrailing(),
      
      // Styling
      backgroundColor: widget.backgroundColor,
      borderColor: widget.borderColor,
      padding: widget.padding,
      
      // Interaction
      onTap: () {
        // Handle tap
      },
    );
  }

  Widget? _buildLeading() {
    // For non-selection variants, provide appropriate leading widgets
    switch (widget.variant) {
      case ListItemVariant.avatar:
        return _buildAvatarForSize();
      case ListItemVariant.badge:
        return OsmeaComponents.badge(
          content: 'NEW',
          variant: BadgeVariant.primary,
          size: SizeMapper.getBadgeSize(widget.size),
        );
      case ListItemVariant.multiLeading:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.star, size: SizeMapper.getIconSize(widget.size)),
            const SizedBox(width: 4),
            Icon(Icons.favorite, size: SizeMapper.getIconSize(widget.size)),
          ],
        );
      default:
        return Icon(Icons.folder, size: SizeMapper.getIconSize(widget.size));
    }
  }

  Widget? _buildTrailing() {
    // For non-selection variants, provide appropriate trailing widgets
    switch (widget.variant) {
      case ListItemVariant.button:
        return ElevatedButton(
          onPressed: () {},
          child: const Text('Action'),
        );
      case ListItemVariant.multiTrailing:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit, size: SizeMapper.getIconSize(widget.size)),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.delete, size: SizeMapper.getIconSize(widget.size)),
              onPressed: () {},
            ),
          ],
        );
      default:
        return Icon(Icons.chevron_right, size: SizeMapper.getIconSize(widget.size));
    }
  }

  Widget _buildExpandableLeadingIcon() {
    IconData iconData;
    
    switch (widget.leadingIconType) {
      case 'settings':
        iconData = Icons.settings;
        break;
      case 'folder':
        iconData = Icons.folder;
        break;
      case 'menu':
        iconData = Icons.menu;
        break;
      case 'list':
        iconData = Icons.list;
        break;
      case 'tune':
        iconData = Icons.tune;
        break;
      default:
        iconData = Icons.settings;
    }
    
    return Icon(iconData, size: SizeMapper.getIconSize(widget.size));
  }

  Widget? _buildExpandIcon() {
    switch (widget.expandIconType) {
      case 'arrow_down_up':
        return const Icon(Icons.keyboard_arrow_down);
      case 'plus_minus':
        return const Icon(Icons.add);
      case 'chevron':
        return const Icon(Icons.chevron_right);
      case 'default':
      default:
        return null; // Use default expand icon
    }
  }

  Widget? _buildCollapseIcon() {
    switch (widget.expandIconType) {
      case 'arrow_down_up':
        return const Icon(Icons.keyboard_arrow_up);
      case 'plus_minus':
        return const Icon(Icons.remove);
      case 'chevron':
        return const Icon(Icons.expand_more);
      case 'default':
      default:
        return null; // Use default collapse icon
    }
  }

  List<Widget> _buildExpandableChildren() {
    return [
      OsmeaComponents.listItem(
        title: const Text('Account Settings'),
        subtitle: const Text('Manage your account'),
        leading: const Icon(Icons.person),
        trailing: const Icon(Icons.chevron_right),
        size: widget.size,
        onTap: () {},
      ),
      OsmeaComponents.listItem(
        title: const Text('Privacy'),
        subtitle: const Text('Privacy settings'),
        leading: const Icon(Icons.security),
        trailing: Switch(
          value: true,
          onChanged: (v) {},
        ),
        size: widget.size,
      ),
      OsmeaComponents.listItem(
        title: const Text('Notifications'),
        subtitle: const Text('Notification preferences'),
        variant: ListItemVariant.checkboxRight,
        value: false,
        onChanged: (v) {},
        size: widget.size,
      ),
    ];
  }

  Widget _buildAvatarForSize() {
    return CircleAvatar(
      radius: SizeMapper.getAvatarRadius(widget.size),
      child: Icon(Icons.person, size: SizeMapper.getAvatarIconSize(widget.size)),
    );
  }

  Widget _buildConfigurationDisplay(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Current Configuration:',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          _buildConfigRow('Variant', widget.variant.toString().split('.').last),
          _buildConfigRow('Size (affects all widgets)', widget.size.toString().split('.').last),
          _buildConfigRow('Border', widget.borderVariant.toString().split('.').last),
          const SizedBox(height: 8),
          Text('Expandable Widget:', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green[800])),
          _buildConfigRow('Expandable Title', widget.expandableTitle),
          _buildConfigRow('Expandable Subtitle', widget.expandableSubtitle),
          _buildConfigRow('Expand Icon Type', widget.expandIconType),
          _buildConfigRow('Leading Icon Type', widget.leadingIconType),
          
          const SizedBox(height: 8),
          Text('Selection Widget:', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange[800])),
          _buildConfigRow('Selection Type', widget.selectionType),
          _buildConfigRow('Selection Position', widget.selectionPosition),
          _buildConfigRow('Selection Value', widget.selectionValue.toString()),
          
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue[300]!),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Features:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800],
                  ),
                ),
                const SizedBox(height: 8),
                Text('• Variant-driven configuration', style: TextStyle(color: Colors.blue[700], fontSize: 12)),
                Text('• Size affects both widgets (icons, avatars, badges)', style: TextStyle(color: Colors.blue[700], fontSize: 12)),
                Text('• Dynamic knob visibility based on variant', style: TextStyle(color: Colors.blue[700], fontSize: 12)),
                Text('• Separate expandable widget with custom icons', style: TextStyle(color: Colors.blue[700], fontSize: 12)),
                Text('• Selection positioning for checkbox/radio/switch', style: TextStyle(color: Colors.blue[700], fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConfigRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: const TextStyle(fontSize: 12),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
