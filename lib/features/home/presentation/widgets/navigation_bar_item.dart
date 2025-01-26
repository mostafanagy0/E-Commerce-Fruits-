import 'package:flutter/material.dart';
import 'package:fruits_app/features/home/domain/entites/bottom_navigation_bar_entity.dart';

import 'active_and_inactive_item.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem(
      {super.key,
      required this.isSelected,
      required this.botomNavigationBarEntitey});
  final bool isSelected;
  final BotomNavigationBarEntitey botomNavigationBarEntitey;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveIcon(
            text: botomNavigationBarEntitey.name,
            image: botomNavigationBarEntitey.activeIcon)
        : InActiveItem(image: botomNavigationBarEntitey.inActiveIcon);
  }
}
