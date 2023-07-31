import 'package:flutter/material.dart';
import '../../Components/custom_back_arrow.dart';
import '../../Res/app_colors.dart';
import '../../Res/app_images.dart';
import '../../Res/app_strings.dart';
import '../../generated/l10n.dart';
import 'league_teams.dart';
import 'league_top_scorers.dart';

class TeamsAndTopScorers extends StatelessWidget {
  const TeamsAndTopScorers({super.key});
  // Named Route
  static const String id = "TeamsAndPlayersScreen";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        //To Avoid the keyboard size
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.kBackGroundColor,
        body: Container(
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
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppStrings.kAppLanguage == "en"
                        ? const CustomBackArrowLeft()
                        : const CustomBackArrowRight(),
                  ],
                ),
                // Tab Bar with 2 tabs
                TabBar(
                    dividerColor: Colors.transparent,
                    physics: const BouncingScrollPhysics(),
                    labelPadding: const EdgeInsets.only(
                      right: 15,
                    ),
                    labelColor: AppColors.kPrimaryColor,
                    unselectedLabelColor: AppColors.kMyWhite,
                    labelStyle: const TextStyle(
                      fontFamily: "Ubuntu",
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                    unselectedLabelStyle: const TextStyle(
                      backgroundColor: Color.fromARGB(125, 0, 0, 0),
                      fontFamily: "Ubuntu",
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                    indicatorColor: Colors.transparent,
                    tabs: [
                      Tab(text: S.of(context).teamsTitle),
                      Tab(text: S.of(context).topScorersTitle),
                    ]),
                const SizedBox(
                  height: 20,
                ),
                const Expanded(
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      LeagueTeams(),
                      LeagueTopScorers(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
