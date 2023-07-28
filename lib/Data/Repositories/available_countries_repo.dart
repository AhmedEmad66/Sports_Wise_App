import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sport_wise_app/Data/Models/available_countries_model/available_countries_model.dart';

class AvailableCountriesRepo {
  Future<AvailableCountriesModel?> showAvailableCountries() async {
    try {
      var response = await http.get(Uri.parse(
          "https://apiv2.allsportsapi.com/football/?met=Countries&APIkey=fe7a2e6000ad6486001d7a4e2761c756020f82d0eb9e0f6040d30e131df55787"));
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
