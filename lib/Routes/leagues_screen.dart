import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sport_wise_app/Data/Cubits/Country_Leagues_Cubit/country_leagues_cubit.dart';
import 'package:sport_wise_app/Data/Cubits/League_Teams_Cubit/league_teams_cubit.dart';
import 'package:sport_wise_app/Data/Cubits/Top_Scorers_Cubit/top_scorers_cubit.dart';
import 'package:sport_wise_app/Data/Repositories/league_teams_repo.dart';
import 'package:sport_wise_app/Routes/teams_and_top_scorers.dart';
import '../Res/app_colors.dart';
import '../Res/app_images.dart';
import '../generated/l10n.dart';

class LeaguesScreen extends StatelessWidget {
  const LeaguesScreen({
    super.key,
  });
  // Named Route
  static const String id = "LeaguesScreen";

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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new),
                    color: AppColors.kMyLightGrey,
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                   Text(
                    S.of(context).leaguesScreenTitle,
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: "Ubuntu",
                      fontWeight: FontWeight.w600,
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: BlocBuilder<CountryLeaguesCubit, CountryLeaguesState>(
                  builder: (context, state) {
                    if (state is CountryLeaguesLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is CountryLeaguesSuccess) {
                      var ourLeagues = state.countryLeagues.result!;
                      return SingleChildScrollView(
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
                                for (int i = 0; i < ourLeagues.length; i++)
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  TeamsAndTopScorers()));
                                      leagueId = ourLeagues[i].leagueKey;
                                      context
                                          .read<LeagueTeamsCubit>()
                                          .getTeams();
                                      context
                                          .read<TopScorersCubit>()
                                          .getTopScorers();
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      width: double.infinity,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: AppColors.kMyDarkGrey,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: AppColors.kMyWhite,
                                            backgroundImage: NetworkImage(
                                              ourLeagues[i].leagueLogo ??
                                                  AppImages.kImageNotFound,
                                            ),
                                            radius: 40,
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 160,
                                                child: Text(
                                                  ourLeagues[i].leagueName ??
                                                      "",
                                                  style: const TextStyle(
                                                    color: AppColors.kMyWhite,
                                                    fontSize: 20,
                                                    fontFamily: "Ubuntu",
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      return const Center(
                        child: Text(
                          "Requst is Faild",
                          style: TextStyle(
                            color: AppColors.kMyWhite,
                            fontFamily: "Ubuntu",
                            fontSize: 25,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
