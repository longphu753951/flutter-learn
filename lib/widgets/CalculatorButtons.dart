import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';

import 'Button.dart';

class CalculatorButtons extends ConsumerWidget {
  final buttons = [
    ['C', '±', '%', '÷'],
    ['7', '8', '9', '×'],
    ['4', '5', '6', '-'],
    ['1', '2', '3', '+'],
    ['0', '.', '='],
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: buttons.map((row) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: Row(
            children: row.map((button) {
              int index = row.indexOf(button);
              bool isLast = index == row.length - 1;
              return Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, isLast ? 0 : 8, 0),
                  child: CustomButton(button,
                      key: ValueKey(button),
                      width: button == '=' ? 190 : 90,
                      backgroundColor: Colors.grey[300] ?? Colors.grey,
                      textColor: Colors.black));
            }).toList(),
          ),
        );
      }).toList(),
    );
  }
}
