import 'package:flutter/material.dart';
import 'package:fruits_app/features/home/domain/entites/bottom_navigation_bar_entity.dart';
import 'package:fruits_app/features/home/presentation/widgets/navigation_bar_item.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.onItemTaped,
    required this.selectedIndex,
  });
  final ValueChanged<int> onItemTaped;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      
      height: 70,
      width: 375,
      decoration: const ShapeDecoration(
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 25,
            offset: Offset(0, -2),
            spreadRadius: 0,
          )
        ],
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
      ),
      child: Row(
          children: bottomNavigatomBarItems.asMap().entries.map((e) {
        var index = e.key;
        var entites = e.value;
        return Expanded(
          flex: index == selectedIndex ? 3 : 2,
          child: GestureDetector(
            onTap: () {
              onItemTaped(index);
            },
            child: NavigationBarItem(
                isSelected: selectedIndex == index,
                botomNavigationBarEntitey: entites),
          ),
        );
      }).toList()),
    );
  }
}
