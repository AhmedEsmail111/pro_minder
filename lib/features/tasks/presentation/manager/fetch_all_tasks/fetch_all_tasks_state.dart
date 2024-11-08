import 'package:flutter/material.dart';

import '../../../../../core/entities/task_entity.dart';

@immutable
sealed class FetchAllTasksStates {}

final class FetchAllTasksInitial extends FetchAllTasksStates {}

final class FetchAllTasksSuccess extends FetchAllTasksStates {
  final List<TaskEntity> tasks;

  FetchAllTasksSuccess({required this.tasks});
}

final class FetchAllTasksFailure extends FetchAllTasksStates {
  final String errorMessage;

  FetchAllTasksFailure({required this.errorMessage});
}
