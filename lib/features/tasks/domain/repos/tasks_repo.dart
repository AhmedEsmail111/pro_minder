import 'package:dartz/dartz.dart';
import 'package:pro_minder/core/entities/task_entity.dart';
import 'package:pro_minder/core/errors/failure.dart';

import '../../../../core/entities/task_category_entity.dart';

abstract class TasksRepo {
  Future<Either<Failure, int>> insertTask(TaskEntity task);
  Future<Either<Failure, int>> updateTask(TaskEntity task);
  Future<Either<Failure, List<TaskEntity>>> fetchAllTasks();
  Future<Either<Failure, List<TaskEntity>>> fetchCompletedTasks();
  Future<Either<Failure, int>> deleteTask(String taskId);
  Future<Either<Failure, int>> insertTaskCategory(
      TaskCategoryEntity taskCategory);
  Future<Either<Failure, List<TaskCategoryEntity>>> fetchTaskCategories();
  Future<Either<Failure, int>> deleteTaskCategory(String taskCatId);
}
