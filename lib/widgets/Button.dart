import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomButton extends ConsumerWidget {

  final String text;
  Color backgroundColor;
  Color textColor;
  double width;


  CustomButton(this.text,
      {super.key, this.backgroundColor = Colors.blue, this.textColor = Colors.white, this.width = 90});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: this.width.toDouble(),
      height: 90,
      child: IconButton(
        onPressed: () { print(this.text); },
        icon: Text(text, style: TextStyle(fontSize: 30, color: textColor)),
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(backgroundColor),
        ),
      )
    );
  }
}