import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/CalculatorProvider.dart';

class CustomButton extends ConsumerWidget {

  final String text;
  final VoidCallback onClicked;
  Color backgroundColor;
  Color textColor;
  double width;


  CustomButton(this.text,
      {super.key, required this.onClicked, this.backgroundColor = Colors.blue, this.textColor = Colors.white, this.width = 90});



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calculatorState = ref.watch(calculatorProvider);

    String handleText() {
      if (this.text == "AC") {
        print((calculatorState.equation != "0" && calculatorState.equation != "") || calculatorState.result != "0");
        if ((calculatorState.equation != "0" && calculatorState.equation != "") || calculatorState.result != "0") {
          return "⌫";
        }
      }
      return this.text;
    }

    return SizedBox(
      width: this.width.toDouble(),
      height: 90,
      child: IconButton(
        onPressed: () { onClicked(); },
        icon: Text(handleText(), style: TextStyle(fontSize: 30, color: textColor)),
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(backgroundColor),
        ),
      )
    );
  }
}