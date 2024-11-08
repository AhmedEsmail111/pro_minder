import 'package:dartz/dartz.dart';

import '../../../../core/entities/task_entity.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/use_case/use_case.dart';
import '../repos/tasks_repo.dart';

class UpdateTaskUseCase implements UseCase<int, TaskEntity> {
  final TasksRepo _tasksRepo;

  UpdateTaskUseCase({required TasksRepo tasksRepo}) : _tasksRepo = tasksRepo;
  @override
  Future<Either<Failure, int>> execute(TaskEntity task) async {
    return await _tasksRepo.updateTask(task);
  }
}
