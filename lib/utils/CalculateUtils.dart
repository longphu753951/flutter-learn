class CalculateUtils {
  double calculateEquation(String equation) {
    List<String> tokens = equation.split(RegExp(r'(?<!\d)-|\d+(\.\d+)?')).where((token) => token.isNotEmpty).toList();
    print(tokens);
    List<String> operators = equation.split(RegExp(r'(?<=\d)(?=[-+×/])')).where((op) => op.isNotEmpty && !RegExp(r'\d').hasMatch(op)).toList();
    double result = double.parse(tokens[0]);
    print(operators.toList());
    for (int i = 0; i < operators.length; i++) {
      String operator = operators[i];
      double value = double.parse(tokens[i + 1]);
      if (operator == '+') {
        result += value;
      } else if (operator == '-') {
        result -= value;
      } else if (operator == '×') {
        result *= value;
      } else if (operator == '/') {
        result /= value;
      }
    }

    return result;
  }
}