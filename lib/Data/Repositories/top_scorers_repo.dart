import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sport_wise_app/Data/Models/top_scorers_model/top_scorers_model.dart';
import 'package:sport_wise_app/Data/Repositories/league_teams_repo.dart';
import 'package:sport_wise_app/Res/api_globle.dart';

class TopScorersRepo {
  Future<TopScorersModel?> showTopScorers() async {
    try {
      var response = await http.get(Uri.parse(
          "${ApiStrings.kApiBaseUrl}?&met=Topscorers&APIkey=${ApiStrings.kApiKey}&leagueId=$leagueId"));
      Map<String, dynamic> decodeResponse = json.decode(response.body);
      if (response.statusCode == 200) {
        TopScorersModel topScorers = TopScorersModel.fromJson(decodeResponse);
        if (topScorers.result != null) {
          print("Requist success");
          return topScorers;
        } else {
          print("Value is Null");
        }
      } else {
        print("Requist Faild");
        return null;
      }
    } catch (error) {
      print("Error: $error");
    }
  }
}
