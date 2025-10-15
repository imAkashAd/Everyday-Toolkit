import 'package:get/get.dart';

class TemperatureViewScreenController extends GetxController {
  // Observable variables
  var fromValue = '0'.obs;
  var toValue = '0'.obs;
  var fromUnit = 'Celsius'.obs;
  var toUnit = 'Fahrenheit'.obs;

  // Available units
  final List<String> units = ['Celsius', 'Fahrenheit', 'Kelvin'];

  @override
  void onInit() {
    super.onInit();
    fromValue.value = '';
    convertTemperature();
  }

  void updateFromValue(String value) {
    fromValue.value = value;
    convertTemperature();
  }

  void updateFromUnit(String unit) {
    fromUnit.value = unit;
    convertTemperature();
  }

  void updateToUnit(String unit) {
    toUnit.value = unit;
    convertTemperature();
  }

  void swapUnits() {
    final tempUnit = fromUnit.value;

    fromUnit.value = toUnit.value;
    toUnit.value = tempUnit;
    fromValue.value = toValue.value;

    convertTemperature();
  }

  void convertTemperature() {
    try {
      double inputValue = double.parse(fromValue.value);
      double result;

      // Convert from source unit to Celsius first
      double celsius;
      switch (fromUnit.value) {
        case 'Celsius':
          celsius = inputValue;
          break;
        case 'Fahrenheit':
          celsius = (inputValue - 32) * 5 / 9;
          break;
        case 'Kelvin':
          celsius = inputValue - 273.15;
          break;
        default:
          celsius = inputValue;
      }

      // Convert from Celsius to target unit
      switch (toUnit.value) {
        case 'Celsius':
          result = celsius;
          break;
        case 'Fahrenheit':
          result = (celsius * 9 / 5) + 32;
          break;
        case 'Kelvin':
          result = celsius + 273.15;
          break;
        default:
          result = celsius;
      }

      // Format the result
      String formattedResult;

      if (result.abs() >= 1e10) {
        formattedResult = result.toStringAsExponential(2);
      } else if (result == result.toInt()) {
        formattedResult = result.toInt().toString();
      } else {
        int decimals = result.abs() < 0.01
            ? 6
            : result.abs() < 1
            ? 4
            : 2;
        formattedResult = result.toStringAsFixed(decimals);
        formattedResult = formattedResult.replaceAll(RegExp(r'\.?0+$'), '');
      }

      toValue.value = formattedResult;
    } catch (e) {
      toValue.value = '0';
    }
  }
}
