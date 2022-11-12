import 'package:flutter/material.dart';

import 'package:spacex_launches/presentation/appearance/styles/app_colours.dart';
import 'package:spacex_launches/presentation/appearance/styles/text_styles.dart';

class ApiErrorMessage extends StatelessWidget {
  const ApiErrorMessage({Key? key, this.errorMessage = ''}) : super(key: key);
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.error_outline,
            size: 45,
            color: AppColors.pureWhite,
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Text(
              errorMessage,
              style: AppTextStyles.manropeMedium24,
            ),
          ),
        ],
      ),
    );
  }
}
