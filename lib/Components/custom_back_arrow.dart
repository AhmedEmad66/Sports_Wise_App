import 'package:flutter/material.dart';

import '../Res/app_colors.dart';

class CustomBackArrowLeft extends StatelessWidget {
  const CustomBackArrowLeft({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.arrow_back_ios_new,
      ),
      color: AppColors.kMyLightGrey,
    );
  }
}

class CustomBackArrowRight extends StatelessWidget {
  const CustomBackArrowRight({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_forward_ios,
          textDirection: TextDirection.ltr,
        ),
        color: AppColors.kMyLightGrey,
      ),
    );
  }
}
