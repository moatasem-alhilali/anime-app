import 'package:flutter/material.dart';

class DirectionText extends StatelessWidget {
  DirectionText({super.key, required this.text, required this.textStyle,this.onTap});
  final String text;
  final TextStyle textStyle;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Text(
          text,
          style: textStyle,
          textAlign: TextAlign.start,
          textDirection: TextDirection.rtl,
        ),
      ),
    );
  }
}
