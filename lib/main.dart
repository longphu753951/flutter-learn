import 'package:calculator/widgets/Button.dart';
import 'package:calculator/widgets/CalculatorButtons.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'main.g.dart';


@riverpod
String helloWorld(Ref ref) {
  return 'say gexx';
}

// final helloWorldProvider = Provider((ref) => helloWorld(ref));

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
    final String value = ref.watch(helloWorldProvider);

    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children:  [
              CalculatorButtons(),
            ],
          ),
        )
      ),
    );
  }
}