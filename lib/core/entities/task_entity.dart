import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'task_category_entity.dart';

const _uuid = Uuid();

class TaskEntity {
  final String id;
  final String title;
  final String? description;
  final Priority priority;
  final DateTime? date;
  final TaskCategoryEntity? taskCategory;
  final List<TaskEntity> subTasks;
  final bool isCompleted;

  TaskEntity({
    required this.id,
    required this.priority,
    this.date,
    this.taskCategory,
    this.subTasks = const [],
    this.isCompleted = false,
    required this.title,
    this.description,
  });

  factory TaskEntity.withDefaultId({
    required Priority priority,
    DateTime? date,
    TaskCategoryEntity? taskCategory,
    List<TaskEntity> subTasks = const [],
    bool isCompleted = false,
    required String title,
    String? description,
  }) {
    return TaskEntity(
      id: _uuid.v4(),
      priority: priority,
      isCompleted: isCompleted,
      title: title,
      description: description,
      date: date,
      taskCategory: taskCategory,
      subTasks: subTasks,
    );
  }

  toMap() {
    return {
      'id': id,
      'priority': jsonEncode(priority.toMap()),
      'isCompleted': isCompleted == false ? 0 : 1,
      'title': title,
      'description': description,
      'date': date?.millisecondsSinceEpoch.toString(),
      'taskCategory': jsonEncode(taskCategory?.toMap()),
      'subTasks': jsonEncode(subTasks
          .map(
            (subtask) => subtask.toMap(),
          )
          .toList()),
    };
  }

  factory TaskEntity.fromMap(Map<String, dynamic> map) {
    final taskCategoryJson = jsonDecode(map['taskCategory']);
    final decodedPriorityJson = jsonDecode(map['priority']);
    final subTaskJson = List.from(jsonDecode(map['subTasks']));
    final List<TaskEntity> subTasks = subTaskJson
        .map(
          (task) => TaskEntity.fromMap(task),
        )
        .toList();
    return TaskEntity(
      id: map['id'],
      priority: Priority.fromMap(decodedPriorityJson),
      isCompleted: map['isCompleted'] == 0 ? false : true,
      title: map['title'],
      description: map['description'],
      date: DateTime.tryParse(map['date']),
      taskCategory: TaskCategoryEntity.fromMap(taskCategoryJson),
      subTasks: subTasks,
    );
  }
}

class Priority {
  final FlagsOfImportance flag;
  final Color color;

  Priority({required this.flag, required this.color});

  Map<String, dynamic> toMap() {
    return {
      'flag': flag.name,
      'color': color.value,
    };
  }

  factory Priority.fromMap(Map<String, dynamic> json) {
    final flag = FlagsOfImportance.values
        .firstWhere((value) => value.name == json['flag']);
    return Priority(
      flag: flag,
      color: Color(json['color']),
    );
  }
}

enum FlagsOfImportance {
  urgentImportant,
  notUrgentImportant,
  urgentUnimportant,
  notUrgentUnimportant;

  static FlagsOfImportance getFlagFromName(String name) {
    return FlagsOfImportance.values.firstWhere(
      (flag) => flag.name.toLowerCase() == name.toLowerCase(),
    );
  }
}
