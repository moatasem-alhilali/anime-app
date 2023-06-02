import 'package:anime_app/core/resources/app_theme.dart';
import 'package:anime_app/core/widgets/DirectionText.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar({super.key, this.text});
  String? text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_new_outlined,
              size: 30,
            ),
          ),
        ),
        const Spacer(),
        DirectionText(
          text: text ?? 'قاتل الشياطين',
          textStyle: const TextStyle(
            fontFamily: 'ios-1',
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
