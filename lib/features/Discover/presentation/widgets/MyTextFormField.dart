import 'package:anime_app/core/export.dart';
import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  MyTextFormField({
    this.controller,
    this.onChanged,
    this.onFieldSubmitted,
    this.onSaved,
    this.onTapPre,
    this.onTapSuf,
    this.onTap,
    Key? key,
    this.readOnly,
    this.suffixIcon,
  }) : super(key: key);
  void Function(String)? onChanged;
  void Function(String?)? onSaved;
  TextEditingController? controller;
  void Function(String)? onFieldSubmitted;
  void Function()? onTapPre;
  void Function()? onTapSuf;
  void Function()? onTap;
  Widget? suffixIcon;
  bool? readOnly;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.start,
      maxLines: null,
      onChanged: onChanged,
      readOnly: readOnly ?? false,
      onSaved: onSaved,
      controller: controller,
      onFieldSubmitted: onFieldSubmitted,
      textDirection: TextDirection.ltr,
      scrollPhysics: const BouncingScrollPhysics(),
      keyboardType: TextInputType.text,
      onTap: onTap,
      decoration: InputDecoration(
        fillColor: ColorsManager.clr,
        filled: true,
        hintText: 'بحث',
        hintStyle: const TextStyle(
          fontFamily: 'ios-1',
        ),
        suffixIcon: InkWell(
          onTap: onTapPre,
          child: const Icon(
            Icons.search,
            size: 35,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: ColorsManager.clr),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: ColorsManager.clr),
        ),
      ),
    );
  }
}
