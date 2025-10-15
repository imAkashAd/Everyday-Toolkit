import 'package:api_test/features/unit_converter/controller/custom_tab_bar_widget_controller.dart';
import 'package:api_test/features/unit_converter/screen/length_view_screen.dart';
import 'package:api_test/features/unit_converter/screen/temperature_view_screen.dart';
import 'package:api_test/features/unit_converter/screen/weight_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTabBarView extends StatelessWidget {
  const CustomTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CustomTabBarWidgetController());

    final List<Widget> tabViews = [
      LengthViewScreen(),
      WeightViewScreen(),
      TemperatureViewScreen(),
    ];

    return Obx(() {
      return tabViews[controller.selectedTabIndex.value];
    });
  }
}