import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sport_wise_app/Data/Models/available_countries_model/available_countries_model.dart';

import '../../Res/api_globle.dart';

class AvailableCountriesRepo {
  Future<AvailableCountriesModel?> showAvailableCountries() async {
    try {
      var response = await http.get(Uri.parse(
          "${ApiStrings.kApiBaseUrl}?met=Countries&APIkey=${ApiStrings.kApiKey}"));
      Map<String, dynamic> decodeResponse = json.decode(response.body);
      if (response.statusCode == 200) {
        AvailableCountriesModel countries =
            AvailableCountriesModel.fromJson(decodeResponse);
        print("Requist success");
        return countries;
      } else {
        print("Requist Faild");
        return null;
      }
    } catch (error) {
      print("Error: $error");
    }
  }
}
