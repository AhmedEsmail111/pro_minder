import '../../../../core/entities/task_category_entity.dart';
import '../../../../core/entities/task_entity.dart';
import '../../../../core/utils/services/database_service.dart';

abstract class LocalTasksDataSource {
  Future<int> insertTask(TaskEntity task);
  Future<int> updateTask(TaskEntity task);
  Future<int> deleteTask(String taskId);
  Future<List<TaskEntity>> fetchAllTasks();
  Future<List<TaskEntity>> fetchCompletedTasks();
  Future<int> insertTaskCategory(TaskCategoryEntity taskCategory);
  Future<int> deleteTaskCategory(String taskCatId);
  Future<List<TaskCategoryEntity>> fetchTaskCategories();
}

class LocalTasksDataSourceImpl implements LocalTasksDataSource {
  final DatabaseService _dbService;

  LocalTasksDataSourceImpl({required DatabaseService dbService})
      : _dbService = dbService;
  @override
  Future<int> insertTask(TaskEntity task) async {
    return await _dbService.insertTask(task);
  }

  @override
  Future<int> updateTask(TaskEntity task) async {
    return await _dbService.updateTask(task);
  }

  @override
  Future<int> deleteTask(String taskId) async {
    return await _dbService.deleteTask(taskId);
  }

  @override
  Future<List<TaskEntity>> fetchAllTasks() async {
    final List<TaskEntity> tasks = [];
    final result = await _dbService.fetchAllTasks();
    for (final task in result) {
      tasks.add(TaskEntity.fromMap(task));
    }
    return tasks;
  }

  @override
  Future<List<TaskEntity>> fetchCompletedTasks() async {
    final List<TaskEntity> completedTasks = [];
    final result = await _dbService.fetchCompletedTasks();
    for (final task in result) {
      completedTasks.add(TaskEntity.fromMap(task));
    }
    return completedTasks;
  }

  @override
  Future<int> insertTaskCategory(TaskCategoryEntity taskCategory) async {
    return await _dbService.insertTaskCategory(taskCategory);
  }

  @override
  Future<int> deleteTaskCategory(String taskCatId) async {
    return await _dbService.deleteTaskCategory(taskCatId);
  }

  @override
  Future<List<TaskCategoryEntity>> fetchTaskCategories() async {
    final List<TaskCategoryEntity> taskCategories = [];
    final result = await _dbService.fetchTaskCategories();
    for (final taskCat in result) {
      taskCategories.add(TaskCategoryEntity.fromMap(taskCat));
    }
    return taskCategories;
  }
}
