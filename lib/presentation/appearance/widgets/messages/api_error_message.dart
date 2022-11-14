import 'package:flutter/material.dart';

import 'package:spacex_launches/presentation/appearance/styles/app_colours.dart';
import 'package:spacex_launches/presentation/appearance/styles/text_styles.dart';

class ApiErrorMessage extends StatelessWidget {
  const ApiErrorMessage(
      {Key? key, this.errorMessage = '', this.hasHorizontalPadding = true})
      : super(key: key);
  final String errorMessage;
  final bool hasHorizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: 40, horizontal: hasHorizontalPadding ? 24 : 0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.pureWhite),
          borderRadius: BorderRadius.circular(10),
        ),
        // color: Colors.white10,
        padding: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.error,
              size: 45,
              color: AppColors.pureWhite,
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Text(
                errorMessage,
                style: AppTextStyles.errorMessage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
