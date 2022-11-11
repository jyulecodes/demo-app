import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:spacex_launches/presentation/appearance/styles/app_colours.dart';

enum CustomBottomNavigationBarType {
  countdown,
  launches,
  favourites,
}

class CustomBottomNavigationBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomBottomNavigationBar({
    Key? key,
    this.activeItem = CustomBottomNavigationBarType.countdown,
    this.navBarIcon,
    this.inactiveIconColor = AppColors.countTitleBarGrey,
  }) : super(key: key);

  final CustomBottomNavigationBarType activeItem;
  final String? navBarIcon;
  final Color? inactiveIconColor;

  static Map<CustomBottomNavigationBarType, IconData> typeToIcon = {
    CustomBottomNavigationBarType.countdown: Icons.timer,
    CustomBottomNavigationBarType.launches: CupertinoIcons.rocket_fill,
    CustomBottomNavigationBarType.favourites: CupertinoIcons.heart_fill,
  };

  static Map<CustomBottomNavigationBarType, String> typeToScreen = {
    CustomBottomNavigationBarType.countdown: '/countdown',
    CustomBottomNavigationBarType.launches: '/launches',
    CustomBottomNavigationBarType.favourites:'/favourites',
  };

  @override
  Size get preferredSize => const Size.fromHeight(kBottomNavigationBarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).padding.bottom + 60,
      alignment: AlignmentDirectional.center,
      color: Colors.white10,
      child: Row(
        children: CustomBottomNavigationBarType.values
            .map((CustomBottomNavigationBarType type) => _item(context, type))
            .toList(),
      ),
    );
  }

  Widget _item(BuildContext context, CustomBottomNavigationBarType type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (activeItem != type && typeToScreen.containsKey(type)) {
              Navigator.pushNamed(context, typeToScreen[type]!);
          }
        },
        child: Container(
          height: 50,
          color: Colors.transparent,
          alignment: AlignmentDirectional.center,
          child: Stack(
            children: <Widget>[
              _pageIcon(context, type),
            ],
          ),
        ),
      ),
    );
  }

  Widget _pageIcon(BuildContext context, CustomBottomNavigationBarType type) {
    final color = type == activeItem ? AppColors.pureWhite : inactiveIconColor;
    return Icon(
      typeToIcon[type]!,
      color: color,
      size: 30,
    );
  }
}
