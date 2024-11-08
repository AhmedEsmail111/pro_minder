import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/use_case/use_case.dart';
import '../repos/tasks_repo.dart';

class DeleteTaskCategoryUseCase implements UseCase<int, String> {
  final TasksRepo _tasksRepo;

  DeleteTaskCategoryUseCase({required TasksRepo tasksRepo})
      : _tasksRepo = tasksRepo;
  @override
  Future<Either<Failure, int>> execute(String taskCategoryId) async {
    return await _tasksRepo.deleteTaskCategory(taskCategoryId);
  }
}
