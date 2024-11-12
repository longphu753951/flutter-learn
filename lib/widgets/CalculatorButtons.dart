import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/CalculatorProvider.dart';
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
    return Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: buttons.map((row) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: row.map((button) {
                  int index = row.indexOf(button);
                  bool isLast = index == row.length - 1;
                  return Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, isLast ? 0 : 8, 0),
                      child: CustomButton(button,
                          key: ValueKey(button),
                          onClicked: () {
                            if (button == 'C') {
                              ref.read(calculatorProvider.notifier).reset();
                            } else if (button == '=') {
                              ref.read(calculatorProvider.notifier).calculate();
                            } else {
                              ref.read(calculatorProvider.notifier).append(button);
                            }
                          },
                          width: button == '=' ? 190 : 90,
                          backgroundColor: Colors.grey[300] ?? Colors.grey,
                          textColor: Colors.black));
                }).toList(),
              ),
            );
          }).toList(),
        ));
  }
}
