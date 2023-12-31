import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sport_wise_app/Data/Models/team_players_model/team_players_model.dart';

import '../../Res/api_globle.dart';

int? teamId;
String? playerName;

class TeamPlayersRepo {
  Future<TeamPlayersModel?> showTeamPlayers() async {
    try {
      var response = await http.get(Uri.parse(
          "${ApiStrings.kApiBaseUrl}?&met=Players&APIkey=${ApiStrings.kApiKey}&teamId=$teamId"));
      Map<String, dynamic> decodeResponse = json.decode(response.body);
      if (response.statusCode == 200) {
        TeamPlayersModel players = TeamPlayersModel.fromJson(decodeResponse);
        if (players.result != null) {
          print("Requist success");
          return players;
        } else {
          print("Value Is Null");
        }
      } else if (response.statusCode == 404) {
        print("Data not found on the server.");
      } else {
        print("Requist Faild");
        return null;
      }
    } catch (error) {
      print("Error: $error");
    }
  }

  Future<TeamPlayersModel?> searchForPlayer() async {
    try {
      var response = await http.get(Uri.parse(
          "${ApiStrings.kApiBaseUrl}?&met=Players&APIkey=${ApiStrings.kApiKey}&teamId=$teamId&playerName=$playerName"));
      Map<String, dynamic> decodeResponse = json.decode(response.body);
      if (response.statusCode == 200) {
        TeamPlayersModel players = TeamPlayersModel.fromJson(decodeResponse);
        if (players.result != null) {
          print("Requist success");
          return players;
        } else {
          print("Value is Null");
        }
      } else if (response.statusCode == 404) {
        print("Data not found on the server.");
      } else {
        print("Requist Faild");
        return null;
      }
    } catch (error) {
      print("Error: $error");
    }
  }
}
