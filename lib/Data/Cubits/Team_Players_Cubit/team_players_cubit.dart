import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sport_wise_app/Data/Models/team_players_model/team_players_model.dart';

import '../../Repositories/team_players_repo.dart';

part 'team_players_state.dart';

class TeamPlayersCubit extends Cubit<TeamPlayersState> {
  TeamPlayersCubit() : super(TeamPlayersLoading());

   getTeamPlayers() {
    emit(TeamPlayersLoading());
    TeamPlayersRepo().showTeamPlayers().then((value) {
      if (value != null) {
        emit(TeamPlayersSuccess(teamPlayers: value));
      } else {
        emit(TeamPlayersFaild());
      }
    });
  }

}
