class Calculator {
  final bool shouldAppend;
  final String equation;
  final String result;
  final String memory;

  Calculator(
      {this.shouldAppend = true, this.equation = "0", this.result = "0", this.memory = "0"});

  Calculator copy({bool? shouldAppend, String? equation, String? result, String? memory}) {
    return Calculator(
        shouldAppend: shouldAppend ?? this.shouldAppend,
        equation: equation ?? this.equation,
        result: result ?? this.result,
        memory: memory?? this.memory,
    );
  }
}