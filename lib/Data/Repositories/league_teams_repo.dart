import 'package:sport_wise_app/Data/Models/league_teams_model/league_teams_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LeagueTeamsRepo {
  Future<LeagueTeamsModel?> showAvailableTeams() async {
    try {
      var response = await http.get(Uri.parse(
          "https://apiv2.allsportsapi.com/football/?&met=Teams&teamId=96&APIkey=fe7a2e6000ad6486001d7a4e2761c756020f82d0eb9e0f6040d30e131df55787"));
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
