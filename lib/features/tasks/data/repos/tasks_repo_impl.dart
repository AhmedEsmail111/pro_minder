import 'package:dartz/dartz.dart';
import 'package:pro_minder/core/entities/task_entity.dart';
import 'package:pro_minder/core/errors/failure.dart';
import 'package:pro_minder/features/tasks/data/data_sources/local_tasks_data_source.dart';
import 'package:pro_minder/features/tasks/domain/repos/tasks_repo.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../core/entities/task_category_entity.dart';

class TasksRepoImpl implements TasksRepo {
  final LocalTasksDataSource _localTasksDataSource;

  TasksRepoImpl({required LocalTasksDataSource localTasksDataSource})
      : _localTasksDataSource = localTasksDataSource;
  @override
  Future<Either<Failure, int>> insertTask(TaskEntity task) async {
    try {
      final count = await _localTasksDataSource.insertTask(task);
      return right(count);
    } on Exception catch (e) {
      print(e.toString());
      if (e is DatabaseException) {
        return left(DatabaseFailure.fromDatabaseException(e));
      }
      return left(DatabaseFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> updateTask(TaskEntity task) async {
    try {
      final count = await _localTasksDataSource.updateTask(task);
      return right(count);
    } on Exception catch (e) {
      print(e.toString());
      if (e is DatabaseException) {
        return left(DatabaseFailure.fromDatabaseException(e));
      }
      return left(DatabaseFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> deleteTask(String taskId) async {
    try {
      final count = await _localTasksDataSource.deleteTask(taskId);
      return right(count);
    } on Exception catch (e) {
      print(e.toString());
      if (e is DatabaseException) {
        return left(DatabaseFailure.fromDatabaseException(e));
      }
      return left(DatabaseFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TaskEntity>>> fetchAllTasks() async {
    try {
      final tasks = await _localTasksDataSource.fetchAllTasks();
      return right(tasks);
    } on Exception catch (e) {
      print(e.toString());
      if (e is DatabaseException) {
        return left(DatabaseFailure.fromDatabaseException(e));
      }
      return left(DatabaseFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TaskEntity>>> fetchCompletedTasks() async {
    try {
      final completedTasks = await _localTasksDataSource.fetchCompletedTasks();
      return right(completedTasks);
    } on Exception catch (e) {
      print(e.toString());
      if (e is DatabaseException) {
        return left(DatabaseFailure.fromDatabaseException(e));
      }
      return left(DatabaseFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> insertTaskCategory(
      TaskCategoryEntity taskCategory) async {
    try {
      final count =
          await _localTasksDataSource.insertTaskCategory(taskCategory);
      return right(count);
    } on Exception catch (e) {
      print(e.toString());
      if (e is DatabaseException) {
        return left(DatabaseFailure.fromDatabaseException(e));
      }
      return left(DatabaseFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> deleteTaskCategory(String taskCatId) async {
    try {
      final count = await _localTasksDataSource.deleteTaskCategory(taskCatId);
      return right(count);
    } on Exception catch (e) {
      print(e.toString());
      if (e is DatabaseException) {
        return left(DatabaseFailure.fromDatabaseException(e));
      }
      return left(DatabaseFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TaskCategoryEntity>>>
      fetchTaskCategories() async {
    try {
      final taskCategories = await _localTasksDataSource.fetchTaskCategories();
      return right(taskCategories);
    } on Exception catch (e) {
      print(e.toString());
      if (e is DatabaseException) {
        return left(DatabaseFailure.fromDatabaseException(e));
      }
      return left(DatabaseFailure(errorMessage: e.toString()));
    }
  }
}
