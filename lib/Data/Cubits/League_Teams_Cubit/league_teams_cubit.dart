import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sport_wise_app/Data/Models/league_teams_model/league_teams_model.dart';

import '../../Repositories/league_teams_repo.dart';

part 'league_teams_state.dart';

class LeagueTeamsCubit extends Cubit<LeagueTeamsState> {
  LeagueTeamsCubit() : super(LeagueTeamsLoading());
  getTeams() {
    emit(LeagueTeamsLoading());
    LeagueTeamsRepo().showAvailableTeams().then((value) {
      if (value != null) {
        emit(LeagueTeamsSuccess(leagueTeams: value));
      } else {
        emit(LeagueTeamsFaild());
      }
    });
  }
  searchTeam() {
    emit(LeagueTeamsLoading());
    LeagueTeamsRepo().searchForTeam().then((value) {
      if (value != null) {
        emit(LeagueTeamsSuccess(leagueTeams: value));
      } else {
        emit(LeagueTeamsFaild());
      }
    });
  }
}
