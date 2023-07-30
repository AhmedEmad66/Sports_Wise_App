import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:sport_wise_app/Res/app_strings.dart';

import '../../Models/language_model.dart';

part 'change_language_state.dart';

class ChangeLanguageCubit extends Cubit<ChangeLocaleState> {
  ChangeLanguageCubit() : super(ChangeLocaleState(locale: const Locale("en")));

  Future<void> getSavedLanguage() async {
    final String cashedLanguageCode =
        await LanguageCashHelper().getCashedLanguageCode();
    emit(ChangeLocaleState(locale: Locale(cashedLanguageCode)));
    AppStrings.kAppLanguage =
        await LanguageCashHelper().getCashedLanguageCode();
  }

  Future<void> changeLanguege(String languageCode) async {
    await LanguageCashHelper().cashLanguageCode(languageCode);
    emit(ChangeLocaleState(locale: Locale(languageCode)));
  }
}
