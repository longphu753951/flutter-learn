import 'package:flutter/material.dart';

void main() {
  runApp(MyApp(name: "abcd", age: 25));
}

// class MyApp extends StatelessWidget {
//   String name;
//   int age;

//   MyApp({required this.name, required this.age});

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Hello $name'),
//         ),
//         body: Center(
//           child: Text('Age: $age'),
//         ),
//       ),
//     );
//   }
// }

class MyApp extends StatefulWidget {
  String name;
  int age;
  MyApp({ required this.name, required this.age});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hello'),
        ),
        body: Center(
          child: Column (
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Name: ${widget.name}', style: const TextStyle(fontSize: 30)),
              Text('Age: ${widget.age}'),
              Text('Hello World'),
            ]
          )
        ),
      ),
    );
  }
}
