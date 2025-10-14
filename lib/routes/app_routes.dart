import 'package:api_test/features/calculator/calculator_screen.dart';
import 'package:api_test/features/home/screen/home_screen.dart';
import 'package:get/get.dart';

class AppRoute {
  static const String homeScreen = '/homeScreen';
  static const String calculatorScreen = '/calculatorScreen';

  static String getHomeScreen() => homeScreen;
  static String getCalculatorScreen() => calculatorScreen;

  static List<GetPage> routes = [
    GetPage(name: homeScreen, page: ()=> HomeScreen()),
    GetPage(name: calculatorScreen, page: ()=> CalculatorScreen()),
  ];
}