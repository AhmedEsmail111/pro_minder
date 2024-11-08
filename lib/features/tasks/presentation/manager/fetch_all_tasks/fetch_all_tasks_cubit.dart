import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_minder/core/entities/task_entity.dart';

import '../../../domain/use_cases/fetch_all_tasks_usecase.dart';
import 'fetch_all_tasks_state.dart';

class FetchAllTasksCubit extends Cubit<FetchAllTasksStates> {
  final FetchAllTasksUseCase _fetchAllTasksUseCase;
  FetchAllTasksCubit(this._fetchAllTasksUseCase)
      : super(FetchAllTasksInitial());

  static FetchAllTasksCubit of(BuildContext context) =>
      BlocProvider.of(context);
  List<TaskEntity> allTasks = [];
  Future<void> fetchAllTasks() async {
    final result = await _fetchAllTasksUseCase.execute();
    result.fold((failure) {
      emit(FetchAllTasksFailure(errorMessage: failure.errorMessage));
    }, (tasks) {
      allTasks.clear();
      allTasks.addAll(tasks);
      emit(FetchAllTasksSuccess(tasks: tasks));
    });
  }
}
