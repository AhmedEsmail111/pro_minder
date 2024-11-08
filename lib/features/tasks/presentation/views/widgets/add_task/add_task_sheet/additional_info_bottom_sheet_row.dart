import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../../core/entities/task_category_entity.dart';
import '../../../../../../../core/utils/colors.dart';
import '../../../../../../../core/utils/my_consonants.dart';
import '../../../../../../../core/utils/text_styles.dart';
import '../../../../manager/add_task_bottomsheet/add_task_bottomsheet_cubit.dart';
import '../../../../manager/add_task_bottomsheet/add_task_bottomsheet_state.dart';
import '../../../../manager/fetch_task_categories/fetch_task_categories_cubit.dart';
import '../../../../manager/fetch_task_categories/fetch_task_categories_state.dart';
import '../functions.dart';
import 'task_cat_menu_item.dart';

class AdditionalInfoRow extends StatelessWidget {
  const AdditionalInfoRow({
    super.key,
    required this.hasTaskCatButtonMenu,
  });
  final bool hasTaskCatButtonMenu;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddTaskBottomSheetCubit, AddTaskBottomSheetStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final bottomSheetCubit = AddTaskBottomSheetCubit.of(context);
        return Row(
          children: [
            IconButton(
              icon: const Icon(FontAwesomeIcons.calendarDays),
              color: smallIconsColor,
              onPressed: () async {
                final dateTime = await selectDate(context);
                if (dateTime != null) {
                  bottomSheetCubit.changeDate(dateTime);
                  log(dateTime.hour.toString());
                }
              },
              iconSize: 16.w,
            ),
            IconButton(
              iconSize: 16.w,
              icon: const Icon(
                FontAwesomeIcons.solidFlag,
                color: smallIconsColor,
              ),
              onPressed: () async {
                final Map<String, dynamic>? priorityData =
                    await priorityMenu(context);
                bottomSheetCubit.changePriority(priorityData);
              },
            ),
            if (hasTaskCatButtonMenu)
              BlocBuilder<FetchTaskCategoriesCubit, FetchTaskCategoriesStates>(
                builder: (context, state) {
                  final cubit = FetchTaskCategoriesCubit.of(context);
                  final taskCats = cubit.nonSmartTaskCategories;
                  return TextButton.icon(
                    onPressed: () async {
                      final taskCat = await _taskCatsMenu(context, taskCats);
                      if (taskCat != null) {
                        bottomSheetCubit.changeTaskCat(taskCat);
                        log(taskCat.title);
                      }
                    },
                    label: Text(
                      'Work',
                      style: style12.copyWith(
                        color: smallIconsColor,
                      ),
                    ),
                    icon: Icon(
                      FontAwesomeIcons.suitcase,
                      size: 16.w,
                      color: smallIconsColor,
                    ),
                  );
                },
              ),
          ],
        );
      },
    );
  }

  Future<TaskCategoryEntity?> _taskCatsMenu(
      BuildContext context, List<TaskCategoryEntity> taskCats) async {
    return await showMenu(
      color: menusBackgroundColor,
      context: context,
      shape: roundedBorder8Radius,
      position: buildRelativeRect(context),
      items: List<PopupMenuEntry<TaskCategoryEntity>>.generate(
        taskCats.length,
        (index) => PopupMenuItem<TaskCategoryEntity>(
          value: taskCats[index],
          child: TaskCatMenuItem(
            iconData: taskCats[index].iconData,
            taskCat: taskCats[index].title,
          ),
        ),
      ),
    );
  }
}
