import 'package:get/get.dart';

class WeightViewScreenController extends GetxController {
  // Observable variables
  var fromValue = '0'.obs;
  var toValue = '0'.obs;
  var fromUnit = 'Kilograms'.obs;
  var toUnit = 'Grams'.obs;

  // Available units
  final List<String> units = [
    'Kilograms',
    'Grams',
    'Milligrams',
    'Pounds',
    'Ounces',
    'Tons',
  ];

  // Conversion rates to kilograms (base unit)
  final Map<String, double> toKilograms = {
    'Kilograms': 1.0,
    'Grams': 0.001,
    'Milligrams': 0.000001,
    'Pounds': 0.453592,
    'Ounces': 0.0283495,
    'Tons': 1000.0,
  };

  @override
  void onInit() {
    super.onInit();
    fromValue.value = '';
    convertWeight();
  }

  void updateFromValue(String value) {
    fromValue.value = value;
    convertWeight();
  }

  void updateFromUnit(String unit) {
    fromUnit.value = unit;
    convertWeight();
  }

  void updateToUnit(String unit) {
    toUnit.value = unit;
    convertWeight();
  }

  void swapUnits() {
    final tempUnit = fromUnit.value;
    
    fromUnit.value = toUnit.value;
    toUnit.value = tempUnit;
    fromValue.value = toValue.value;
    
    convertWeight();
  }

  void convertWeight() {
    try {
      double inputValue = double.parse(fromValue.value);
      
      // Convert to kilograms first
      double valueInKilograms = inputValue * toKilograms[fromUnit.value]!;
      
      // Convert from kilograms to target unit
      double result = valueInKilograms / toKilograms[toUnit.value]!;
      
      // Format the result
      String formattedResult;
      
      if (result.abs() >= 1e10) {
        formattedResult = result.toStringAsExponential(2);
      } else if (result == result.toInt()) {
        formattedResult = result.toInt().toString();
      } else {
        int decimals = result.abs() < 0.01 ? 6 : result.abs() < 1 ? 4 : 2;
        formattedResult = result.toStringAsFixed(decimals);
        formattedResult = formattedResult.replaceAll(RegExp(r'\.?0+$'), '');
      }
      
      toValue.value = formattedResult;
    } catch (e) {
      toValue.value = '0';
    }
  }
}