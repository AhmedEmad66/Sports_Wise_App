part of 'team_players_cubit.dart';

@immutable
abstract class TeamPlayersState {}

class TeamPlayersLoading extends TeamPlayersState {}
class TeamPlayersSuccess extends TeamPlayersState {
  final TeamPlayersModel teamPlayers;
  TeamPlayersSuccess({required this.teamPlayers});
}
class TeamPlayersFaild extends TeamPlayersState {}
