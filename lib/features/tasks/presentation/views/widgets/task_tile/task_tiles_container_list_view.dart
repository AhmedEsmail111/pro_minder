import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pro_minder/core/utils/colors.dart';
import 'package:pro_minder/features/tasks/presentation/views/widgets/task_tile/task_tile.dart';

import '../../../../../../core/entities/task_entity.dart';

class TaskTilesContainerListView extends StatelessWidget {
  const TaskTilesContainerListView({
    super.key,
    required this.tasks,
  });
  final List<TaskEntity> tasks;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: materialsDefaultColor,
      ),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.all(0),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return TaskTile(
            task: tasks[index],
          );
        },
      ),
    );
  }
}
