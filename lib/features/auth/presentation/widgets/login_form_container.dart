import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markaz_elamal/core/extensions/context_extension.dart';
import 'package:markaz_elamal/core/styles/colors/colors_light.dart';
import 'package:markaz_elamal/core/widgets/custom_text_field.dart';

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomTextField(
                hintText: 'Email',
                labelText: 'Email',
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16.h),
              const CustomTextField(
                hintText: 'Password',
                labelText: 'Password',
                keyboardType: TextInputType.visiblePassword,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
