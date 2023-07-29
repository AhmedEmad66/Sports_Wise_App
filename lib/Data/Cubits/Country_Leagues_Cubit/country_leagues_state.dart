part of 'country_leagues_cubit.dart';

@immutable
abstract class CountryLeaguesState {}

class CountryLeaguesLoading extends CountryLeaguesState {}

class CountryLeaguesSuccess extends CountryLeaguesState {
  final EachCountryLeaguesModel countryLeagues;
  CountryLeaguesSuccess({required this.countryLeagues});
}

class CountryLeaguesFaild extends CountryLeaguesState {}
