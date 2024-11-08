import 'package:flutter/material.dart';

import '../../manager/fetch_all_tasks/fetch_all_tasks_cubit.dart';
import 'task_tile/task_tiles_container_list_view.dart';

class TasksViewBody extends StatelessWidget {
  const TasksViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final tasks = FetchAllTasksCubit.of(context).allTasks;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: tasks.isNotEmpty
              ? TaskTilesContainerListView(
                  tasks: tasks,
                )
              : Container(),
        )
      ],
    );
  }
}
