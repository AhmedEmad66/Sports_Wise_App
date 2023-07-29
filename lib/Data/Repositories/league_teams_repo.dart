import 'package:sport_wise_app/Data/Models/league_teams_model/league_teams_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../Res/api_globle.dart';

int? leagueId;
String? apiTeamName;

class LeagueTeamsRepo {
  Future<LeagueTeamsModel?> showAvailableTeams() async {
    try {
      var response = await http.get(Uri.parse(
          "${ApiStrings.kApiBaseUrl}?&met=Teams&APIkey=${ApiStrings.kApiKey}&leagueId=$leagueId"));
      Map<String, dynamic> decodeResponse = json.decode(response.body);
      if (response.statusCode == 200) {
        LeagueTeamsModel teams = LeagueTeamsModel.fromJson(decodeResponse);
        print("Requist success");
        return teams;
      } else {
        print("Requist Faild");
        return null;
      }
    } catch (error) {
      print("Error: $error");
    }
  }

  Future<LeagueTeamsModel?> searchForTeam() async {
    try {
      var response = await http.get(Uri.parse(
          "${ApiStrings.kApiBaseUrl}?&met=Teams&APIkey=${ApiStrings.kApiKey}&teamName=$apiTeamName"));
      Map<String, dynamic> decodeResponse = json.decode(response.body);
      if (response.statusCode == 200) {
        LeagueTeamsModel teams = LeagueTeamsModel.fromJson(decodeResponse);
        print("Requist success");
        return teams;
      } else {
        print("Requist Faild");
        return null;
      }
    } catch (error) {
      print("Error: $error");
    }
  }
}
