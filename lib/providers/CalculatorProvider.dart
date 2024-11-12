import 'package:hooks_riverpod/hooks_riverpod.dart';

final displayProvider = StateProvider<String>((ref) => '0');

final calculatorProvider = StateNotifierProvider<CalculatorNotifier, String>((ref) {
  return CalculatorNotifier(ref);
});

class CalculatorNotifier extends StateNotifier<String> {
  final Ref ref;

  CalculatorNotifier(this.ref) : super('0');

  void input(String text) {
    // Implement calculator logic here
    // For simplicity, this example just appends the input
    if (text == '=') {
      // Evaluate the expression
      try {
        final result = _evaluate(state);
        state = result.toString();
      } catch (e) {
        state = 'Error';
      }
    } else if (text == 'C') {
      state = '0';
    } else {
      if (state == '0') {
        state = text;
      } else {
        state += text;
      }
    }
  }

  double _evaluate(String expression) {
    // Simple evaluation logic (not safe for production)
    // Consider using a proper expression evaluation library
    return double.parse(expression);
  }
}