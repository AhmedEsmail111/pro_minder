import 'package:path/path.dart' as path_package;
import 'package:pro_minder/core/entities/task_entity.dart';
import 'package:pro_minder/core/utils/my_consonants.dart';
import 'package:sqflite/sqflite.dart';

import '../../entities/task_category_entity.dart';

class DatabaseService {
  Database? _database;

  Future<void> initDataBase() async {
    String path = await _databaseStoreLocationLoPath();
    _database = await _createDatabase(path);

    if (_database != null) {
      print('done creating the database');
    }
  }

  Future<String> _databaseStoreLocationLoPath() async {
    final databasesPath = await getDatabasesPath();
    String path = path_package.join(databasesPath, 'proMinder.db');
    return path;
  }

  Future<Database> _createDatabase(String path) async {
    final db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await _createTables(db).then((_) async {
          await insertDefaultTaskCats(db);
        });
      },
      onOpen: (db) {},
    );

    return db;
  }

  Future<void> _createTables(Database db) async {
    // TODO: we should add something to manage the day on which it was completed
    await db.execute(
      'CREATE TABLE $tasksDB (id TEXT PRIMARY KEY, title TEXT, description TEXT, priority TEXT, date TEXT, taskCategory TEXT,subTasks TEXT,isCompleted INTEGER)',
    );

// TODO: we should add something to manage the where is shown or not
    await db.execute(
      'CREATE TABLE $taskCategoriesDB (id TEXT PRIMARY KEY, title TEXT, color INTEGER, isSmart INTEGER, icon TEXT)',
    );
  }

  Future<Database> _getDatabaseInstance() async {
    if (_database != null) return _database!;
    String path = await _databaseStoreLocationLoPath();
    _database = await _createDatabase(path);

    return _database!;
  }

  Future<int> insertTask(TaskEntity task) async {
    final Map<String, dynamic> taskMap = task.toMap();
    const tasksDBFields =
        'title, description, priority, date, taskCategory, subTasks, isCompleted';
    _database = await _getDatabaseInstance();
    return await _database!.database.rawInsert(
      'INSERT INTO $tasksDB(id, $tasksDBFields) VALUES(?, ?, ?, ?, ?, ?, ?, ?)',
      [
        taskMap['id'],
        taskMap['title'],
        taskMap['description'],
        taskMap['priority'],
        taskMap['date'],
        taskMap['taskCategory'],
        taskMap['subTasks'],
        taskMap['isCompleted']
      ],
    );
  }

  Future<int> updateTask(TaskEntity task) async {
    final Map<String, dynamic> taskMap = task.toMap();
    _database = await _getDatabaseInstance();
    return await _database!.database.rawInsert(
      'UPDATE $tasksDB SET title = ?, description = ?, priority = ?, date = ?, taskCategory = ?, subTasks = ?, isCompleted = ?, WHERE id = ?',
      [
        taskMap['title'],
        taskMap['description'],
        taskMap['priority'],
        taskMap['date'],
        taskMap['taskCategory'],
        taskMap['subTasks'],
        taskMap['isCompleted'],
        taskMap['id']
      ],
    );
  }

  Future<List<Map<String, dynamic>>> fetchAllTasks() async {
    _database = await _getDatabaseInstance();
    return await _database!.rawQuery('SELECT * FROM $tasksDB');
  }

  Future<List<Map<String, dynamic>>> fetchCompletedTasks() async {
    _database = await _getDatabaseInstance();
    return await _database!.rawQuery(
      'SELECT * FROM $tasksDB WHERE isCompleted = ?',
      [1],
    );
  }

  Future<int> insertTaskCategory(TaskCategoryEntity taskCategory) async {
    _database = await _getDatabaseInstance();
    final Map<String, dynamic> taskCategoryMap = taskCategory.toMap();
    return _database!.rawInsert(
      'INSERT INTO $taskCategoriesDB(id, title, color, isSmart, icon) VALUES(?, ?, ?, ?,?)',
      [
        taskCategoryMap['id'],
        taskCategoryMap['title'],
        taskCategoryMap['color'],
        taskCategoryMap['isSmart'],
        taskCategoryMap['icon']
      ],
    );
  }

  Future<List<Map<String, dynamic>>> fetchTaskCategories() async {
    _database = await _getDatabaseInstance();
    return await _database!.rawQuery('SELECT * FROM $taskCategoriesDB');
  }

  Future<int> deleteTask(String id) async {
    _database = await _getDatabaseInstance();
    return await _database!.rawDelete(
      'DELETE FROM $tasksDB WHERE id = ?',
      [id],
    );
  }

  Future<int> deleteTaskCategory(String id) async {
    _database = await _getDatabaseInstance();

    return await _database!.rawDelete(
      'DELETE FROM $taskCategoriesDB WHERE id = ?',
      [id],
    );
  }

  Future<void> insertDefaultTaskCats(Database db) async {
    for (final cat in defaultTaskCats) {
      final taskCategoryMap = cat.toMap();
      await db.rawInsert(
        'INSERT INTO $taskCategoriesDB(id, title, color, isSmart, icon) VALUES(?, ?, ?, ?,?)',
        [
          taskCategoryMap['id'],
          taskCategoryMap['title'],
          taskCategoryMap['color'],
          taskCategoryMap['isSmart'],
          taskCategoryMap['icon']
        ],
      );
    }
  }
}

// fetch the tasks table
// insert a taskCategory
// fetch the taskCategory table
// delete a task
// delete a taskCategory
