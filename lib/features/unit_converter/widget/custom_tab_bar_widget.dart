import 'package:api_test/core/common/styles/global_text_style.dart';
import 'package:api_test/features/unit_converter/controller/custom_tab_bar_widget_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomTabBarWidget extends StatelessWidget {
  const CustomTabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CustomTabBarWidgetController());

    return Obx(() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          // padding: EdgeInsets.all(4.w),
          decoration: BoxDecoration(
            color: Color(0xFFF6B187),
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
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
                      decoration: BoxDecoration(
                        color: isSelected
                            ?  Colors.transparent
                            :  Colors.white,
                          // borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: isSelected
                              ? Colors.transparent
                              : Colors.transparent,
                        ),
                      ),
                      padding: EdgeInsets.all(16.w),
                      child: Center(
                        child: Text(
                          controller.selectedTabs[selectedTabIndex],
                          style: getTextStyle(
                            fontSize: 13.sp,
                            color: isSelected
                                ? Colors.white
                                : const Color(0xFF1F2937),
                            fontWeight: isSelected
                                ? FontWeight.w600
                                : FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
          
                  if (selectedTabIndex != controller.selectedTabs.length - 1)
                    SizedBox(),
                ],
              );
            }),
          ),
        ),
      );
    });
  }
}
