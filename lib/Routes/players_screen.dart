import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sport_wise_app/Data/Cubits/Team_Players_Cubit/team_players_cubit.dart';
import 'package:sport_wise_app/Data/Models/team_players_model/result.dart';
import '../Components/dialog_needs.dart';
import '../Components/search_bar.dart';
import '../Res/app_colors.dart';
import '../Res/app_images.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key, required this.teamName});
  final String teamName;
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                teamName,
                style: const TextStyle(
                  fontSize: 30,
                  fontFamily: "Ubuntu",
                  fontWeight: FontWeight.w600,
                  color: AppColors.kPrimaryColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SearchBar(
                hintText: "Search here..",
                width: double.infinity,
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: AppColors.kPrimaryColor,
                thickness: 2,
              ),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                child: BlocBuilder<TeamPlayersCubit, TeamPlayersState>(
                  builder: (context, state) {
                    if (state is TeamPlayersLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is TeamPlayersSuccess) {
                      var ourPlayers = state.teamPlayers.result!;
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
                                for (int index = 0;
                                    index < ourPlayers.length;
                                    index++)
                                  InkWell(
                                    onTap: () {
                                      AwesomeDialog(
                                        context: context,
                                        dialogBackgroundColor:
                                            AppColors.kBackGroundColor,
                                        customHeader: CircleAvatar(
                                          backgroundColor:
                                              AppColors.kMyDarkGrey,
                                          radius: 55,
                                          backgroundImage: NetworkImage(
                                            ourPlayers[index].playerImage ??
                                                AppImages.kImageNotFound,
                                          ),
                                        ),
                                        animType: AnimType.rightSlide,
                                        body: PlayerDialogInfo(
                                            ourPlayers: ourPlayers,
                                            index: index),
                                        btnOkOnPress: () {},
                                        btnOkColor: AppColors.kMyDarkGrey,
                                      ).show();
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      width: double.infinity,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        color: AppColors.kMyDarkGrey,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: AppColors.kMyWhite,
                                            backgroundImage: NetworkImage(
                                              ourPlayers[index].playerImage ??
                                                  AppImages.kImageNotFound,
                                            ),
                                            radius: 25,
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
                                              Text(
                                                ourPlayers[index].playerName ??
                                                    "",
                                                style: const TextStyle(
                                                  color: AppColors.kMyWhite,
                                                  fontSize: 15,
                                                  fontFamily: "Ubuntu",
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                ourPlayers[index].playerType ??
                                                    "",
                                                style: const TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.kMyLightGrey,
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


