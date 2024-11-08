import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/colors.dart';

class TaskTileTrailingIcon extends StatelessWidget {
  const TaskTileTrailingIcon({
    super.key,
    required this.icon,
    this.color = smallIconsColor,
  });
  final IconData icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: 11.w,
      color: color,
    );
  }
}
