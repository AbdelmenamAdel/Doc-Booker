import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markaz_elamal/core/app/app_cubit/app_cubit.dart';
import 'package:markaz_elamal/core/app/app_cubit/app_state.dart';
import 'package:markaz_elamal/core/language/app_localizations_setup.dart';
import 'package:markaz_elamal/main.dart';

class MarkazElamal extends StatelessWidget {
  const MarkazElamal({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: BlocBuilder<AppCubit, AppState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            final cubit = context.read<AppCubit>();
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              locale: Locale(cubit.currentLangCode),
              supportedLocales: AppLocalizationsSetup.supportedLocales,
              localizationsDelegates:
                  AppLocalizationsSetup.localizationsDelegates,
              localeResolutionCallback:
                  AppLocalizationsSetup.localeResolutionCallback,
              // theme: cubit.isDark ? themeLight() : themeDark(),
              home: const SplashView(),
              // onGenerateRoute: AppRoutes.onGenerateRoute,
              // initialRoute:
              //     SharedPref().getString(PrefKeys.accessToken) != null
              //         ? SharedPref().getString(PrefKeys.userRole) == 'admin'
              //             ? AppRoutes.homeAdmin
              //             : SharedPref().getString(PrefKeys.userRole) ==
              //                     'customer'
              //                 ? AppRoutes.mainCustomer
              //                 : AppRoutes.login
              //         : AppRoutes.login,
            );
          },
        ),
      ),
    );
  }
}
