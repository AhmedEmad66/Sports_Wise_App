import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import '../Data/Models/team_players_model/result.dart';
import '../Res/app_colors.dart';
import '../generated/l10n.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    required this.answer,
  });
  final String text;
  final String answer;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: text,
          style: const TextStyle(
            color: AppColors.kMyLightGrey,
            fontSize: 25,
            fontFamily: "Ubuntu",
          ),
          children: <TextSpan>[
            TextSpan(
              text: answer,
              style: const TextStyle(
                color: AppColors.kPrimaryColor,
                fontSize: 25,
                fontFamily: "Ubuntu",
              ),
            )
          ]),
    );
  }
}

class PlayerDialogInfo extends StatelessWidget {
  const PlayerDialogInfo({
    super.key,
    required this.ourPlayers,
    required this.index,
  });

  final List<Result> ourPlayers;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ourPlayers[index].playerName == ""
          ? const SizedBox()
          : ourPlayers[index].playerName == null
              ? const SizedBox()
              : CustomText(
                  text: S.of(context).playerNameDialog,
                  answer: ourPlayers[index].playerName ?? "",
                ),
      ourPlayers[index].playerType == ""
          ? const SizedBox()
          : ourPlayers[index].playerType == null
              ? const SizedBox()
              : CustomText(
                  text: S.of(context).playerPositionDialog,
                  answer: ourPlayers[index].playerType ?? '',
                ),
      ourPlayers[index].playerNumber == ""
          ? const SizedBox()
          : ourPlayers[index].playerNumber == null
              ? const SizedBox()
              : CustomText(
                  text: S.of(context).playerNumberDialog,
                  answer: ourPlayers[index].playerNumber ?? "",
                ),
      ourPlayers[index].playerAge == ""
          ? const SizedBox()
          : ourPlayers[index].playerAge == null
              ? const SizedBox()
              : CustomText(
                  text: S.of(context).playerAgeDialog,
                  answer: ourPlayers[index].playerAge ?? '',
                ),
      ourPlayers[index].playerCountry == ""
          ? const SizedBox()
          : ourPlayers[index].playerCountry == null
              ? const SizedBox()
              : CustomText(
                  text: S.of(context).playerCountryDialog,
                  answer: ourPlayers[index].playerCountry ?? "NotAllowed",
                ),
      ourPlayers[index].playerYellowCards == ""
          ? const SizedBox()
          : ourPlayers[index].playerYellowCards == null
              ? const SizedBox()
              : CustomText(
                  text: S.of(context).playerYellowCardDialog,
                  answer: ourPlayers[index].playerYellowCards ?? '',
                ),
      ourPlayers[index].playerRedCards == ""
          ? const SizedBox()
          : ourPlayers[index].playerRedCards == null
              ? const SizedBox()
              : CustomText(
                  text: S.of(context).playerRedCardDialog,
                  answer: ourPlayers[index].playerRedCards ?? '',
                ),
      ourPlayers[index].playerGoals == ""
          ? const SizedBox()
          : ourPlayers[index].playerGoals == null
              ? const SizedBox()
              : CustomText(
                  text: S.of(context).playerGoalsDialog,
                  answer: ourPlayers[index].playerGoals ?? '',
                ),
      ourPlayers[index].playerAssists == ""
          ? const SizedBox()
          : ourPlayers[index].playerAssists == null
              ? const SizedBox()
              : CustomText(
                  text: S.of(context).playerAssistsDialog,
                  answer: ourPlayers[index].playerAssists ?? '',
                ),
    ]);
  }
}


