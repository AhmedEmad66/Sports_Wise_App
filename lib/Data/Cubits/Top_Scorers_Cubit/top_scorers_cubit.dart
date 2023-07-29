import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sport_wise_app/Data/Models/top_scorers_model/top_scorers_model.dart';

import '../../Repositories/top_scorers_repo.dart';

part 'top_scorers_state.dart';

class TopScorersCubit extends Cubit<TopScorersState> {
  TopScorersCubit() : super(TopScorersLoading());

  getTopScorers() {
    emit(TopScorersLoading());
    TopScorersRepo().showTopScorers().then((value) {
      if (value != null) {
        emit(TopScorersSuccess(leagueTopScorers: value));
      } else {
        emit(TopScorersFaild());
      }
    });
  }
}
