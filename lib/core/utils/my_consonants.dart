import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pro_minder/core/entities/task_category_entity.dart';
import 'package:pro_minder/core/utils/colors.dart';

import '../entities/task_entity.dart';

const didShowOnBoarding = 'didShowOnBoarding';
const chosenCategoryTileIndex = 'lastChosenCategoryTileIndex';
const tasksDB = 'tasks';
const taskCategoriesDB = 'taskCategories';

final defaultIconSize = 19.0.w;
final defaultListTileHeight = 50.0.h;
const actionButtonAnimationDuration = Duration(milliseconds: 200);
const roundedBorder8Radius = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(8),
  ),
);
const priorityToFlagsMap = {
  'High Priority': FlagsOfImportance.urgentImportant,
  'Medium Priority': FlagsOfImportance.urgentUnimportant,
  'Low Priority': FlagsOfImportance.notUrgentImportant,
  'No Priority': FlagsOfImportance.notUrgentUnimportant,
};

const taskPriorities = <Map<String, dynamic>>[
  {
    'priority': 'High Priority',
    'color': Color.fromARGB(255, 221, 31, 18),
  },
  {
    'priority': 'Medium Priority',
    'color': Color.fromARGB(255, 230, 140, 4),
  },
  {
    'priority': 'Low Priority',
    'color': Color.fromARGB(255, 52, 65, 245),
  },
  {
    'priority': 'No Priority',
    'color': smallIconsColor,
  },
];
final defaultTaskCats = <TaskCategoryEntity>[
  TaskCategoryEntity.wittDefaultId(
    title: 'All',
    icon: FontAwesomeIcons.folderTree,
    isSmart: true,
  ),
  TaskCategoryEntity.wittDefaultId(
    title: 'Today',
    icon: FontAwesomeIcons.calendarDay,
    isSmart: true,
  ),
  TaskCategoryEntity.wittDefaultId(
    title: 'Next 7 Days',
    icon: FontAwesomeIcons.calendarWeek,
    isSmart: true,
  ),
  TaskCategoryEntity.wittDefaultId(
    title: 'Work',
    icon: FontAwesomeIcons.suitcase,
    isSmart: false,
  ),
];
