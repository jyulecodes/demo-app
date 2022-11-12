import 'package:flutter/material.dart';
import 'package:spacex_launches/presentation/appearance/styles/app_colours.dart';
import 'package:spacex_launches/presentation/appearance/styles/text_styles.dart';

class CountdownValueListItem extends StatelessWidget {
  const CountdownValueListItem({
    Key? key,
    this.value = '0',
    required this.unit,
  }) : super(key: key);

  final String value;
  final String unit;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            value,
            style: AppTextStyles.countdownValue,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              border: Border.all(
                color: AppColors.pureWhite,
                width: 1,
              ),
            ),
            child: Text(
              unit.toUpperCase(),
              style: AppTextStyles.launchScreenBody,
            ),
          )
        ],
      ),
    );
  }
}
