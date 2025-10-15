import 'package:api_test/core/common/widgets/custom_app_bar.dart';
import 'package:api_test/features/calculator/controller/calculator_controller.dart';
import 'package:api_test/features/calculator/widget/calc_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorScreen extends StatelessWidget {
  CalculatorScreen({super.key});

  // Access the controller initialized elsewhere (e.g., in main or on the calling screen)
  final CalculatorController controller = Get.put(CalculatorController());

  @override
  Widget build(BuildContext context) {
    // 5-column grid layout for scientific functions
    List<List<String>> buttonLayout = [
      ['sin', 'cos', 'tan', 'log', 'C'],
      ['(', ')', '^', 'sqrt', 'DEL'],
      ['7', '8', '9', '/', 'ln'],
      ['4', '5', '6', 'x', 'π'],
      ['1', '2', '3', '-', '+'],
      ['0', '.', '=', ','], 
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        backgroundColor: Color(0xFF2EB5A7),
        homePage: false,
        title: 'Calculator',
      ),

      body: Column(
        children: <Widget>[
          // 1. Display Area - Uses Obx for reactive updates
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Reactive input expression text
                  Obx(() => Text(
                    controller.inputExpression.value,
                    style: const TextStyle(fontSize: 24.0, color: Colors.grey),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )),
                  const SizedBox(height: 10),
                  // Reactive output result text
                  Obx(() => Text(
                    controller.outputResult.value,
                    style: const TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )),
                ],
              ),
            ),
          ),

          const Divider(height: 1, color: Colors.grey),

          // 2. Keypad Area
          Expanded(
            flex: 4,
            child: GridView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: buttonLayout.expand((list) => list).length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                childAspectRatio: 1.2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (BuildContext context, int index) {
                final flatButtons = buttonLayout.expand((list) => list).toList();
                String buttonText = flatButtons[index];

                Color buttonColor;
                if (buttonText == 'C' || buttonText == 'DEL') {
                  buttonColor = Colors.red.shade400;
                } else if (['/', 'x', '-', '+', '='].contains(buttonText)) {
                  buttonColor = Colors.teal.shade700;
                } else if (['sin', 'cos', 'tan', 'log', 'ln', 'sqrt', 'pow', '(', ')', '^', 'π'].contains(buttonText)) {
                  buttonColor = Colors.teal.shade300;
                } else {
                  buttonColor = const Color(0xFF424242);
                }
                
                if (buttonText == ',') return Container();

                return CalcButton(
                  text: buttonText,
                  color: buttonColor,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}