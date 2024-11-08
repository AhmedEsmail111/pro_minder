import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:locator/locator.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pro_minder/core/entities/task_category_entity.dart';
import 'package:pro_minder/core/entities/task_entity.dart';
import 'package:pro_minder/core/utils/services/database_service.dart';

const MockSpec databaseService = MockSpec<DatabaseService>();
@GenerateNiceMocks([databaseService])
void main() {
  group('databaseService tests', () {
    final dbService = const Locator().get<DatabaseService>();

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
          taskCategory: TaskCategoryEntity.wittDefaultId(
              color: Colors.red, title: 'work'),
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
          taskCategory: TaskCategoryEntity.wittDefaultId(
              color: Colors.red, title: 'work'),
        ),
      ],
    );
    final taskCategory = TaskCategoryEntity.wittDefaultId(
      color: Colors.red,
      title: 'work',
    );

    test(
      'make sure inserting a task works correctly',
      () async {
        when(dbService.insertTask(task)).thenAnswer((_) async => 1);

        expect(await dbService.insertTask(task), 1);
      },
    );

    test('make sure inserting a taskCategory works correctly', () async {
      when(dbService.insertTaskCategory(taskCategory))
          .thenAnswer((_) async => 1);

      expect(await dbService.insertTaskCategory(taskCategory), 1);
    });

    test('make sure fetching all tasks works correctly', () async {
      when(dbService.fetchAllTasks())
          .thenAnswer((_) async => <Map<String, dynamic>>[]);

      expect(await dbService.fetchAllTasks(), <Map<String, dynamic>>[]);
    });
  });
}
