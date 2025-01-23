import 'package:markaz_elamal/core/styles/images/app_images.dart';
import 'package:markaz_elamal/core/styles/strings/app_strings.dart';

class OnBoardingModel {
  final String imgPath;
  final String title;
  final String subTitle;

  OnBoardingModel({
    required this.imgPath,
    required this.title,
    required this.subTitle,
  });
  static List<OnBoardingModel> onBoardingScreens = [
    OnBoardingModel(
      imgPath: AppImages.onboarding1,
      title: AppStrings.onBoardingTitleOne,
      subTitle: AppStrings.onBoardingSubTitleOne,
    ),
    OnBoardingModel(
      imgPath: AppImages.onboarding2,
      title: AppStrings.onBoardingTitleTwo,
      subTitle: AppStrings.onBoardingSubTitleTwo,
    ),
    OnBoardingModel(
      imgPath: AppImages.onboarding3,
      title: AppStrings.onBoardingTitleThree,
      subTitle: AppStrings.onBoardingSubTitleThree,
    ),
  ];
}
