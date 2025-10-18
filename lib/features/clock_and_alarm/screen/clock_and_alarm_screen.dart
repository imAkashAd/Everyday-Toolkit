// ignore_for_file: use_build_context_synchronously

import 'package:api_test/core/common/widgets/custom_app_bar.dart';
import 'package:api_test/features/clock_and_alarm/controller/clock_and_alarm_screen_controller.dart';
import 'package:api_test/features/clock_and_alarm/controller/custom_clock_tab_bar_widget_controller.dart';
import 'package:api_test/features/clock_and_alarm/widget/custom_clock_tab_bar_widget.dart';
import 'package:api_test/features/clock_and_alarm/widget/tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ClockAndAlarmScreen extends StatelessWidget {
  const ClockAndAlarmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize both controllers here
    Get.put(ClockAndAlarmScreenController());
    Get.put(CustomClockTabBarWidgetController());

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: CustomAppBar(title: ' Clock & Alarm', homePage: false, backgroundColor: Color(0xFF9DD493),),
        body: Column(
          children: [
            SizedBox(height: 20.h,),
            CustomClockTabBarWidget(),
            Expanded(child: ClockTabBarView()),
          ],
        ),
      ),
    );
  }
}
