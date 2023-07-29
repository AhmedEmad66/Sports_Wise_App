import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sport_wise_app/Data/Models/team_players_model/team_players_model.dart';

import '../../Res/api_globle.dart';

int? teamId;

class TeamPlayersRepo {
  Future<TeamPlayersModel?> showTeamPlayers() async {
    try {
      var response = await http.get(Uri.parse(
          "${ApiStrings.kApiBaseUrl}?&met=Players&APIkey=${ApiStrings.kApiKey}&teamId=$teamId"));
      Map<String, dynamic> decodeResponse = json.decode(response.body);
      if (response.statusCode == 200) {
        TeamPlayersModel players = TeamPlayersModel.fromJson(decodeResponse);
        print("Requist success");
        return players;
      } else {
        print("Requist Faild");
        return null;
      }
    } catch (error) {
      print("Error: $error");
    }
  }
}
