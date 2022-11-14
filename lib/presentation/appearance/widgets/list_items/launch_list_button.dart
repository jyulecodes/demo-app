import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:spacex_launches/presentation/appearance/styles/app_colours.dart';
import 'package:spacex_launches/presentation/appearance/styles/text_styles.dart';

class LaunchListButton extends StatelessWidget {
  const LaunchListButton({
    Key? key,
    this.mission = '',
    this.date = '',
    this.isEnd = false,
    this.showHeart = true,
    this.fillHeart = false,
    this.onPressed,
  }) : super(key: key);

  final String mission;
  final String date;
  final bool isEnd;
  final bool showHeart;
  final bool fillHeart;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed ?? () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 15),
        decoration: BoxDecoration(
          border: !isEnd
              ? const Border(
                  bottom: BorderSide(color: AppColors.pureWhite, width: 1),
                )
              : null,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon( fillHeart
                ? CupertinoIcons.heart_fill:CupertinoIcons.heart,
            color: showHeart?AppColors.pureWhite:Colors.transparent,),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(mission, style: AppTextStyles.launchScreenBody),
            ),
            Text(
              date,
              style: AppTextStyles.launchScreenBody,
            ),
          ],
        ),
      ),
    );
  }
}
