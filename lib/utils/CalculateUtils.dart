class CalculateUtils {
  double calculateEquation(String equation) {
    List<String> tokens = RegExp(r'(?<=\()\-?\d+(\.\d+)?|(?<!\d)\d+(\.\d+)?').allMatches(equation)
        .map((match) => match.group(0)!)
        .toList();
    List<String> operators = RegExp(r'(?<=[\d\)])[-×÷+*/]').allMatches(equation)
        .map((match) => match.group(0)!)
        .toList();

    // tính nhân chia trước
    for (int i = 0; i < operators.length; ) {
      if (operators[i] == '×' || operators[i] == '÷') {
        double a = double.parse(tokens[i]);
        double b = double.parse(tokens[i + 1]);
        double res = operators[i] == '×' ? a * b : a / b;

        tokens[i] = res.toString();
        tokens.removeAt(i + 1);
        operators.removeAt(i);
      } else {
        i++;
      }
    }

    // cộng trừ sau
    double result = double.parse(tokens[0]);
    for (int i = 0; i < operators.length; i++) {
      String operator = operators[i];
      double value = double.parse(tokens[i + 1]);
      if (operator == '+') {
        result += value;
      } else if (operator == '-') {
        result -= value;
      }
    }

    return result;
  }
}