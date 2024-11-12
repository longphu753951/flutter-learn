import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomButton extends StatelessWidget {

  final String text;
  final VoidCallback onClicked;
  Color backgroundColor;
  Color textColor;
  double width;


  CustomButton(this.text,
      {super.key, required this.onClicked, this.backgroundColor = Colors.blue, this.textColor = Colors.white, this.width = 90});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: this.width.toDouble(),
      height: 90,
      child: IconButton(
        onPressed: () { onClicked(); },
        icon: Text(text, style: TextStyle(fontSize: 30, color: textColor)),
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(backgroundColor),
        ),
      )
    );
  }
}