import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/utils/colors.dart';

class SubmitTaskButton extends StatelessWidget {
  const SubmitTaskButton({
    super.key,
    this.onTap,
  });

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(16),
      child: Material(
        color: secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Icon(
            Icons.send,
            size: 22.w,
          ),
        ),
      ),
    );
  }
}
