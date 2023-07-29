import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sport_wise_app/Data/Cubits/League_Teams_Cubit/league_teams_cubit.dart';
import 'package:sport_wise_app/Data/Cubits/Team_Players_Cubit/team_players_cubit.dart';
import 'package:sport_wise_app/Data/Cubits/Top_Scorers_Cubit/top_scorers_cubit.dart';
import 'package:sport_wise_app/Data/Repositories/league_teams_repo.dart';
import 'package:sport_wise_app/Data/Repositories/team_players_repo.dart';
import 'package:sport_wise_app/Routes/players_screen.dart';

import '../Components/search_bar.dart';
import '../Res/app_colors.dart';
import '../Res/app_images.dart';
import '../generated/l10n.dart';

class TeamsAndTopScorers extends StatelessWidget {
  TeamsAndTopScorers({super.key});
  // Named Route
  static const String id = "TeamsAndPlayersScreen";

  TextEditingController _searchTeamController = TextEditingController();

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
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios_new),
                      color: AppColors.kMyLightGrey,
                    ),
                  ],
                ),
                 TabBar(
                    dividerColor: Colors.transparent,
                    physics: BouncingScrollPhysics(),
                    labelPadding: EdgeInsets.only(
                      right: 15,
                    ),
                    labelColor: AppColors.kPrimaryColor,
                    unselectedLabelColor: AppColors.kMyWhite,
                    labelStyle: TextStyle(
                      fontFamily: "Ubuntu",
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                    unselectedLabelStyle: TextStyle(
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
                Expanded(
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      BlocBuilder<LeagueTeamsCubit, LeagueTeamsState>(
                        builder: (context, state) {
                          if (state is LeagueTeamsLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is LeagueTeamsSuccess) {
                            var ourTeams = state.leagueTeams.result!;
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Form(
                                    child: SearchBar(
                                      hintText: S.of(context).searchBarHintText,
                                      width: double.infinity,
                                      controller: _searchTeamController,
                                      onPressed: () {
                                        apiTeamName =
                                            _searchTeamController.text;
                                        context
                                            .read<LeagueTeamsCubit>()
                                            .searchTeam();
                                        _searchTeamController.text = "";
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Expanded(
                                  child: AnimationLimiter(
                                    child: GridView.count(
                                      physics: const BouncingScrollPhysics(),
                                      crossAxisCount: 2,
                                      children: List.generate(
                                        ourTeams.length,
                                        (int index) {
                                          return AnimationConfiguration
                                              .staggeredGrid(
                                            position: index,
                                            duration: const Duration(
                                                milliseconds: 375),
                                            columnCount: 4,
                                            child: ScaleAnimation(
                                              child: FadeInAnimation(
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    PlayerScreen(
                                                                      teamName:
                                                                          ourTeams[index].teamName ??
                                                                              "",
                                                                    )));
                                                    teamId =
                                                        ourTeams[index].teamKey;
                                                    context
                                                        .read<
                                                            TeamPlayersCubit>()
                                                        .getTeamPlayers();
                                                  },
                                                  child: Container(
                                                    margin: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10,
                                                        vertical: 10),
                                                    // width: double.infinity,
                                                    // height: 80,
                                                    decoration: BoxDecoration(
                                                      color: AppColors
                                                          .kMyTransparent,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        SizedBox(
                                                          height: 110,
                                                          width: 130,
                                                          child: Image.network(
                                                            ourTeams[index]
                                                                    .teamLogo ??
                                                                AppImages
                                                                    .kImageNotFound,
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment: Alignment
                                                              .bottomCenter,
                                                          child: Text(
                                                            ourTeams[index]
                                                                    .teamName ??
                                                                "",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              backgroundColor:
                                                                  AppColors
                                                                      .kMyDarkGrey
                                                                      .withOpacity(
                                                                          0.5),
                                                              fontSize: 18,
                                                              fontFamily:
                                                                  "Ubuntu",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: AppColors
                                                                  .kMyWhite,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
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
                      BlocBuilder<TopScorersCubit, TopScorersState>(
                        builder: (context, state) {
                          if (state is TopScorersLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is TopScorersSuccess) {
                            var ourTopScorers = state.leagueTopScorers.result!;
                            return SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: AnimationLimiter(
                                child: Column(
                                  children:
                                      AnimationConfiguration.toStaggeredList(
                                    duration: const Duration(milliseconds: 500),
                                    childAnimationBuilder: (widget) =>
                                        SlideAnimation(
                                      verticalOffset: 50.0,
                                      child: FadeInAnimation(
                                        child: widget,
                                      ),
                                    ),
                                    children: [
                                      for (int i = 0;
                                          i < ourTopScorers.length;
                                          i++)
                                        InkWell(
                                          onTap: () {},
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 10),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: AppColors.kMyDarkGrey,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Column(
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      ourTopScorers[i]
                                                              .playerName ??
                                                          "",
                                                      style: const TextStyle(
                                                        color:
                                                            AppColors.kMyWhite,
                                                        fontSize: 20,
                                                        fontFamily: "Ubuntu",
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    // const CircleAvatar(
                                                    //   backgroundColor:
                                                    //       AppColors.kMyWhite,
                                                    //   backgroundImage: AssetImage(
                                                    //       AppImages.kOnboard2),
                                                    //   radius: 25,
                                                    // ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        const Text(
                                                          "Team",
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: AppColors
                                                                .kMyLightGrey,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        SizedBox(
                                                          width: 120,
                                                          child: Text(
                                                            ourTopScorers[i]
                                                                    .teamName ??
                                                                "",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: AppColors
                                                                  .kMyWhite,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        const Text(
                                                          "Number",
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: AppColors
                                                                .kMyLightGrey,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          ourTopScorers[i]
                                                              .playerPlace
                                                              .toString(),
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: AppColors
                                                                .kMyWhite,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        const Text(
                                                          "Goals",
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: AppColors
                                                                .kMyLightGrey,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          ourTopScorers[i]
                                                              .goals
                                                              .toString(),
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: AppColors
                                                                .kMyWhite,
                                                          ),
                                                        ),
                                                      ],
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
