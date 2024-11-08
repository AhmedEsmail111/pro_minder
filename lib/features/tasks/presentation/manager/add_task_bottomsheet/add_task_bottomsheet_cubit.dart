import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_minder/core/entities/task_category_entity.dart';
import 'package:pro_minder/core/entities/task_entity.dart';

import '../../../../../core/utils/my_consonants.dart';
import 'add_task_bottomsheet_state.dart';

class AddTaskBottomSheetCubit extends Cubit<AddTaskBottomSheetStates> {
  AddTaskBottomSheetCubit() : super(AddTaskBottomSheetInitial());

  static AddTaskBottomSheetCubit of(BuildContext context) =>
      BlocProvider.of(context);

  DateTime taskDate = DateTime.now();
  TaskCategoryEntity? taskCategoryEntity;
  Priority? taskPriority;

  void changeDate(DateTime selectedDate) {
    taskDate = selectedDate;
  }

  void changeTaskCat(TaskCategoryEntity selectedTaskCat) {
    taskCategoryEntity = selectedTaskCat;
  }

  void changePriority(Map<String, dynamic>? priorityData) {
    if (priorityData != null) {
      final FlagsOfImportance flagsOfImportance =
          priorityToFlagsMap[priorityData['priority']]!;
      final priority = Priority(
        flag: flagsOfImportance,
        color: priorityData['color'],
      );
      log(priority.flag.name);
      taskPriority = priority;
    }
  }
}
