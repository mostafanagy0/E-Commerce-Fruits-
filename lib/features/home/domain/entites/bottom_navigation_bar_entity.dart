import 'package:fruits_app/core/utils/app_images.dart';

class BotomNavigationBarEntitey {
  final String activeIcon, inActiveIcon;
  final String name;

  BotomNavigationBarEntitey.botomNavigationBarEntity(
      {required this.activeIcon,
      required this.inActiveIcon,
      required this.name});
}

List<BotomNavigationBarEntitey> get bottomNavigatomBarItems => [
      BotomNavigationBarEntitey.botomNavigationBarEntity(
        activeIcon: Assets.imagesHomeActive,
        inActiveIcon: Assets.imagesHomeInactive,
        name: 'الرئيسية',
      ),
      BotomNavigationBarEntitey.botomNavigationBarEntity(
        activeIcon: Assets.imagesElementActive,
        inActiveIcon: Assets.imagesElementInactive,
        name: 'المنتجات',
      ),
      BotomNavigationBarEntitey.botomNavigationBarEntity(
        activeIcon: Assets.imagesShoppingCartActive,
        inActiveIcon: Assets.imagesShoppingCartInactive,
        name: 'سلة التسوق',
      ),
      BotomNavigationBarEntitey.botomNavigationBarEntity(
        activeIcon: Assets.imagesProfileActive,
        inActiveIcon: Assets.imagesProfileInactive,
        name: 'حسابي',
      ),
    ];
