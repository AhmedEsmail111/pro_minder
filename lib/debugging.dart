import 'package:flutter/material.dart';
import 'package:locator/locator.dart';

import 'core/entities/task_category_entity.dart';
import 'core/entities/task_entity.dart';
import 'core/utils/services/database_service.dart';

final tasks = <TaskEntity>[
  TaskEntity.withDefaultId(
    priority: Priority(
      flag: FlagsOfImportance.notUrgentImportant,
      color: Colors.yellow,
    ),
    isCompleted: false,
    title: 'Go to the Gym',
    description: 'we go to the gym every day',
    date: DateTime(2024, 10, 24),
    taskCategory:
        TaskCategoryEntity.wittDefaultId(color: Colors.red, title: 'work'),
    subTasks: [
      TaskEntity.withDefaultId(
        priority: Priority(
          flag: FlagsOfImportance.notUrgentImportant,
          color: Colors.yellow,
        ),
        isCompleted: false,
        title: 'title',
        description: 'description',
        date: DateTime.now(),
        taskCategory:
            TaskCategoryEntity.wittDefaultId(color: Colors.red, title: 'work'),
      ),
      TaskEntity.withDefaultId(
        priority: Priority(
          flag: FlagsOfImportance.notUrgentImportant,
          color: Colors.yellow,
        ),
        isCompleted: false,
        title: 'title',
        description: 'description',
        date: DateTime.now(),
        taskCategory:
            TaskCategoryEntity.wittDefaultId(color: Colors.red, title: 'work'),
      ),
    ],
  ),
  TaskEntity.withDefaultId(
    priority: Priority(
      flag: FlagsOfImportance.notUrgentImportant,
      color: Colors.yellow,
    ),
    isCompleted: false,
    title: 'Go to wok',
    description: 'We go to work every day',
    date: DateTime.now(),
    taskCategory:
        TaskCategoryEntity.wittDefaultId(color: Colors.red, title: 'work'),
  ),
  TaskEntity.withDefaultId(
    priority: Priority(
      flag: FlagsOfImportance.notUrgentImportant,
      color: Colors.yellow,
    ),
    isCompleted: false,
    title: 'Tasks',
    description: 'description',
    date: DateTime(2024, 10, 24),
    taskCategory:
        TaskCategoryEntity.wittDefaultId(color: Colors.red, title: 'work'),
    subTasks: [
      TaskEntity.withDefaultId(
        priority: Priority(
          flag: FlagsOfImportance.notUrgentImportant,
          color: Colors.yellow,
        ),
        isCompleted: false,
        title: 'title',
        description: 'description',
        date: DateTime.now(),
        taskCategory:
            TaskCategoryEntity.wittDefaultId(color: Colors.red, title: 'work'),
      ),
      TaskEntity.withDefaultId(
        priority: Priority(
          flag: FlagsOfImportance.notUrgentImportant,
          color: Colors.yellow,
        ),
        isCompleted: false,
        title: 'title',
        description: 'description',
        date: DateTime.now(),
        taskCategory:
            TaskCategoryEntity.wittDefaultId(color: Colors.red, title: 'work'),
      ),
    ],
  ),
  TaskEntity.withDefaultId(
    priority: Priority(
      flag: FlagsOfImportance.notUrgentImportant,
      color: Colors.yellow,
    ),
    isCompleted: false,
    title: 'Tasks',
    description: 'description',
    date: DateTime(2024, 10, 24),
    taskCategory:
        TaskCategoryEntity.wittDefaultId(color: Colors.red, title: 'work'),
  ),
];

void test() async {
  final task = TaskEntity.withDefaultId(
    priority: Priority(
      flag: FlagsOfImportance.notUrgentImportant,
      color: Colors.yellow,
    ),
    isCompleted: false,
    title: 'title',
    description: 'description',
    date: DateTime.now(),
    taskCategory:
        TaskCategoryEntity.wittDefaultId(color: Colors.red, title: 'work'),
    subTasks: [
      TaskEntity.withDefaultId(
        priority: Priority(
          flag: FlagsOfImportance.notUrgentImportant,
          color: Colors.yellow,
        ),
        isCompleted: false,
        title: 'title',
        description: 'description',
        date: DateTime.now(),
        taskCategory:
            TaskCategoryEntity.wittDefaultId(color: Colors.red, title: 'work'),
      ),
      TaskEntity.withDefaultId(
        priority: Priority(
          flag: FlagsOfImportance.notUrgentImportant,
          color: Colors.yellow,
        ),
        isCompleted: false,
        title: 'title',
        description: 'description',
        date: DateTime.now(),
        taskCategory:
            TaskCategoryEntity.wittDefaultId(color: Colors.red, title: 'work'),
      ),
    ],
  );
  final databaseService = const Locator().get<DatabaseService>();
  await databaseService.insertTask(task);
  final tasks = await databaseService.fetchAllTasks();
  final allTasks = <TaskEntity>[];
  for (final task in tasks) {
    allTasks.add(
      TaskEntity.fromMap(task),
    );
  }
  print(allTasks.length);
}
