import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:markaz_elamal/core/app/app_cubit/app_state.dart';
import 'package:markaz_elamal/core/services/shared_pref/pref_keys.dart';
import 'package:markaz_elamal/core/services/shared_pref/shared_pref.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppStateInitial());
  bool isDark = true;

  String currentLangCode = 'en';

//Theme Mode
  Future<void> changeAppThemeMode({bool? sharedMode}) async {
    if (sharedMode != null) {
      isDark = sharedMode;
      emit(AppStateThemeChangeMode(isDark: isDark));
    } else {
      isDark = !isDark;
      await SharedPref().setBoolean(PrefKeys.themeMode, isDark).then((value) {
        emit(AppStateThemeChangeMode(isDark: isDark));
      });
    }
  }

//Language Change
  void getSavedLanguage() {
    final result = SharedPref().containPreference(PrefKeys.language)
        ? SharedPref().getString(PrefKeys.language)
        : 'en';

    currentLangCode = result!;

    emit(AppStateLanguageChange(locale: Locale(currentLangCode)));
  }

  Future<void> _changeLang(String langCode) async {
    await SharedPref().setString(PrefKeys.language, langCode);
    currentLangCode = langCode;
    emit(AppStateLanguageChange(locale: Locale(currentLangCode)));
  }

  void toArabic() => _changeLang('ar');

  void toEnglish() => _changeLang('en');
}
