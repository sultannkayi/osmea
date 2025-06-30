import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

class NavbarItemsWidget {
  // Generate navbar items based on configuration
  static List<NavbarItem> generateNavbarItems({
    required int itemCount,
    required bool showLabels,
    required bool showIcons,
    required bool showBadges,
    required bool showDifferentStates,
    required int currentIndex,
    required Function(int) onItemTap,
  }) {
    final icons = [
      Icons.home,
      Icons.search,
      Icons.favorite,
      Icons.shopping_cart,
      Icons.person,
      Icons.settings,
    ];
    
    final labels = [
      'Home',
      'Search',
      'Favorites',
      'Cart',
      'Profile',
      'Settings',
    ];
    
    final states = [
      NavbarItemState.active,
      NavbarItemState.inactive,
      NavbarItemState.disabled,
      NavbarItemState.disabled,
      NavbarItemState.loading,
      NavbarItemState.focused,
    ];
    
    return List.generate(itemCount, (index) {
      NavbarItemState itemState;
      
      if (showDifferentStates) {
        // Show different states for demonstration
        itemState = states[index % states.length];
        if (itemState == NavbarItemState.active && currentIndex != index) {
          itemState = NavbarItemState.inactive; // Only current index should be active
        }
      } else {
        // Normal behavior - only current index is active
        itemState = currentIndex == index ? NavbarItemState.active : NavbarItemState.inactive;
      }
      
      return NavbarItem(
        text: showLabels ? labels[index] : '',
        icon: showIcons ? Icon(icons[index]) : null,
        state: itemState,
        onTap: itemState == NavbarItemState.disabled || itemState == NavbarItemState.loading 
          ? null 
          : () => onItemTap(index),
        badge: showBadges && index == 1 ? const Text('3', style: TextStyle(fontSize: 10, color: Colors.white)) : null,
        tooltip: '${labels[index]} tab',
        route: '/navbar/${labels[index].toLowerCase()}', // Add route for each item
      );
    });
  }
}
