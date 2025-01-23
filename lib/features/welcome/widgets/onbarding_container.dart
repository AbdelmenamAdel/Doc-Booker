import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markaz_elamal/core/extensions/context_extension.dart';
import 'package:markaz_elamal/core/styles/colors/colors_light.dart';
import 'package:markaz_elamal/core/styles/fonts/font_weight_helper.dart';
import 'package:markaz_elamal/core/styles/strings/app_strings.dart';
import 'package:markaz_elamal/features/auth/presentation/views/login_view.dart';
import 'package:markaz_elamal/features/welcome/model/onboarding_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingContainer extends StatelessWidget {
  const OnboardingContainer({
    super.key,
    required this.controller,
    required this.index,
  });
  final PageController controller;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.h),
      decoration: BoxDecoration(
        color: ColorsLight.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(72.r),
          topRight: Radius.circular(72.r),
        ),
      ),
      width: double.infinity,
      height: 0.4 * MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
            context.translate(OnBoardingModel.onBoardingScreens[index].title),
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.w600),
          ),
          const Spacer(flex: 1),
          //subTitle
          Text(
            context
                .translate(OnBoardingModel.onBoardingScreens[index].subTitle),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const Spacer(flex: 2),

          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Row(
              children: [
                SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    activeDotColor: ColorsLight.secondaryColor,
                    dotColor: const Color(0xff9ECAE3),
                    dotHeight: 12.h,
                    spacing: 12.w,
                    radius: 56.r,
                  ),
                ),
                const Spacer(),
                index == 2
                    ? InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginView(),
                              ));
                        },
                        child: Row(
                          children: [
                            Text(
                              context.translate(AppStrings.start),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontWeight: FontWeightHelper.medium),
                            ),
                            const Icon(Icons.arrow_forward_sharp)
                          ],
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          controller.nextPage(
                              duration: const Duration(milliseconds: 1000),
                              curve: Curves.fastLinearToSlowEaseIn);
                        },
                        child: Row(
                          children: [
                            Text(
                              context.translate(AppStrings.next),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontWeight: FontWeightHelper.medium),
                            ),
                            const Icon(Icons.arrow_forward_sharp)
                          ],
                        ),
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
