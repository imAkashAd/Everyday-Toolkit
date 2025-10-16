import 'package:api_test/features/calculator/screen/calculator_screen.dart';
import 'package:api_test/features/clock_and_alarm/screen/clock_and_alarm_screen.dart';
import 'package:api_test/features/home/screen/home_screen.dart';
import 'package:api_test/features/notes/screen/notes_and_lists_screen.dart';
import 'package:api_test/features/unit_converter/screen/unit_converter_screen.dart';
import 'package:get/get.dart';

class AppRoute {
  static const String homeScreen = '/homeScreen';
  static const String calculatorScreen = '/calculatorScreen';
  static const String unitConverterScreen = '/unitConverterScreen';
  static const String clockAndAlarmScreen = '/clockAndAlarmScreen';
  static const String notesAndListsScreen = '/notesAndListsScreen';

  static String getHomeScreen() => homeScreen;
  static String getCalculatorScreen() => calculatorScreen;
  static String getUnitConverterScreen() => unitConverterScreen;
  static String getClockAndAlarmScreen() => clockAndAlarmScreen;
  static String getNotesAndListsScreen() => notesAndListsScreen;

  static List<GetPage> routes = [
    GetPage(name: homeScreen, page: ()=> HomeScreen()),
    GetPage(name: calculatorScreen, page: ()=> CalculatorScreen()),
    GetPage(name: unitConverterScreen, page: ()=> UnitConverterScreen()),
    GetPage(name: clockAndAlarmScreen, page: ()=> ClockAndAlarmScreen()),
    GetPage(name: notesAndListsScreen, page: ()=> NotesAndListsScreen()),
  ];
}