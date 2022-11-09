import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:spacex_launcher/presentation/appearance/styles/app_colours.dart';

class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GradientAppBar({
    Key? key,
    this.backgroundColorLeft = AppColors.launchTitleBarPink,
    this.backgroundColorRight = AppColors.pureWhite,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final Color backgroundColorLeft;
  final Color backgroundColorRight;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: child,
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      centerTitle: true,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[backgroundColorLeft, backgroundColorRight],
          ),
        ),
      ),
    );
  }
}
