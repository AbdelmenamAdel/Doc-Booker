import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markaz_elamal/core/extensions/context_extension.dart';
import 'package:markaz_elamal/core/styles/colors/colors_light.dart';
import 'package:markaz_elamal/features/auth/presentation/widgets/login_form_container.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsLight.secondaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.r, vertical: 72.r),
            child: Text(
              "Let's start with \nsign in",
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: ColorsLight.white, fontWeight: FontWeight.w600),
            ),
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            height: 0.6 * context.height,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  height: 0.6 * context.height,
                  decoration: BoxDecoration(
                    color: ColorsLight.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(72.r),
                      topRight: Radius.circular(72.r),
                    ),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.r, vertical: 24.r),
                ),
                const LoginFormContainer(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 24.0.r),
                    child: GestureDetector(
                      onTap: () {},
                      child: RichText(
                        text: TextSpan(
                          text: 'Don’t have an account? ',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontWeight: FontWeight.w600),
                          children: [
                            TextSpan(
                              text: ' Sign up',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: ColorsLight.mainColor,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
