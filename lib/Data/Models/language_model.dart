import 'package:shared_preferences/shared_preferences.dart';

class Language {
  final String languageName;
  final String languageFlag;
  final String languageCode;

  Language( {required this.languageCode,required this.languageName, required this.languageFlag});

  static List<Language> languageList() {
    return <Language>[
      Language(languageName: "العربية", languageFlag: "🇪🇬", languageCode: 'ar'),
      Language(languageName: "English", languageFlag: "🇬🇧", languageCode: 'en'),
    ];
  }
}


class LanguageCashHelper {
  Future<void> cashLanguageCode(String languageCode) async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString("LOCALE", languageCode);
  }

  Future<String> getCashedLanguageCode() async {
    final sharedPref = await SharedPreferences.getInstance();
    final cashedLanguageCode = sharedPref.getString("LOCALE");
    if (cashedLanguageCode != null) {
      return cashedLanguageCode;
    } else {
      return "en";
    }
  }
}