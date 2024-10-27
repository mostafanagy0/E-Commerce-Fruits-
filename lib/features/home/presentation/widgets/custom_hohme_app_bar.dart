import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app/core/utils/app_images.dart';
import 'package:fruits_app/core/utils/app_text_style.dart';

class CustomHohmeAppBar extends StatelessWidget {
  const CustomHohmeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Container(
        padding: const EdgeInsets.all(16),
        decoration: const ShapeDecoration(
          color: Color(0xFFEEF8ED),
          shape: OvalBorder(),
        ),
        child: SvgPicture.asset(Assets.imagesNotificationicon),
      ),
      leading: Image.asset(Assets.imagesProfileimage),
      title: Text(
        'صباح الخير !..',
        style: TextStyles.regular16.copyWith(color: const Color(0xFF949D9E)),
      ),
      subtitle: const Text('أحمد مصطفي', style: TextStyles.bold16),
    );
  }
}
