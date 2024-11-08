import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/utils/colors.dart';
import '../../../../../../../core/utils/text_styles.dart';

class TaskCatMenuItem extends StatelessWidget {
  const TaskCatMenuItem({
    super.key,
    required this.iconData,
    required this.taskCat,
  });
  final IconData? iconData;
  final String taskCat;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 2.w),
      child: Row(
        children: [
          Icon(
            iconData,
            color: smallIconsColor,
          ),
          SizedBox(
            width: 16.w,
          ),
          Text(
            taskCat,
            style: style13,
          ),
        ],
      ),
    );
  }
}
