import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sport_wise_app/Data/Models/each_country_leagues/each_country_leagues_model.dart';
import 'package:sport_wise_app/Res/api_globle.dart';

int? countryId;


class EachCountryLeaguesRepo {
  Future<EachCountryLeaguesModel?> showAvailableLeagues() async {
    try {
      var response = await http.get(Uri.parse(
          "${ApiStrings.kApiBaseUrl}?met=Leagues&APIkey=${ApiStrings.kApiKey}&countryId=$countryId"));
      Map<String, dynamic> decodeResponse = json.decode(response.body);
      if (response.statusCode == 200) {
        EachCountryLeaguesModel leagues =
            EachCountryLeaguesModel.fromJson(decodeResponse);
        print("Requist success");
        return leagues;
      } else {
        print("Requist Faild");
        return null;
      }
    } catch (error) {
      print("Error: $error");
    }
  }
}
