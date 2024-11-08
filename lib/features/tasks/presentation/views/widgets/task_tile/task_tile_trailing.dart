import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pro_minder/core/utils/helper_functions.dart';

import '../../../../../../core/entities/task_entity.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/text_styles.dart';
import 'task_tile_trailing_icon.dart';

class TaskTileTrailing extends StatefulWidget {
  const TaskTileTrailing({
    super.key,
    required this.task,
    required this.isSubShown,
    required this.toggle,
  });
  final TaskEntity task;
  final bool isSubShown;
  final void Function() toggle;

  @override
  State<TaskTileTrailing> createState() => _TaskTileTrailingState();
}

class _TaskTileTrailingState extends State<TaskTileTrailing> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            if (widget.task.date != null)
              Text(
                formattedTime(widget.task.date!),
                style: style12.copyWith(color: secondaryColor),
              ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                if (widget.task.subTasks.isNotEmpty)
                  const Row(
                    children: [
                      TaskTileTrailingIcon(
                        icon: FontAwesomeIcons.rectangleList,
                      ),
                      SizedBox(
                        width: 6,
                      )
                    ],
                  ),
                if (widget.task.description != null)
                  const Row(
                    children: [
                      RotatedBox(
                        quarterTurns: -2,
                        child: TaskTileTrailingIcon(
                          icon: FontAwesomeIcons.solidFileLines,
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      )
                    ],
                  ),
                if (widget.task.date != null)
                  const Row(
                    children: [
                      TaskTileTrailingIcon(
                        icon: FontAwesomeIcons.solidClock,
                      ),
                      SizedBox(
                        width: 6,
                      )
                    ],
                  ),
              ],
            ),
          ],
        ),
        if (widget.task.subTasks.isNotEmpty)
          IconButton(
            icon: Icon(
              widget.isSubShown
                  ? FontAwesomeIcons.angleDown
                  : FontAwesomeIcons.angleLeft,
              color: smallIconsColor,
            ),
            iconSize: 16.w,
            onPressed: () {
              widget.toggle();
            },
          ),
      ],
    );
  }
}
