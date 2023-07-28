import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sport_wise_app/Routes/leagues_screen.dart';
import '../Res/app_colors.dart';
import '../Res/app_images.dart';

class CountriesScreen extends StatelessWidget {
  const CountriesScreen({super.key});
  // Named Route
  static const String id = "CountriesScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //To Avoid the keyboard size
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.kBackGroundColor,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(AppImages.kMainBG),
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "All Countries that practice this sport",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: "Ubuntu",
                  fontWeight: FontWeight.w600,
                  color: AppColors.kPrimaryColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.custom(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: SliverWovenGridDelegate.count(
                    crossAxisCount: 3,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    pattern: [
                      const WovenGridTile(1),
                      const WovenGridTile(
                        5 / 7,
                        crossAxisRatio: 1.0,
                        alignment: AlignmentDirectional.centerEnd,
                      ),
                    ],
                  ),
                  childrenDelegate: SliverChildBuilderDelegate(
                    childCount: 20,
                    (context, index) => InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LeaguesScreen()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.kMyDarkGrey,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Stack(
                          children: const [
                            Text(
                              "Name",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Ubuntu",
                                fontWeight: FontWeight.w500,
                                color: AppColors.kMyWhite,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
