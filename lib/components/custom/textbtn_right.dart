import 'package:flutter/material.dart';

class TextButtonRight extends StatelessWidget {
  const TextButtonRight({Key? key, required this.onPressed, required this.label, required this.icon}) : super(key: key);
  final Function onPressed;
  final Text label;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [label, icon],
        ));
  }
}
