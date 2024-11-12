import 'package:calculator/providers/CalculatorProvider.dart';
import 'package:calculator/widgets/CalculatorButtons.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    final calculatorState = ref.watch(calculatorProvider);
    return MaterialApp(
      home: Scaffold(
          body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Container(
                          alignment: Alignment.bottomRight,
                          margin: const EdgeInsets.only(bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(calculatorState.equation, style: TextStyle(fontSize: 20)),
                              Text(calculatorState.result, style: TextStyle(fontSize: 40)),
                            ],
                          )),
                    ),
                    CalculatorButtons(),
                  ],
                ),
              )
          )
      ),
    );
  }
}
