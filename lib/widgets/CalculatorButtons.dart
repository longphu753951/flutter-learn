import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/CalculatorProvider.dart';
import 'Button.dart';

class CalculatorButtons extends ConsumerWidget {
  final buttons = [
    ['MC', 'MR', 'M-', 'M+'],
    ['AC', '±', '%', '÷'],
    ['7', '8', '9', '×'],
    ['4', '5', '6', '-'],
    ['1', '2', '3', '+'],
    ['0', '.', '='],
  ];



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calculatorState = ref.watch(calculatorProvider);

    Color backgroundColor(button) {
      if (button == 'C' || button == '±' || button == '%' || button == '÷' || button == '×' || button == '-' || button == '+' || button == '=') {
        return Colors.orange[300] ?? Colors.grey;
      }
      else if (button == 'MC' || button == 'MR' || button == 'M-' || button == 'M+') {
        if(button == 'MR') {
          if(calculatorState.memory == "0" || calculatorState.memory == "") {
            return Colors.grey[300] ?? Colors.grey;
          }
        }
        return Colors.grey[300] ?? Colors.grey;
      }
      return Colors.grey[400] ?? Colors.orange;
    }

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
                            if (button == 'AC') {
                              if((calculatorState.equation == "0" && calculatorState.equation == "") || calculatorState.shouldAppend == false) {
                                ref.read(calculatorProvider.notifier).reset();
                                return;
                              }
                              ref.read(calculatorProvider.notifier).delete();
                            }
                            else if (button == '=') {
                              ref.read(calculatorProvider.notifier).calculate();
                            }
                            else if (button == "MC") {
                              ref.read(calculatorProvider.notifier).memoryClear();
                            }
                            else if (button == "MR") {
                              ref.read(calculatorProvider.notifier).memoryRecall();
                            }
                            else if (button == "M-") {
                              ref.read(calculatorProvider.notifier).memorySubtract();
                            }
                            else if (button == "M+") {
                              ref.read(calculatorProvider.notifier).memoryAdd();
                            }
                            else {
                              print(button);
                              ref.read(calculatorProvider.notifier).append(button);
                            }

                          },
                          width: button == '=' ? 190 : 90,
                          backgroundColor: backgroundColor(button),
                          textColor: Colors.black));
                }).toList(),
              ),
            );
          }).toList(),
        ));
  }
}
