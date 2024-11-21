import 'package:flutter/material.dart';
import 'package:fruits_app/features/home/domain/entites/bottom_navigation_bar_entity.dart';
import 'package:fruits_app/features/home/presentation/widgets/navigation_bar_item.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 375,
      decoration: const ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x19000000),
              blurRadius: 40,
              offset: Offset(0, -2),
              spreadRadius: 0,
            )
          ]),
      child: Row(
          children: bottomNavigatomBarItems.asMap().entries.map((e) {
        var index = e.key;
        var entites = e.value;
        return Expanded(
          flex: index == selectedIndex ? 3 : 2,
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex == index;
              });
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
