import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sport_wise_app/Data/Models/top_scorers_model/top_scorers_model.dart';

class LeagueTeamsRepo {
  Future<TopScorersModel?> showTopScorers() async {
    try {
      var response = await http.get(Uri.parse(
          "https://apiv2.allsportsapi.com/football/?&met=Topscorers&leagueId=207&APIkey=fe7a2e6000ad6486001d7a4e2761c756020f82d0eb9e0f6040d30e131df55787"));
      Map<String, dynamic> decodeResponse = json.decode(response.body);
      if (response.statusCode == 200) {
        TopScorersModel topScorers = TopScorersModel.fromJson(decodeResponse);
        print("Requist success");
        return topScorers;
      } else {
        print("Requist Faild");
        return null;
      }
    } catch (error) {
      print("Error: $error");
    }
  }
}
