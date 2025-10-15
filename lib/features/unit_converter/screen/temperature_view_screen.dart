import 'package:api_test/core/common/widgets/text_property.dart';
import 'package:api_test/core/utils/constants/icon_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TemperatureViewScreen extends StatelessWidget {
  const TemperatureViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 1,
                blurRadius: 10,
                offset:  Offset(3, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              TextProperty(
                text: 'From:',
                textColor: Colors.grey,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                lineHeight: 24.h,
              ),
              SizedBox(height: 20.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextProperty(
                    text: '98.8',
                    textColor: Colors.black,
                    fontSize: 45.sp,
                    fontWeight: FontWeight.bold,
                    lineHeight: 40.h,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: Color(0xFFF6B187).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                    child: TextProperty(
                      text: 'Fahrenheit',
                      textColor: Color.fromARGB(255, 253, 160, 102),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      lineHeight: 12.h,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        CircleAvatar(
          radius: 30.r,
          backgroundColor: Color(0xFFF6B187),
          child: Image.asset(IconPath.convert, height: 40.h, width: 40.w,),
        ),
        SizedBox(height: 20.h),
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 1,
                blurRadius: 10,
                offset:  Offset(3, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              TextProperty(
                text: 'To:',
                textColor: Colors.grey,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                lineHeight: 24.h,
              ),
              SizedBox(height: 20.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextProperty(
                    text: '37.11',
                    textColor: Colors.black,
                    fontSize: 45.sp,
                    fontWeight: FontWeight.bold,
                    lineHeight: 40.h,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: Color(0xFFF6B187).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                    child: TextProperty(
                      text: 'Celsius',
                      textColor: Color.fromARGB(255, 253, 160, 102),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      lineHeight: 12.h,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
