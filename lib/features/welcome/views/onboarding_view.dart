import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markaz_elamal/core/app/app_cubit/app_cubit.dart';
import 'package:markaz_elamal/core/app/app_cubit/app_state.dart';
import 'package:markaz_elamal/core/extensions/context_extension.dart';
import 'package:markaz_elamal/core/language/app_localizations.dart';
import 'package:markaz_elamal/core/styles/colors/colors_light.dart';
import 'package:markaz_elamal/core/styles/strings/app_strings.dart';
import 'package:markaz_elamal/features/welcome/model/onboarding_model.dart';
import 'package:markaz_elamal/features/welcome/widgets/onbarding_container.dart';

class OnboardingView extends StatelessWidget {
  OnboardingView({super.key});
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsLight.secondaryColor,
      body: PageView.builder(
        controller: controller,
        itemCount: OnBoardingModel.onBoardingScreens.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.all(24.0.sp),
                child: BlocBuilder<AppCubit, AppState>(
                  builder: (context, state) {
                    var cubit = context.read<AppCubit>();
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            if (AppLocalizations.of(context)!.isEnLocale) {
                              cubit.toArabic();
                            } else {
                              cubit.toEnglish();
                            }
                          },
                          child: Text(
                            context.translate(AppStrings.language),
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: Colors.white,
                                    ),
                          ),
                        ),
                        index != 2
                            ? Align(
                                alignment: Alignment.centerLeft,
                                child: InkWell(
                                    onTap: () {
                                      controller.jumpToPage(2);
                                    },
                                    child: Text(
                                      context.translate(AppStrings.skip),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: Colors.white,
                                          ),
                                    )),
                              )
                            : const SizedBox.shrink(),
                      ],
                    );
                  },
                ),
              ),

              const Spacer(
                flex: 10,
              ),
              //image
              Padding(
                padding: index == 2
                    ? const EdgeInsets.only(bottom: 0.0)
                    : const EdgeInsets.only(bottom: 24.0),
                child: Image.asset(
                    OnBoardingModel.onBoardingScreens[index].imgPath),
              ),

              const Spacer(
                flex: 1,
              ),
              OnboardingContainer(
                controller: controller,
                index: index,
              )
            ],
          );
        },
      ),
    );
  }
}
