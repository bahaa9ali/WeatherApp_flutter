import 'package:flutter/material.dart';

import '../constants/colors.dart';

class SpacerWidget extends StatelessWidget {
  const SpacerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(
          flex: 1,
        ),
        Container(
          width: 60,
          height: 9,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: AppColors.kText.withOpacity(0.7)),
        ),
        const Spacer(
          flex: 1,
        ),
      ],
    );
  }
}
