import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InActiveIcon extends StatelessWidget {
  const InActiveIcon({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Expanded(child: SvgPicture.asset(image));
  }
}

class ActiveIcon extends StatelessWidget {
  const ActiveIcon({super.key, required this.text, required this.image});
  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Center(
        child: Container(
          padding: const EdgeInsets.only(left: 16),
          decoration: ShapeDecoration(
              color: const Color(0xFFEEEEEE),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30))),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: ShapeDecoration(
                    color: const Color(0xFF185E37),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                child: Center(child: SvgPicture.asset(image)),
              ),
              const SizedBox(
                width: 4,
              ),
              Text(text)
            ],
          ),
        ),
      ),
    );
  }
}
