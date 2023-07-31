import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sport_wise_app/Data/Cubits/Available_Countries_Cubit/available_countries_cubit.dart';
import 'package:sport_wise_app/Data/Cubits/Change_Language_Cubit/change_language_cubit.dart';
import 'package:sport_wise_app/Data/Cubits/Country_Leagues_Cubit/country_leagues_cubit.dart';
import 'package:sport_wise_app/Data/Cubits/League_Teams_Cubit/league_teams_cubit.dart';
import 'package:sport_wise_app/Data/Cubits/Team_Players_Cubit/team_players_cubit.dart';
import 'package:sport_wise_app/Data/Cubits/Theme_Mode_Cubit/theme_mode_switch_cubit.dart';
import 'package:sport_wise_app/Data/Cubits/Top_Scorers_Cubit/top_scorers_cubit.dart';
import 'FireBase/firebase_notifications.dart';
import 'Routes/splash_screen.dart';
import 'generated/l10n.dart';

Future<void> main() async {
  // Notifications
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().initNotifications();
  // responsive tester package
  runApp(DevicePreview(builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // All App BlocProvider
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AvailableCountriesCubit(),
        ),
        BlocProvider(
          create: (context) => CountryLeaguesCubit(),
        ),
        BlocProvider(
          create: (context) => LeagueTeamsCubit(),
        ),
        BlocProvider(
          create: (context) => TopScorersCubit(),
        ),
        BlocProvider(
          create: (context) => TeamPlayersCubit(),
        ),
        BlocProvider(
          create: (context) => ThemeModeSwitchCubit(),
        ),
        BlocProvider(
          create: (context) => ChangeLanguageCubit()..getSavedLanguage(),
        ),
      ],
      child: BlocBuilder<ChangeLanguageCubit, ChangeLocaleState>(
        builder: (context, state) {
          return MaterialApp(
            // localization
            locale: state.locale,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            // hide debug banner
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(),
            routes: {
              SplashScreen.id: (context) => const SplashScreen(),
            },
          );
        },
      ),
    );
  }
}
