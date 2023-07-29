part of 'league_teams_cubit.dart';

@immutable
abstract class LeagueTeamsState {}

class LeagueTeamsLoading extends LeagueTeamsState {}

class LeagueTeamsSuccess extends LeagueTeamsState {
  final LeagueTeamsModel leagueTeams;
  LeagueTeamsSuccess({required this.leagueTeams});
}

class LeagueTeamsFaild extends LeagueTeamsState {}
