import 'package:flutter/material.dart';
import 'package:pro_minder/core/entities/task_entity.dart';

import 'widgets/add_task/add_task_view/app_bar_title_select_taskcat.dart';
import 'widgets/add_task/add_task_view/more_options_bottom_sheet..dart';
import 'widgets/add_task_view_body.dart';
import 'widgets/more_options_appbar_icon.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key, required this.taskEntity});
  final TaskEntity taskEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitleSelectTaskCat(),
        actions: [
          MoreOptionsAppBarIconButton(
            onPressed: () {
              _moreOptionsBottomSheet(context);
            },
          ),
        ],
      ),
      body: AddTaskViewBody(
        taskEntity: taskEntity,
      ),
    );
  }

  Future<void> _moreOptionsBottomSheet(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      builder: (context) => const MoreOptionsBottomSheet(),
    );
  }
}
