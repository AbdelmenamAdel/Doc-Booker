import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markaz_elamal/core/extensions/context_extension.dart';
import 'package:markaz_elamal/core/styles/fonts/font_family_helper.dart';
import 'package:markaz_elamal/core/styles/fonts/font_weight_helper.dart';
import 'package:markaz_elamal/core/styles/images/app_images.dart';
import 'package:markaz_elamal/core/styles/strings/app_strings.dart';
import 'package:markaz_elamal/features/welcome/views/onboarding_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then(
      (value) {
        if (mounted) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => OnboardingView(),
          ));
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 12.h,
          children: [
            SizedBox(
                height: 300.h,
                width: 250.w,
                child: Image.asset(AppImages.appLogo)),
            Text(
              context.translate(AppStrings.appName),
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontFamily: FontFamilyHelper.peraltaEnglish,
                    fontWeight: FontWeightHelper.regular,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
