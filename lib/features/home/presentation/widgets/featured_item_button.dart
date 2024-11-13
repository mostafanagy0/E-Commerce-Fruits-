import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_text_style.dart';

class FeaturedItemButton extends StatelessWidget {
  const FeaturedItemButton({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
        child: const Text(
          'تسوق الان',
          style: TextStyles.regular13W700,
        ),
      ),
    );
  }
}
