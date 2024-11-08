import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locator/locator.dart';
import 'package:pro_minder/features/tasks/presentation/manager/drawer_controller.dart';
import 'package:pro_minder/features/tasks/presentation/views/widgets/add_task/animated_floating_action_button.dart';
import 'package:pro_minder/features/tasks/presentation/views/widgets/custom_app_bar.dart';
import 'package:pro_minder/features/tasks/presentation/views/widgets/drawer/bloc_consumer_drawer_menu.dart';
import 'package:pro_minder/features/tasks/presentation/views/widgets/tasks_view_body.dart';

import '../../../../core/utils/services/shared_preferences.dart';
import '../manager/category_tile/category_tile_cubit.dart';

class TasksView extends StatefulWidget {
  const TasksView({super.key});

  @override
  State<TasksView> createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryTileCubit(
        cacheService: const Locator().get<CacheService>(),
      ),
      child: Scaffold(
        key: DrawerManager.scaffoldKey,
        appBar: const CustomAppBar(),
        drawer: const BlocConsumerDrawerMenu(),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
          child: TasksViewBody(),
        ),
        floatingActionButton: const AnimatedFloatingActionButton(),
      ),
    );
  }
}
