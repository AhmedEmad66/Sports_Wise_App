import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sport_wise_app/Data/Cubits/Team_Players_Cubit/team_players_cubit.dart';
import 'package:sport_wise_app/Data/Repositories/team_players_repo.dart';
import '../Components/custom_back_arrow.dart';
import '../Components/dialog_needs.dart';
import '../Components/search_bar.dart';
import '../Res/app_colors.dart';
import '../Res/app_images.dart';
import '../Res/app_strings.dart';
import '../generated/l10n.dart';

class PlayerScreen extends StatelessWidget {
  PlayerScreen({super.key, required this.teamName});
  final String teamName;

  TextEditingController _searchPlayerController = TextEditingController();
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppStrings.kAppLanguage == "en"
                      ? const CustomBackArrowLeft()
                      : const CustomBackArrowRight(),
                  const Spacer(
                    flex: 1,
                  ),
                  Text(
                    teamName,
                    style: TextStyle(
                      fontSize: teamName.length < 17 ? 30 : 20,
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
              Form(
                child: SearchBar(
                  hintText: S.of(context).searchBarHintText,
                  width: double.infinity,
                  controller: _searchPlayerController,
                  onPressed: () {
                    playerName = _searchPlayerController.text;
                    context.read<TeamPlayersCubit>().searchPlayer();
                    _searchPlayerController.text = "";
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
               Divider(
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
                      return Shimmer.fromColors(
                        baseColor: const Color.fromARGB(255, 247, 247, 247)
                            .withOpacity(0.4),
                        highlightColor: const Color.fromARGB(255, 255, 255, 255)
                            .withOpacity(0.1),
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: AnimationLimiter(
                            child: Column(
                              children: AnimationConfiguration.toStaggeredList(
                                duration: const Duration(milliseconds: 500),
                                childAnimationBuilder: (widget) =>
                                    SlideAnimation(
                                  verticalOffset: 50.0,
                                  child: FadeInAnimation(
                                    child: widget,
                                  ),
                                ),
                                children: [
                                  for (int index = 0; index < 10; index++)
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      width: double.infinity,
                                      height: 90,
                                      decoration: BoxDecoration(
                                        color: AppColors.kMyLightGrey,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
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
                                        horizontal: 10,
                                      ),
                                      width: double.infinity,
                                      height: 90,
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
                                            radius: 35,
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
                                                style: TextStyle(
                                                  color: AppColors.kMyWhite,
                                                  fontSize: ourPlayers[index]
                                                              .playerName!
                                                              .length <
                                                          23
                                                      ? 18
                                                      : 15,
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
                                                  fontFamily: "Ubuntu",
                                                  fontSize: 13,
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
