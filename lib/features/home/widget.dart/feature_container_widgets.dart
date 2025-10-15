import 'package:api_test/core/common/widgets/text_property.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeatureContainerWidgets extends StatelessWidget {
  final String title;
  final Color boxColor;
  final String iconPath;
  final Color? textColor;
  final VoidCallback onTap;

  const FeatureContainerWidgets({
    super.key,
    required this.title,
    required this.boxColor,
    required this.iconPath,
    this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: boxColor,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 3,
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              Image.asset(iconPath, width: 60.w, height: 60.h,),
              SizedBox(height: 20.h),
              TextProperty(
                textAlign: TextAlign.center,
                text: title,
                textColor: textColor ?? Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                lineHeight: 12.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
