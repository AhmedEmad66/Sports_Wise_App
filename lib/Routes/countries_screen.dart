import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sport_wise_app/Routes/leagues_screen.dart';
import '../Res/app_colors.dart';

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
      body: GridView.custom(
        gridDelegate: SliverWovenGridDelegate.count(
          crossAxisCount: 4,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          pattern: [
            const WovenGridTile(1),
            const WovenGridTile(
              5 / 7,
              crossAxisRatio: 0.9,
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
              decoration: const BoxDecoration(
                color: AppColors.kMyDarkGrey,
              ),
              child: const Center(
                child: Text(
                  "data",
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
