import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pro_minder/core/widgets/custom_inkwell_icon.dart';
import 'package:pro_minder/features/tasks/presentation/views/widgets/add_task/functions.dart';

import '../../../../../../../core/utils/colors.dart';
import '../../../../../../../core/utils/text_styles.dart';

class TimeAndPriorityRow extends StatelessWidget {
  const TimeAndPriorityRow({
    super.key,
    required this.time,
  });

  final String time;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            selectDate(context);
          },
          child: Text(
            time,
            style: style13ExtraBold.copyWith(
              color: secondaryColor,
            ),
          ),
        ),
        CustomInkwellIcon(
          iconSize: 16.w,
          icon: FontAwesomeIcons.solidFlag,
          onPressed: () {
            priorityMenu(
              context,
              relativeRect: RelativeRect.fromDirectional(
                textDirection: TextDirection.ltr,
                start: 20,
                top: MediaQuery.sizeOf(context).height * 0.12,
                end: 4.w,
                bottom: 0,
              ),
            );
          },
        ),
      ],
    );
  }
}
