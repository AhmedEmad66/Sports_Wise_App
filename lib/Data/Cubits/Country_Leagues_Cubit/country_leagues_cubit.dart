import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sport_wise_app/Data/Models/each_country_leagues/each_country_leagues_model.dart';

import '../../Repositories/each_country_leagues_repo.dart';

part 'country_leagues_state.dart';

class CountryLeaguesCubit extends Cubit<CountryLeaguesState> {
  CountryLeaguesCubit() : super(CountryLeaguesLoading());

  getLeagues() {
    emit(CountryLeaguesLoading());
    EachCountryLeaguesRepo().showAvailableLeagues().then((value) {
      if (value != null) {
        emit(CountryLeaguesSuccess(countryLeagues: value));
      } else {
        emit(CountryLeaguesFaild());
      }
    });
  }
}
