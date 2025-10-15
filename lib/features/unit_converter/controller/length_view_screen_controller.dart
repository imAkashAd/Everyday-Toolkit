import 'package:get/get.dart';

class LengthViewScreenController extends GetxController {
  // Observable variables
  var fromValue = '0'.obs;
  var toValue = '0'.obs;
  var fromUnit = 'Meters'.obs;
  var toUnit = 'Feet'.obs;

  // Available units
  final List<String> units = [
    'Meters',
    'Kilometers',
    'Centimeters',
    'Millimeters',
    'Miles',
    'Yards',
    'Feet',
    'Inches',
  ];

  // Conversion rates to meters (base unit)
  final Map<String, double> toMeters = {
    'Meters': 1.0,
    'Kilometers': 1000.0,
    'Centimeters': 0.01,
    'Millimeters': 0.001,
    'Miles': 1609.34,
    'Yards': 0.9144,
    'Feet': 0.3048,
    'Inches': 0.0254,
  };

  @override
  void onInit() {
    super.onInit();
    fromValue.value = '100';
    convertLength();
  }

  void updateFromValue(String value) {
    fromValue.value = value;
    convertLength();
  }

  void updateFromUnit(String unit) {
    fromUnit.value = unit;
    convertLength();
  }

  void updateToUnit(String unit) {
    toUnit.value = unit;
    convertLength();
  }

  void swapUnits() {
    final tempUnit = fromUnit.value;
    final tempValue = fromValue.value;
    
    fromUnit.value = toUnit.value;
    toUnit.value = tempUnit;
    fromValue.value = toValue.value;
    
    convertLength();
  }

  void convertLength() {
    try {
      double inputValue = double.parse(fromValue.value);
      
      // Convert to meters first
      double valueInMeters = inputValue * toMeters[fromUnit.value]!;
      
      // Convert from meters to target unit
      double result = valueInMeters / toMeters[toUnit.value]!;
      
      // Format the result based on size
      String formattedResult;
      
      if (result.abs() >= 1e10) {
        // For very large numbers, use scientific notation
        formattedResult = result.toStringAsExponential(2);
      } else if (result == result.toInt()) {
        formattedResult = result.toInt().toString();
      } else {
        // Limit decimal places based on the size of the number
        int decimals = result.abs() < 0.01 ? 6 : result.abs() < 1 ? 4 : 2;
        formattedResult = result.toStringAsFixed(decimals);
        // Remove trailing zeros
        formattedResult = formattedResult.replaceAll(RegExp(r'\.?0+$'), '');
      }
      
      toValue.value = formattedResult;
    } catch (e) {
      toValue.value = '0';
    }
  }
}