import 'package:flutter/material.dart';
import '../Data/Models/team_players_model/result.dart';
import '../Res/app_colors.dart';

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
              style:  TextStyle(
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
                  text: "Name: ",
                  answer: ourPlayers[index].playerName ?? "",
                ),
      ourPlayers[index].playerType == ""
          ? const SizedBox()
          : ourPlayers[index].playerType == null
              ? const SizedBox()
              : CustomText(
                  text: "Position: ",
                  answer: ourPlayers[index].playerType ?? '',
                ),
      ourPlayers[index].playerNumber == ""
          ? const SizedBox()
          : ourPlayers[index].playerNumber == null
              ? const SizedBox()
              : CustomText(
                  text: "Number: ",
                  answer: ourPlayers[index].playerNumber ?? "",
                ),
      ourPlayers[index].playerAge == ""
          ? const SizedBox()
          : ourPlayers[index].playerAge == null
              ? const SizedBox()
              : CustomText(
                  text: "Age: ",
                  answer: ourPlayers[index].playerAge ?? '',
                ),
      ourPlayers[index].playerCountry == ""
          ? const SizedBox()
          : ourPlayers[index].playerCountry == null
              ? const SizedBox()
              : CustomText(
                  text: "Country: ",
                  answer: ourPlayers[index].playerCountry ?? "NotAllowed",
                ),
      ourPlayers[index].playerYellowCards == ""
          ? const SizedBox()
          : ourPlayers[index].playerYellowCards == null
              ? const SizedBox()
              : CustomText(
                  text: "Yellow Cards: ",
                  answer: ourPlayers[index].playerYellowCards ?? '',
                ),
      ourPlayers[index].playerRedCards == ""
          ? const SizedBox()
          : ourPlayers[index].playerRedCards == null
              ? const SizedBox()
              : CustomText(
                  text: "Red Cards: ",
                  answer: ourPlayers[index].playerRedCards ?? '',
                ),
      ourPlayers[index].playerGoals == ""
          ? const SizedBox()
          : ourPlayers[index].playerGoals == null
              ? const SizedBox()
              : CustomText(
                  text: "Goals: ",
                  answer: ourPlayers[index].playerGoals ?? '',
                ),
      ourPlayers[index].playerAssists == ""
          ? const SizedBox()
          : ourPlayers[index].playerAssists == null
              ? const SizedBox()
              : CustomText(
                  text: "Assists: ",
                  answer: ourPlayers[index].playerAssists ?? '',
                ),
    ]);
  }
}
