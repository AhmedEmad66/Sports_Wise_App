import 'package:flutter/material.dart';

import '../Res/app_colors.dart';

class DoIndicator extends StatelessWidget {
  const DoIndicator({
    super.key,
    this.isActive = false,
  });
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    // Indicator Shape
    return AnimatedContainer(
      height: 15,
      duration: const Duration(milliseconds: 300),
      width: isActive ? 35 : 15,
      decoration: BoxDecoration(
        color: isActive ? AppColors.kPrimaryColor : const Color(0xFFFFFFFF),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}