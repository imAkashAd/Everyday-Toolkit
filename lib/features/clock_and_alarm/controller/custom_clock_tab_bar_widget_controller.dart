import 'package:get/get.dart';

class CustomClockTabBarWidgetController extends GetxController {
  var selectedTabIndex = 0.obs;

  var selectedTabs = ['Clock', 'Alarm', 'Timer', 'Stopwatch'].obs;

  void selectTab(int index) {
    selectedTabIndex.value = index;
  }
}