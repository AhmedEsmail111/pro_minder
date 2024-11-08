import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

class TaskCategoryEntity {
  final String id;
  final String title;
  final Color? color;
  final bool isSmart;
  final IconData? iconData;

  TaskCategoryEntity({
    required this.id,
    required this.title,
    this.isSmart = false,
    this.color,
    this.iconData,
  });

  factory TaskCategoryEntity.wittDefaultId({
    Color? color,
    required String title,
    bool isSmart = false,
    IconData? icon,
  }) {
    return TaskCategoryEntity(
      id: _uuid.v4(),
      title: title,
      color: color,
      isSmart: isSmart,
      iconData: icon,
    );
  }

  factory TaskCategoryEntity.fromMap(Map<String, dynamic> json) {
    final decodedIcon = jsonDecode(json['icon']);
    final IconData? icon = decodedIcon['codePoint'] != null
        ? IconData(
            decodedIcon['codePoint'],
            fontFamily: decodedIcon['fontFamily'],
            fontPackage: decodedIcon['fontPackage'],
            matchTextDirection: decodedIcon['matchTextDirection'],
          )
        : null;
    return TaskCategoryEntity(
      id: json['id'],
      title: json['title'],
      color: json['color'] != null ? Color(json['color']) : null,
      isSmart: json['isSmart'] == 0 ? false : true,
      iconData: icon,
    );
  }

  Map<String, dynamic> toMap() {
    final iconMap = jsonEncode({
      'codePoint': iconData?.codePoint,
      'fontFamily': iconData?.fontFamily,
      'fontPackage': iconData?.fontPackage,
      'matchTextDirection': iconData?.matchTextDirection,
    });
    return {
      'id': id,
      'title': title,
      'color': color?.value,
      'isSmart': isSmart == true ? 1 : 0,
      'icon': iconMap,
    };
  }
}
