import 'package:api_test/core/common/styles/global_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomDropdownField extends StatelessWidget {
  final double? fontSize;
  final String hintText;
  final BorderSide? borderSide;
  final List<String> items;
  final RxString selectedValue;
  final RxString? selectedValue1;
  final double? height;
  final Color? hintTextColor;
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;
  final Color fillColor;
  final EdgeInsets contentPadding;

  const CustomDropdownField({
    super.key,
    this.fontSize,
    this.hintTextColor,
    required this.hintText,
    this.borderSide,
    required this.items,
    required this.selectedValue,
    this.selectedValue1,
    this.height,
    this.borderColor = const Color(0xFFF3F3F5),
    this.borderWidth = 0,
    this.borderRadius = 8.0,
    this.fillColor = const Color(0xFFF3F3F5),
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 2,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.white),
        child: Obx(
          () => DropdownButtonFormField<String>(
            isExpanded: true,
            icon: Icon(Icons.keyboard_arrow_down_outlined, size: 28.h),
            hint: Flexible(
              child: Text(
                hintText,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: getTextStyle(
                  color: hintTextColor ?? Color(0xFF0A0A0A),
                  fontSize: fontSize ?? 12.sp,
                ),
              ),
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: getTextStyle(
                color: hintTextColor ?? Color(0xFF0A0A0A),
                fontSize: fontSize ?? 14.sp,
              ),
              filled: true,
              fillColor: fillColor,
              contentPadding: contentPadding,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor, width: borderWidth),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: borderSide ?? BorderSide.none,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
            // ignore: deprecated_member_use
            value: selectedValue.value.isEmpty ? null : selectedValue.value,
            items: items
                .map(
                  (value) => DropdownMenuItem(
                    value: value,
                    child: Text(value, style: getTextStyle(fontSize: 14.sp)),
                  ),
                )
                .toList(),
            onChanged: (value) {
              if (value != null) {
                selectedValue.value = value;
              }
            },
          ),
        ),
      ),
    );
  }
}
