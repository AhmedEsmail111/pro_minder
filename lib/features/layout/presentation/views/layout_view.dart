import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locator/locator.dart';
import 'package:pro_minder/features/layout/presentation/manager/bottom_nav_controller/bottom_nav_cubit.dart';
import 'package:pro_minder/features/tasks/domain/use_cases/fetch_all_tasks_usecase.dart';
import 'package:pro_minder/features/tasks/presentation/manager/fetch_all_tasks/fetch_all_tasks_cubit.dart';

import 'widgets/layout_view_body.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BottomNavCubit(),
        ),
        BlocProvider(
          create: (context) => FetchAllTasksCubit(
            const Locator().get<FetchAllTasksUseCase>(),
          )..fetchAllTasks(),
        ),
      ],
      child: const LayoutViewBody(),
    );
  }
}
