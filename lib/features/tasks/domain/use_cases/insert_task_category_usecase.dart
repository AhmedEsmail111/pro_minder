import 'package:dartz/dartz.dart';
import 'package:pro_minder/core/use_case/use_case.dart';

import '../../../../core/entities/task_category_entity.dart';
import '../../../../core/errors/failure.dart';
import '../repos/tasks_repo.dart';

class InsertTaskCategoryUseCase implements UseCase<int, TaskCategoryEntity> {
  final TasksRepo _tasksRepo;

  InsertTaskCategoryUseCase({required TasksRepo tasksRepo})
      : _tasksRepo = tasksRepo;
  @override
  Future<Either<Failure, int>> execute(TaskCategoryEntity taskCategory) async {
    return await _tasksRepo.insertTaskCategory(taskCategory);
  }
}
