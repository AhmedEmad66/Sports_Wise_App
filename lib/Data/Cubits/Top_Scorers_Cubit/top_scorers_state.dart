part of 'top_scorers_cubit.dart';

@immutable
abstract class TopScorersState {}

class TopScorersLoading extends TopScorersState {}
class TopScorersSuccess extends TopScorersState {
  final TopScorersModel leagueTopScorers;
  TopScorersSuccess({required this.leagueTopScorers});
}
class TopScorersFaild extends TopScorersState {}
