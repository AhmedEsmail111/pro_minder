import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pro_minder/core/utils/colors.dart';
import 'package:pro_minder/core/utils/text_styles.dart';
import 'package:pro_minder/features/tasks/presentation/views/widgets/task_tile/task_tile.dart';

import '../../../../../../../core/entities/task_entity.dart';
import '../add_task_sheet/add_task_bottom_sheet.dart';
import 'add_tile.dart';

class SubTasksColumnCard extends StatelessWidget {
  const SubTasksColumnCard({super.key, required this.subTasks});
  final List<TaskEntity> subTasks;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      color: subTasksMaterialsColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 8.h),
        child: Column(
          children: [
            ...List.generate(
              subTasks.length,
              (index) => TaskTile(
                task: subTasks[index],
              ),
            ),
            AddTile(
              onTap: () {
                _showAddSubTaskBottomSheet(context);
              },
              actionText: 'Add Subtask',
              style: style15Regular,
            )
          ],
        ),
      ),
    );
  }

  Future<void> _showAddSubTaskBottomSheet(BuildContext context) async {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: bottomSheetBackground,
      shape: _bottomSheetShape(),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: const AddTaskBottomSheet(
          hasTaskCatButtonMenu: false,
        ),
      ),
    );
  }

  RoundedRectangleBorder _bottomSheetShape() {
    return const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(14),
        topRight: Radius.circular(14),
      ),
    );
  }
}
