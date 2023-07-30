// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Catch the Action Anywhere, Anytime`
  String get onboardingTitle1 {
    return Intl.message(
      'Catch the Action Anywhere, Anytime',
      name: 'onboardingTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Realtime Score`
  String get onboardingTitle2 {
    return Intl.message(
      'Realtime Score',
      name: 'onboardingTitle2',
      desc: '',
      args: [],
    );
  }

  /// `LET'S GO!`
  String get onboardingTitle3 {
    return Intl.message(
      'LET\'S GO!',
      name: 'onboardingTitle3',
      desc: '',
      args: [],
    );
  }

  /// `1 of 3`
  String get onboardingNumber1 {
    return Intl.message(
      '1 of 3',
      name: 'onboardingNumber1',
      desc: '',
      args: [],
    );
  }

  /// `2 of 3`
  String get onboardingNumber2 {
    return Intl.message(
      '2 of 3',
      name: 'onboardingNumber2',
      desc: '',
      args: [],
    );
  }

  /// `3 of 3`
  String get onboardingNumber3 {
    return Intl.message(
      '3 of 3',
      name: 'onboardingNumber3',
      desc: '',
      args: [],
    );
  }

  /// `With our app, the stadium comes to you! Catch live games`
  String get onboardingDescription1 {
    return Intl.message(
      'With our app, the stadium comes to you! Catch live games',
      name: 'onboardingDescription1',
      desc: '',
      args: [],
    );
  }

  /// `Enjoy score match score updates in realtime without missing a moment`
  String get onboardingDescription2 {
    return Intl.message(
      'Enjoy score match score updates in realtime without missing a moment',
      name: 'onboardingDescription2',
      desc: '',
      args: [],
    );
  }

  /// `we've got you covered with comprehensive coverage and in-depth analysis`
  String get onboardingDescription3 {
    return Intl.message(
      'we\'ve got you covered with comprehensive coverage and in-depth analysis',
      name: 'onboardingDescription3',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skipBtn {
    return Intl.message(
      'Skip',
      name: 'skipBtn',
      desc: '',
      args: [],
    );
  }

  /// `There are many interisting Sports to choose XD`
  String get homeScreenTitle {
    return Intl.message(
      'There are many interisting Sports to choose XD',
      name: 'homeScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Football`
  String get footballCategory {
    return Intl.message(
      'Football',
      name: 'footballCategory',
      desc: '',
      args: [],
    );
  }

  /// `Bascketball`
  String get basketballCategory {
    return Intl.message(
      'Bascketball',
      name: 'basketballCategory',
      desc: '',
      args: [],
    );
  }

  /// `Vollyball`
  String get vollyballCategory {
    return Intl.message(
      'Vollyball',
      name: 'vollyballCategory',
      desc: '',
      args: [],
    );
  }

  /// `Tennis`
  String get tennisCategory {
    return Intl.message(
      'Tennis',
      name: 'tennisCategory',
      desc: '',
      args: [],
    );
  }

  /// `Coming Soon^_^`
  String get comingSoonMessage {
    return Intl.message(
      'Coming Soon^_^',
      name: 'comingSoonMessage',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get messageOkBtn {
    return Intl.message(
      'Ok',
      name: 'messageOkBtn',
      desc: '',
      args: [],
    );
  }

  /// `Contact us`
  String get messageSupportTitle {
    return Intl.message(
      'Contact us',
      name: 'messageSupportTitle',
      desc: '',
      args: [],
    );
  }

  /// `+201282614885`
  String get messageSupportDes1 {
    return Intl.message(
      '+201282614885',
      name: 'messageSupportDes1',
      desc: '',
      args: [],
    );
  }

  /// `+201284897213`
  String get messageSupportDes2 {
    return Intl.message(
      '+201284897213',
      name: 'messageSupportDes2',
      desc: '',
      args: [],
    );
  }

  /// `+201227230520`
  String get messageSupportDes3 {
    return Intl.message(
      '+201227230520',
      name: 'messageSupportDes3',
      desc: '',
      args: [],
    );
  }

  /// `Side Menu`
  String get sideMenuTitle {
    return Intl.message(
      'Side Menu',
      name: 'sideMenuTitle',
      desc: '',
      args: [],
    );
  }

  /// `Light Mode`
  String get themeModeLight {
    return Intl.message(
      'Light Mode',
      name: 'themeModeLight',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get themeModeDark {
    return Intl.message(
      'Dark Mode',
      name: 'themeModeDark',
      desc: '',
      args: [],
    );
  }

  /// `Languages`
  String get languages {
    return Intl.message(
      'Languages',
      name: 'languages',
      desc: '',
      args: [],
    );
  }

  /// `Support`
  String get support {
    return Intl.message(
      'Support',
      name: 'support',
      desc: '',
      args: [],
    );
  }

  /// `Developer Info`
  String get developerInfo {
    return Intl.message(
      'Developer Info',
      name: 'developerInfo',
      desc: '',
      args: [],
    );
  }

  /// `All Countries`
  String get countryScreenTitle {
    return Intl.message(
      'All Countries',
      name: 'countryScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `All Tournaments`
  String get leaguesScreenTitle {
    return Intl.message(
      'All Tournaments',
      name: 'leaguesScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Teams`
  String get teamsTitle {
    return Intl.message(
      'Teams',
      name: 'teamsTitle',
      desc: '',
      args: [],
    );
  }

  /// `TopScorers`
  String get topScorersTitle {
    return Intl.message(
      'TopScorers',
      name: 'topScorersTitle',
      desc: '',
      args: [],
    );
  }

  /// `Search here`
  String get searchBarHintText {
    return Intl.message(
      'Search here',
      name: 'searchBarHintText',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
