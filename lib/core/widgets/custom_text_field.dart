import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markaz_elamal/core/styles/colors/colors_light.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.keyboardType,
    this.borderColor,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
  });

  final String? hintText;
  final String? labelText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;
  final Color? borderColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45, // Adjust height with screen scaling if needed
      width: double.infinity, // Let it expand as needed
      child: TextField(
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: borderColor ?? ColorsLight.white,
            ),
        keyboardType: keyboardType,
        cursorColor: borderColor ?? ColorsLight.white,
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
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          prefixIconColor: borderColor ?? ColorsLight.white,
          suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
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
