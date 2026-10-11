import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:islami_app/utils/size_utils.dart';

class SuraContent1 extends StatelessWidget {
  final String content;

  const SuraContent1({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Text(
        content,
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        style: AppStyles.bold20primary,
      ),
    );
  }
}
