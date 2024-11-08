import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/use_case/use_case.dart';
import '../repos/tasks_repo.dart';

class DeleteTaskUseCase implements UseCase<int, String> {
  final TasksRepo _tasksRepo;

  DeleteTaskUseCase({required TasksRepo tasksRepo}) : _tasksRepo = tasksRepo;
  @override
  Future<Either<Failure, int>> execute(String taskId) async {
    return await _tasksRepo.deleteTask(taskId);
  }
}
