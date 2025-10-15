import 'package:api_test/features/calculator/screen/calculator_screen.dart';
import 'package:api_test/features/home/screen/home_screen.dart';
import 'package:api_test/features/unit_converter/screen/unit_converter_screen.dart';
import 'package:get/get.dart';

class AppRoute {
  static const String homeScreen = '/homeScreen';
  static const String calculatorScreen = '/calculatorScreen';
  static const String unitConverterScreen = '/unitConverterScreen';

  static String getHomeScreen() => homeScreen;
  static String getCalculatorScreen() => calculatorScreen;
  static String getUnitConverterScreen() => unitConverterScreen;

  static List<GetPage> routes = [
    GetPage(name: homeScreen, page: ()=> HomeScreen()),
    GetPage(name: calculatorScreen, page: ()=> CalculatorScreen()),
    GetPage(name: unitConverterScreen, page: ()=> UnitConverterScreen()),
  ];
}