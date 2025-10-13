import 'package:api_test/core/common/styles/global_text_style.dart';
import 'package:api_test/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final Color? imageColor;
  final BorderRadius? borderRadius;
  final Color? iconColor;
  final IconData? icon;
  final Color? borderColor;
  final String text;
  final String? iconImagePath;
  final Color? color;
  final Color? textColor;
  final VoidCallback onTap;
  final double? fontSize;
  final double? width;
  final double? height;
  final double? iconSize;
  final double? buttonHeight;
  final double? buttonWidth;
  final String? prefixIcon;

  const CustomButton({
    this.imageColor,
    this.borderRadius,
    this.iconColor,
    super.key,
    required this.text,
    required this.onTap,
    this.iconImagePath,
    this.color,
    this.textColor,
    this.fontSize,
    this.borderColor,
    this.icon,
    this.width,
    this.height,
    this.iconSize,
    this.buttonHeight,
    this.buttonWidth,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: buttonWidth,
        // height: 40.h,
        padding: EdgeInsets.only(
          top: 6.h,
          bottom: 6.h,
          left: 22.w,
          right: 22.w,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor ?? Colors.transparent,
            width: 1.w,
          ),
          borderRadius: borderRadius ?? BorderRadius.circular(8.r),
          color: color ?? AppColors.defaultColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconImagePath != null)
              Image.asset(
                iconImagePath!,
                height: height,
                width: width,
                color: imageColor,
              ),
            if (iconImagePath != null) SizedBox(width: 8.h),

            // ignore: unnecessary_null_comparison
            if (text != null)
              Text(
                text,
                style: getTextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: fontSize ?? 14.sp,
                  color: textColor ?? Colors.white,
                  lineHeight: 8.h,
                ),
              ),
            if (icon != null)
              Row(
                children: [
                  SizedBox(width: 8.w),
                  Icon(icon!, color: iconColor ?? Colors.white, size: iconSize),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
