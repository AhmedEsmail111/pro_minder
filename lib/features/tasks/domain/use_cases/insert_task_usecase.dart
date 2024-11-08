import 'package:dartz/dartz.dart';
import 'package:pro_minder/core/entities/task_entity.dart';
import 'package:pro_minder/core/errors/failure.dart';
import 'package:pro_minder/core/use_case/use_case.dart';
import 'package:pro_minder/features/tasks/domain/repos/tasks_repo.dart';

class InsertTaskUseCase implements UseCase<int, TaskEntity> {
  final TasksRepo _tasksRepo;

  InsertTaskUseCase({required TasksRepo tasksRepo}) : _tasksRepo = tasksRepo;
  @override
  Future<Either<Failure, int>> execute(TaskEntity task) async {
    return await _tasksRepo.insertTask(task);
  }
}
