// ignore_for_file: deprecated_member_use

import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorController extends GetxController {
  
  RxString inputExpression = ''.obs;
  RxString outputResult = '0'.obs;

  void onButtonPress(String buttonText) {
    if (buttonText == 'C') {
      inputExpression.value = '';
      outputResult.value = '0';
    } else if (buttonText == 'DEL') {
      if (inputExpression.isNotEmpty) {
        inputExpression.value = inputExpression.value.substring(0, inputExpression.value.length - 1);
      }
    } else if (buttonText == '=') {
      _evaluateExpression();
    } else if (buttonText == 'x') {
      inputExpression.value += '*';
    } else if (['sin', 'cos', 'tan', 'log', 'ln', 'sqrt', 'pow'].contains(buttonText)) {
      inputExpression.value += '$buttonText(';
    } else if (buttonText == 'π') {
      inputExpression.value += '3.14159';
    } else {
      inputExpression.value += buttonText;
    }
  }

  void _evaluateExpression() {
    String finalExpression = inputExpression.value;
    
    try {
      Parser p = Parser();
      Expression exp = p.parse(finalExpression.replaceAll('^', 'pow'));

      ContextModel cm = ContextModel();
      double result = exp.evaluate(EvaluationType.REAL, cm);
      
      String formattedResult = result.toStringAsFixed(result.truncateToDouble() == result ? 0 : 5);
      if (formattedResult.contains('.')) {
        formattedResult = formattedResult.replaceAll(RegExp(r"([.]*0+)$"), '');
      }
      outputResult.value = formattedResult;
      inputExpression.value = '';

    } catch (e) {
      outputResult.value = 'Error';
      inputExpression.value = '';
    }
  }
}