import 'package:api_test/core/common/styles/global_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double? dividerHeight;
  final Color? backgroundColor;
  final Color? dividerColor;
  final String title;
  final VoidCallback? onMarkAllRead; // optional callback

  const CustomAppBar({
    super.key,
    this.backgroundColor,
    this.dividerColor,
    required this.title,
    this.onMarkAllRead,
    this.dividerHeight,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(color: backgroundColor ?? Color(0xFF3FA399   )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
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
        Icon(Icons.settings, color: Colors.white,),
        ],
      )
    );
  }
}
