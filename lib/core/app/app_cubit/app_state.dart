import 'dart:ui';

abstract class AppState {}

class AppStateInitial extends AppState {}

class AppStateThemeChangeMode extends AppState {
  final bool isDark;
  AppStateThemeChangeMode({required this.isDark});
}

class AppStateLanguageChange extends AppState {
  final Locale locale;
  AppStateLanguageChange({required this.locale});
}
