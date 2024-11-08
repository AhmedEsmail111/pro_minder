import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_minder/features/tasks/presentation/views/widgets/drawer/menu_drawer.dart';

import '../../../../../../core/entities/task_category_entity.dart';
import '../../../manager/fetch_task_categories/fetch_task_categories_cubit.dart';
import '../../../manager/fetch_task_categories/fetch_task_categories_state.dart';

class BlocConsumerDrawerMenu extends StatefulWidget {
  const BlocConsumerDrawerMenu({
    super.key,
    //  required this.onDrawerClosed,
  });
  // final Function() onDrawerClosed;
  @override
  State<BlocConsumerDrawerMenu> createState() => _BlocConsumerDrawerMenuState();
}

class _BlocConsumerDrawerMenuState extends State<BlocConsumerDrawerMenu> {
  List<TaskCategoryEntity> taskCats = [];

  @override
  void initState() {
    super.initState();

    FetchTaskCategoriesCubit.of(context).fetchTaskCategories();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchTaskCategoriesCubit, FetchTaskCategoriesStates>(
        listener: (context, state) {
      if (state is FetchTaskCategoriesSuccess) {
        taskCats.clear();
        taskCats.addAll(state.taskCats);
        print(
            'fetched task categories =============================================== ${taskCats.length}');
      }
    }, builder: (context, state) {
      return CustomMenuDrawer(
        userEmail: 'ismailahmed511@gmail.com',
        taskCats: taskCats,
        // onDrawerClosed: widget.onDrawerClosed,
      );
    });
  }
}
