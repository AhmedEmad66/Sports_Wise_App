import 'package:flutter/material.dart';

import '../Res/app_colors.dart';

class SideMenuBtn extends StatelessWidget {
  const SideMenuBtn({
    super.key,
    required this.title,
    required this.onTap,
  });
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: InkWell(
        onTap: onTap,
        child: Text(
          title,
          style: const TextStyle(
            fontFamily: "Ubuntu",
            fontSize: 25,
            color: AppColors.kMyWhite,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
