import 'package:api_test/core/common/styles/global_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double? dividerHeight;
  final Color? backgroundColor;
  final Color? dividerColor;
  final String title;
  final  bool? homePage;

  const CustomAppBar({
    super.key,
    this.backgroundColor,
    this.dividerColor,
    required this.title,
    this.dividerHeight,
    this.homePage,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 50.h, bottom: 16.h),
      decoration: BoxDecoration(color: backgroundColor ?? Color(0xFF3FA399)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          if (homePage == false)
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white,),
            )
            else 
            SizedBox(width: 24.w,),
          Center(
          child: Text(
            title,
            style: getTextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              lineHeight: 12.h,
            ),
          )
        ),
        SizedBox(width: 80.w,),

        if (homePage == true)
        GestureDetector(
          onTap: () {},
          child: Icon(Icons.settings, color: Colors.white,)),
        ],
      )
    );
  }
}
