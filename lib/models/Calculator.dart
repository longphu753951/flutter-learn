class Calculator {
  final bool shouldAppend;
  final String equation;
  final String result;

  Calculator(
      {this.shouldAppend = true, this.equation = "0", this.result = "0"});

  Calculator copy({bool? shouldAppend, String? equation, String? result}) {
    return Calculator(
        shouldAppend: shouldAppend ?? this.shouldAppend,
        equation: equation ?? this.equation,
        result: result ?? this.result
    );
  }
}