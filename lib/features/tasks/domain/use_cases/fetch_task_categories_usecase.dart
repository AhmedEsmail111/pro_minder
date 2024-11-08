import 'package:dartz/dartz.dart';
import 'package:pro_minder/core/use_case/use_case.dart';

import '../../../../core/entities/task_category_entity.dart';
import '../../../../core/errors/failure.dart';
import '../repos/tasks_repo.dart';

class FetchTaskCategoriesUseCase
    implements UseCaseNoParam<List<TaskCategoryEntity>> {
  final TasksRepo _tasksRepo;

  FetchTaskCategoriesUseCase({required TasksRepo tasksRepo})
      : _tasksRepo = tasksRepo;
  @override
  Future<Either<Failure, List<TaskCategoryEntity>>> execute() async {
    return await _tasksRepo.fetchTaskCategories();
  }
}
