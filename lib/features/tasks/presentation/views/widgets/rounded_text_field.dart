import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/custom_inkwell_icon.dart';

class RoundedTextField extends StatelessWidget {
  const RoundedTextField({
    super.key,
    required this.hintText,
    this.controller,
  });
  final String hintText;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: secondaryColor,
      cursorWidth: 1,
      style: style14Bold.copyWith(
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        border: _buildOutlineInputBorder(),
        enabledBorder: _buildOutlineInputBorder(),
        focusedBorder: _buildOutlineInputBorder(),
        errorBorder: _buildOutlineInputBorder(),
        fillColor: materialsDefaultColor.withOpacity(0.9),
        filled: true,
        hintText: hintText,
        hintStyle: style14Bold.copyWith(
          color: Colors.white30,
        ),
        suffix: Material(
          color: Colors.white38,
          shape: const CircleBorder(),
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: CustomInkwellIcon(
              icon: Icons.close,
              iconSize: 11.w,
              iconColor: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none);
  }
}
