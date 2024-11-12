import 'package:calculator/models/Calculator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../utils/CalculateUtils.dart';

final displayProvider = StateProvider<String>((ref) => '0');

final calculatorProvider = StateNotifierProvider<CalculatorNotifier, Calculator>((ref) {
  return CalculatorNotifier();
});

class CalculatorNotifier extends StateNotifier<Calculator> {
  CalculatorNotifier(): super(Calculator());

  void delete() {
    final equatition = state.equation;

    if (equatition.isNotEmpty) {
      final newEquatiton = equatition.substring(0, equatition.length -1);
      if (newEquatiton.isEmpty) {
        state = state.copy(equation: '0', result: '0');
      } else {
        state = state.copy(equation: newEquatiton);
      }
    }
  }

  void reset() {
    state = state.copy(equation: '0', result: '0');
  }

  void append(String value) {
    final equation = state.equation;
    if (value == "±") {
      if (equation.isNotEmpty && equation != "0") {
        final lastChar = equation[equation.length - 1];
        if (RegExp(r'\d').hasMatch(lastChar)) {
          final lastNumberMatch = RegExp(r'(\(?-?\d+(\.\d+)?\)?)$').firstMatch(equation);
          if (lastNumberMatch != null) {
            final lastNumber = lastNumberMatch.group(0)!;
            final newNumber = lastNumber.startsWith('-')
                ? lastNumber.replaceAll(RegExp(r'[\(\)-]'), '')
                : '(-$lastNumber)';
            final newEquation = equation.substring(0, lastNumberMatch.start) + newNumber;
            state = state.copy(equation: newEquation);
          }
        }
      }
    } else {
      if (equation == "0" && RegExp(r'\d').hasMatch(value)) {
        state = state.copy(equation: value);
      } else {
        state = state.copy(equation: equation + value);
      }    }
  }

  void calculate() {
    final equation = state.equation;
    final result = state.result;

    if (equation.isNotEmpty) {
      final calculateResult = CalculateUtils().calculateEquation(equation);
      state = state.copy(result: calculateResult.toString());
    }
  }
}