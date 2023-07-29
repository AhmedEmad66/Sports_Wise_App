import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sport_wise_app/Data/Models/available_countries_model/available_countries_model.dart';

import '../../Repositories/available_countries_repo.dart';

part 'available_countries_state.dart';

class AvailableCountriesCubit extends Cubit<AvailableCountriesState> {
  AvailableCountriesCubit() : super(AvailableCountriesLoading());

  getCountries() {
    emit(AvailableCountriesLoading());
    AvailableCountriesRepo().showAvailableCountries().then((value) {
      if (value != null) {
        emit(AvailableCountriesSuccess(countriesResponse: value));
      } else {
        emit(AvailableCountriesFaild());
      }
    });
  }
}
