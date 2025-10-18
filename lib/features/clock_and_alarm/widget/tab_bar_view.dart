import 'package:api_test/features/clock_and_alarm/controller/custom_clock_tab_bar_widget_controller.dart';
import 'package:api_test/features/clock_and_alarm/widget/alarm_view.dart';
import 'package:api_test/features/clock_and_alarm/widget/clock_view.dart';
import 'package:api_test/features/clock_and_alarm/widget/stopwatch_view.dart';
import 'package:api_test/features/clock_and_alarm/widget/timer_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClockTabBarView extends StatelessWidget {
  const ClockTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CustomClockTabBarWidgetController());

    final List<Widget> tabViews = [
      ClockView(),
      AlarmView(),
      TimerView(),
      StopwatchView(),
    ];

    return Obx(() {
      return tabViews[controller.selectedTabIndex.value];
    });
  }
}