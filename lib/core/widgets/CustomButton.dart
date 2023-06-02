import 'package:anime_app/core/resources/app_theme.dart';
import 'package:anime_app/core/resources/size_config.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    this.borderColor,
    this.fillColor,
    this.onTap,
    this.text,
    this.width,
    this.color,
    this.height,
    this.borderRadius,
  });
  String? text;
  Color? borderColor;
  Color? fillColor;
  Color? color;
  void Function()? onTap;
  double? width;
  double? height;
  double? borderRadius;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(8),
        alignment: Alignment.center,
        width: width ?? SizeConfig.blockSizeHorizontal! * 20,
        height: height ?? SizeConfig.blockSizeVertical! * 6,
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: fillColor,
          borderRadius: BorderRadius.circular(borderRadius??20),
          border: Border.all(
            color: borderColor ?? Theme.of(context).primaryColor,
          ),
        ),
        child: Text(
          text ?? 'Click',
          style: titleSmall(context)!.copyWith(
            color: color ?? ColorsManager.primaryColor,
          ),
        ),
      ),
    );
  }
}
