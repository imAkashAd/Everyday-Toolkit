import 'package:api_test/core/common/styles/global_text_style.dart';
import 'package:api_test/features/clock_and_alarm/controller/custom_clock_tab_bar_widget_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomClockTabBarWidget extends StatelessWidget {
  const CustomClockTabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CustomClockTabBarWidgetController());

    return Obx(() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF9DD493).withOpacity( 0.6),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(controller.selectedTabs.length, (
              selectedTabIndex,
            ) {
              final isSelected =
                  controller.selectedTabIndex.value == selectedTabIndex;
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () => controller.selectTab(selectedTabIndex),
                    child: Container(
                      // height: 32.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        // border: Border.all(
                          color: isSelected
                              ? Color.fromARGB(255, 109, 209, 92)
                              : Colors.transparent,
                        // ),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 14.w, horizontal: 16.w),
                      child: Center(
                        child: Text(
                          controller.selectedTabs[selectedTabIndex],
                          style: getTextStyle(
                            fontSize: 13.sp,
                            color: isSelected
                                ? Color(0xFFFFFFFF)
                                : Color.fromARGB(255, 32, 136, 14),
                            fontWeight: isSelected
                                ? FontWeight.w600
                                : FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
          
                  if (selectedTabIndex != controller.selectedTabs.length - 1)
                    SizedBox(width: 4.w),
                ],
              );
            }),
          ),
        ),
      );
    });
  }
}
