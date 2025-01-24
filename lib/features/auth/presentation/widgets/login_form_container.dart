import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:markaz_elamal/core/extensions/context_extension.dart';
import 'package:markaz_elamal/core/styles/colors/colors_light.dart';
import 'package:markaz_elamal/core/styles/fonts/font_family_helper.dart';
import 'package:markaz_elamal/core/styles/images/app_images.dart';
import 'package:markaz_elamal/core/styles/strings/app_strings.dart';
import 'package:markaz_elamal/core/widgets/custom_button.dart';
import 'package:markaz_elamal/core/widgets/custom_text_field.dart';
import 'package:markaz_elamal/features/auth/presentation/widgets/forget_password_bottom_sheet.dart';

class LoginFormContainer extends StatelessWidget {
  const LoginFormContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -0.15 * context.height, // Move upwards but still within bounds
      left: 0.1 * context.width,
      right: 0.1 * context.width,
      child: Material(
        // Use Material to ensure proper interaction
        color: Colors.transparent, // Transparent to match the design
        child: Container(
          decoration: BoxDecoration(
            color: ColorsLight.secondaryColor,
            borderRadius: BorderRadius.circular(50.r),
            border: Border.all(color: ColorsLight.white, width: 8.w),
          ),
          width: context.width * 0.8, // Ensure it fits within the screen
          height: context.height * 0.45,
          padding: EdgeInsets.all(16.r), // Add padding for better layout
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                AppImages.appLogoSVG,
                height: 120.h,
              ),
              Padding(
                padding: EdgeInsets.only(top: 12.h, bottom: 24.h),
                child: Text(
                  context.translate(
                    AppStrings.appName,
                  ),
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: ColorsLight.white,
                      fontFamily: FontFamilyHelper.peraltaEnglish),
                ),
              ),
              const CustomTextField(
                hintText: 'Email',
                labelText: 'Email',
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16.h),
              const CustomTextField(
                hintText: 'Password',
                labelText: 'Password',
                prefixIcon: Icons.lock_outline_sharp,
                keyboardType: TextInputType.visiblePassword,
              ),
              SizedBox(height: 16.h),
              CustomButton(
                text: 'Sign In',
                height: 50,
                onPressed: () {},
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      // shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(24)),
                      context: context,
                      builder: (context) => const ForgetPasswordButtomSheet());
                },
                child: Text(
                  'Forgot Password ?',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: ColorsLight.white,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
