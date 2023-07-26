import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../Res/app_colors.dart';
import '../Res/app_images.dart';

class LeaguesScreen extends StatelessWidget {
  const LeaguesScreen({super.key});
  // Named Route
  static const String id = "LeaguesScreen";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //To Avoid the keyboard size
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.kBackGroundColor,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(AppImages.kBG2),
            ),
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: AnimationLimiter(
              child: Column(
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 500),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: widget,
                    ),
                  ),
                  children: [
                    for (int i = 0; i < 20; i++)
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        width: double.infinity,
                        height: 80,
                        decoration: BoxDecoration(
                          color: AppColors.kMyDarkGrey,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
