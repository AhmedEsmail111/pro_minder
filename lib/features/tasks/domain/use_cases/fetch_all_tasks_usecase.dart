import 'package:dartz/dartz.dart';

import '../../../../core/entities/task_entity.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/use_case/use_case.dart';
import '../repos/tasks_repo.dart';

class FetchAllTasksUseCase implements UseCaseNoParam<List<TaskEntity>> {
  final TasksRepo _tasksRepo;

  FetchAllTasksUseCase({required TasksRepo tasksRepo}) : _tasksRepo = tasksRepo;
  @override
  Future<Either<Failure, List<TaskEntity>>> execute() async {
    return await _tasksRepo.fetchAllTasks();
  }
}
