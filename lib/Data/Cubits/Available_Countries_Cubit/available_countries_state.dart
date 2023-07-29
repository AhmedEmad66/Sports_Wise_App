part of 'available_countries_cubit.dart';

@immutable
abstract class AvailableCountriesState {}


class AvailableCountriesLoading extends AvailableCountriesState {}

class AvailableCountriesSuccess extends AvailableCountriesState {
  final AvailableCountriesModel countriesResponse;
  AvailableCountriesSuccess({required this.countriesResponse});
}

class AvailableCountriesFaild extends AvailableCountriesState {}
