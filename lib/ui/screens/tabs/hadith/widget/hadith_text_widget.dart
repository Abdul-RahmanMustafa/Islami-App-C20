import 'package:flutter/material.dart';

class HadithTextWidget extends StatelessWidget {
  final String text;
  final TextStyle textStyle;

  const HadithTextWidget({
    super.key,
    required this.text,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text, textAlign: TextAlign.center, style: textStyle);
  }
}
