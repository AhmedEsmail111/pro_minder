import 'package:flutter/material.dart';
import 'package:pro_minder/core/utils/colors.dart';

class AddTaskTextField extends StatelessWidget {
  const AddTaskTextField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.hintStyle,
    required this.textStyle,
    this.autoFocus = false,
    this.textInputAction,
    this.focusNode,
    this.minLines = 1,
    this.maxLines = 1,
    this.onSaved,
    this.onValidate,
  });
  final String hintText;
  final TextEditingController controller;
  final TextStyle hintStyle;
  final TextStyle textStyle;
  final bool autoFocus;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final int minLines;
  final int maxLines;
  final void Function(String?)? onSaved;
  final String? Function(String?)? onValidate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      style: textStyle,
      autofocus: autoFocus,
      maxLines: 50,
      minLines: 1,
      textInputAction: textInputAction,
      onSaved: onSaved,
      validator: onValidate,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle,
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
      ),
      cursorColor: secondaryColor,
      cursorWidth: 1,
    );
  }
}
