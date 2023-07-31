import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shimmer/shimmer.dart';

import '../../Components/search_bar.dart';
import '../../Data/Cubits/League_Teams_Cubit/league_teams_cubit.dart';
import '../../Data/Cubits/Team_Players_Cubit/team_players_cubit.dart';
import '../../Data/Repositories/league_teams_repo.dart';
import '../../Data/Repositories/team_players_repo.dart';
import '../../Res/app_colors.dart';
import '../../Res/app_images.dart';
import '../../generated/l10n.dart';
import '../players_screen.dart';

class LeagueTeams extends StatefulWidget {
  const LeagueTeams({super.key});

  @override
  State<LeagueTeams> createState() => _LeagueTeamsState();
}

class _LeagueTeamsState extends State<LeagueTeams> {
  final TextEditingController _searchTeamController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void dispose() {
    _searchTeamController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeagueTeamsCubit, LeagueTeamsState>(
      builder: (context, state) {
        if (state is LeagueTeamsLoading) {
          return Shimmer.fromColors(
            baseColor:
                const Color.fromARGB(255, 247, 247, 247).withOpacity(0.4),
            highlightColor:
                const Color.fromARGB(255, 255, 255, 255).withOpacity(0.1),
            child: Expanded(
              child: AnimationLimiter(
                child: GridView.count(
                  physics: const BouncingScrollPhysics(),
                  crossAxisCount: 2,
                  children: List.generate(
                    10,
                    (int index) {
                      return AnimationConfiguration.staggeredGrid(
                        position: index,
                        duration: const Duration(milliseconds: 375),
                        columnCount: 4,
                        child: ScaleAnimation(
                          child: FadeInAnimation(
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              decoration: BoxDecoration(
                                color: AppColors.kMyLightGrey,
                                borderRadius: BorderRadius.circular(15),
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
          );
        } else if (state is LeagueTeamsSuccess) {
          var ourTeams = state.leagueTeams.result!;
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Form(
                  child: CustomSearchBar(
                    hintText: S.of(context).searchBarHintText,
                    width: double.infinity,
                    controller: _searchTeamController,
                    focusNode: _searchFocusNode,
                    onPressed: () {
                      apiTeamName = _searchTeamController.text;
                      _searchFocusNode.unfocus();
                      context.read<LeagueTeamsCubit>().searchTeam();
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
                        return AnimationConfiguration.staggeredGrid(
                          position: index,
                          duration: const Duration(milliseconds: 375),
                          columnCount: 4,
                          child: ScaleAnimation(
                            child: FadeInAnimation(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PlayerScreen(
                                                teamName:
                                                    ourTeams[index].teamName ??
                                                        "",
                                              )));
                                  teamId = ourTeams[index].teamKey;
                                  context
                                      .read<TeamPlayersCubit>()
                                      .getTeamPlayers();
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: AppColors.kMyTransparent,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 110,
                                        width: 130,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: Image.network(
                                            ourTeams[index].teamLogo ??
                                                AppImages.kImageNotFound,
                                            fit: BoxFit.fill,
                                            errorBuilder: (context, exception,
                                                stackTrace) {
                                              return ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                child: Image.network(
                                                  AppImages.kImageNotFound,
                                                  fit: BoxFit.fill,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Text(
                                          ourTeams[index].teamName ?? "",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            backgroundColor: AppColors
                                                .kMyDarkGrey
                                                .withOpacity(0.5),
                                            fontSize: 18,
                                            fontFamily: "Ubuntu",
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.kMyWhite,
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
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Form(
                  child: CustomSearchBar(
                    hintText: S.of(context).searchBarHintText,
                    width: double.infinity,
                    controller: _searchTeamController,
                    focusNode: _searchFocusNode,
                    onPressed: () {
                      apiTeamName = _searchTeamController.text;
                      _searchFocusNode.unfocus();
                      context.read<LeagueTeamsCubit>().searchTeam();
                      _searchTeamController.text = "";
                    },
                  ),
                ),
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.kMyDarkGrey,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    S.of(context).teamsNotExcistMessage,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.kMyWhite,
                      fontFamily: "Ubuntu",
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          );
        }
      },
    );
  }
}
