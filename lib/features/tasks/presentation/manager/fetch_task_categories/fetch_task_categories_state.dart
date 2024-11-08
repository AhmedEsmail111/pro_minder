import 'package:flutter/material.dart';

import '../../../../../core/entities/task_category_entity.dart';

@immutable
sealed class FetchTaskCategoriesStates {}

final class FetchTaskCategoriesInitial extends FetchTaskCategoriesStates {}

final class FetchTaskCategoriesFailure extends FetchTaskCategoriesStates {
  final String errorMessage;

  FetchTaskCategoriesFailure({required this.errorMessage});
}

final class FetchTaskCategoriesSuccess extends FetchTaskCategoriesStates {
  final List<TaskCategoryEntity> taskCats;

  FetchTaskCategoriesSuccess({required this.taskCats});
}
