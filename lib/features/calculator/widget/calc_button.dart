import 'package:api_test/features/calculator/controller/calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalcButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  // Get the controller instance for easy access
  final CalculatorController controller = Get.put(CalculatorController()); 

   CalcButton({
    super.key,
    required this.text,
    this.color = const Color(0xFF424242),
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        // Call the controller's logic directly
        onPressed: () => controller.onButtonPress(text),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          padding: EdgeInsets.zero,
          minimumSize: const Size(40, 40),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: text.length > 3 ? 18 : 28,
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
