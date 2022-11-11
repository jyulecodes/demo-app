import 'package:flutter/material.dart';

import 'package:spacex_launches/presentation/appearance/styles/app_colours.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({
    Key? key,
    this.child,
    this.appBar,
    this.backgroundColorTopRight = AppColors.pureWhite,
    this.backgroundColorBottomLeft = AppColors.pureWhite,
    this.isError = false,
  }) : super(key: key);

  final Widget? child;
  final PreferredSizeWidget? appBar;
  final Color backgroundColorTopRight;
  final Color backgroundColorBottomLeft;
  final bool isError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  backgroundColorTopRight,
                  backgroundColorBottomLeft,
                ],
              ),
            ),
          ),
          child ?? const SizedBox(),
        ],
      ),
    );
  }
}
