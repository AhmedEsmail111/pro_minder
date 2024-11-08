import 'package:flutter/material.dart';

import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/my_consonants.dart';
import 'priority_menu_item.dart';

Future<DateTime?> selectDate(BuildContext context) async {
  return await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(2026),
  );
}

Future<Map<String, dynamic>?> priorityMenu(BuildContext context,
    {RelativeRect? relativeRect}) async {
  return await showMenu<Map<String, dynamic>>(
    color: menusBackgroundColor,
    context: context,
    shape: roundedBorder8Radius,
    position: relativeRect ?? buildRelativeRect(context),
    items: List<PopupMenuEntry<Map<String, dynamic>>>.generate(
      taskPriorities.length,
      (index) => PopupMenuItem<Map<String, dynamic>>(
        value: taskPriorities[index],
        child: PriorityMenuItem(
          color: taskPriorities[index]['color'],
          title: taskPriorities[index]['priority'],
        ),
      ),
    ),
  );
}

RelativeRect buildRelativeRect(BuildContext context) {
  return RelativeRect.fromDirectional(
    textDirection: TextDirection.ltr,
    start: 20,
    top: MediaQuery.of(context).size.height * 0.5,
    end: 20,
    bottom: 0,
  );
}
