import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:markaz_elamal/core/app/app_cubit/app_cubit.dart';
import 'package:markaz_elamal/core/common/screens/markaz_elamal.dart';
import 'package:markaz_elamal/core/services/shared_pref/pref_keys.dart';
import 'package:markaz_elamal/core/services/shared_pref/shared_pref.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPref().instantiatePreferences();
  runApp(
    DevicePreview(
      builder: (context) => BlocProvider(
        create: (context) => AppCubit()
          ..changeAppThemeMode(
            sharedMode: SharedPref().getBoolean(PrefKeys.themeMode),
          )
          ..getSavedLanguage(),
        child: const MarkazElamal(),
      ),
    ),
  );
}
