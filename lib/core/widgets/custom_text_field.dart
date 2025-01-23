import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markaz_elamal/core/styles/colors/colors_light.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.keyboardType,
    this.borderColor,
    required this.labelText,
  });

  final String hintText;
  final String labelText;
  final TextInputType keyboardType;
  final Color? borderColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45, // Adjust height with screen scaling if needed
      width: 300, // Let it expand as needed
      child: TextField(
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: ColorsLight.white,
            ),
        keyboardType: keyboardType,
        cursorColor: ColorsLight.white,
        cursorErrorColor: Colors.red,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: borderColor ?? ColorsLight.white,
              ),
          labelText: labelText,
          labelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: borderColor ?? ColorsLight.white,
              ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14), // Rounded corners
            borderSide:
                BorderSide(color: borderColor ?? ColorsLight.white, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide:
                BorderSide(color: borderColor ?? ColorsLight.white, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide:
                BorderSide(color: borderColor ?? ColorsLight.white, width: 2),
          ),

          filled: true, // Background fill
          fillColor: Colors.transparent, // Background color
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
        ),
      ),
    );
  }
}
