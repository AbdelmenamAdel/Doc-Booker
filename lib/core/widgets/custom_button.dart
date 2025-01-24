import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markaz_elamal/core/styles/colors/colors_light.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.height,
    required this.text,
    this.onPressed,
    this.width,
    this.color,
  });
  final double? height;
  final double? width;
  final Color? color;
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.0.sp),
      child: MaterialButton(
        height: height ?? 60,
        minWidth: width ?? double.infinity,
        color: color ?? ColorsLight.white,
        padding: EdgeInsets.symmetric(horizontal: 32.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
          side: const BorderSide(color: ColorsLight.white),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: color == null
                    ? ColorsLight.secondaryColor
                    : ColorsLight.white,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
    );
  }
}
