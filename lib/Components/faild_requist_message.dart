


import 'package:flutter/material.dart';

import '../Res/app_colors.dart';

class FaildRequstTextMessage extends StatelessWidget {
  const FaildRequstTextMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Requst is Faild",
      style: TextStyle(
        color: AppColors.kMyWhite,
        fontFamily: "Ubuntu",
        fontSize: 25,
      ),
    );
  }
}