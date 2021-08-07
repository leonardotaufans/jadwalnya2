import 'package:flutter/material.dart';

class YouTextBox extends StatelessWidget {
  /// This Widget creates a background color below the text, creating a Material You vibes.
  /// This Widget will use accent color by default unless overriden. This Widget will also use
  /// your own BorderRadius. Default would be a circular 20.
  const YouTextBox({Key? key, required this.text, this.borderRadius, this.color})
      : super(key: key);
  final Text text;
  final BorderRadius? borderRadius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
        decoration: BoxDecoration(
            borderRadius: borderRadius ?? BorderRadius.circular(20),
            color: color ?? Theme.of(context).primaryColorLight),
        child: text);
  }
}
