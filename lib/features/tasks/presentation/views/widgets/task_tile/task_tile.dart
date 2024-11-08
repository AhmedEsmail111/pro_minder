import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pro_minder/core/utils/my_consonants.dart';
import 'package:pro_minder/features/tasks/presentation/views/widgets/task_tile/task_tiles_container_list_view.dart';

import '/core/entities/task_entity.dart';
import '/core/utils/text_styles.dart';
import 'task_chekbox.dart';
import 'task_tile_trailing.dart';

class TaskTile extends StatefulWidget {
  const TaskTile({super.key, required this.task});
  final TaskEntity task;

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isContainerExtended = false;
  bool isSubShown = false;
  final subListVerticalPadding = 8.0.h;
  @override
  Widget build(BuildContext context) {
    final double height = isContainerExtended
        ? ((widget.task.subTasks.length * defaultListTileHeight) +
            defaultListTileHeight +
            subListVerticalPadding)
        : defaultListTileHeight;
    // TODO: this needs to be configured more when we add the reminder and other updates
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      height: height,
      child: Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 0),
            dense: true,
            leading: const TaskCheckBox(
              checkBoxColor: Colors.red,
            ),
            title: Text(
              widget.task.title,
              style: style18ExtraBold,
            ),
            trailing: SizedBox(
              width: 100.w,
              child: TaskTileTrailing(
                task: widget.task,
                isSubShown: isContainerExtended,
                toggle: toggle,
              ),
            ),
          ),
          if (widget.task.subTasks.isNotEmpty && isSubShown)
            Padding(
              padding: EdgeInsets.only(
                left: 20.w,
              ),
              child: TaskTilesContainerListView(
                tasks: widget.task.subTasks,
              ),
            )
        ],
      ),
    );
  }

  void toggle() {
    if (isSubShown) {
      isSubShown = !isSubShown;
      setState(() {});

      Future.delayed(const Duration(milliseconds: 10), () {
        isContainerExtended = !isContainerExtended;
        setState(() {});
      });
      return;
    }
    isContainerExtended = !isContainerExtended;

    setState(() {});
    Future.delayed(const Duration(milliseconds: 260), () {
      isSubShown = !isSubShown;
      setState(() {});
    });
  }
}
