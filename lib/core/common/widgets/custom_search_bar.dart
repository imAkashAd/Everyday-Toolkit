import 'package:api_test/core/common/styles/global_text_style.dart';
import 'package:api_test/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchBar extends StatelessWidget {
  final double? boxtHeight;
  final double? fontSize;
  final Color? fillColor;
  final double? iconHeight;
  final String hintText;
  final Color? iconColor;
  final String? prefixIcon;
  final bool showBorder;

  const CustomSearchBar({
    super.key,
    required this.hintText,
    this.boxtHeight,
    this.fillColor,
    this.prefixIcon,
    this.iconColor,
    this.fontSize,
    this.iconHeight,
    this.showBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: boxtHeight ?? 40.h,
      child: TextField(
        style: getTextStyle(
          color: const Color(0xFF0A0A0A),
          fontSize: fontSize ?? 14.sp,
        ),
        cursorColor: Colors.black,
        cursorHeight: 18,
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: fillColor ?? Colors.white,
          hintStyle: getTextStyle(
            color: const Color(0xFF919EAB),
            fontSize: fontSize ?? 14.sp,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
          prefixIcon: prefixIcon != null
              ? Padding(
                  padding: EdgeInsets.all(8.0.w),
                  child: Image.asset(
                    prefixIcon!,
                    color: iconColor,
                    height: iconHeight ?? 16.h,
                  ),
                )
              : null,

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.r),
            borderSide: showBorder
                ? const BorderSide(color: AppColors.defaultBorderColor)
                : BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.r),
            borderSide: showBorder
                ? const BorderSide(color: AppColors.defaultBorderColor)
                : BorderSide.none,
          ),
        ),
      ),
    );
  }
}
