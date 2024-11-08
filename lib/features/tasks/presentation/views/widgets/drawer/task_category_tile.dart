import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pro_minder/core/utils/my_consonants.dart';
import 'package:pro_minder/core/utils/text_styles.dart';
import 'package:pro_minder/features/tasks/presentation/manager/category_tile/category_tile_cubit.dart';

import '../../../../../../core/entities/task_category_entity.dart';
import '../../../../../../core/utils/colors.dart';
import '../../../manager/drawer_controller.dart';

class TaskCategoryTile extends StatelessWidget {
  const TaskCategoryTile({
    super.key,
    required this.taskCategory,
    required this.tileIndex,
    required this.selectedIndex,
    // required this.onDrawerClosed,
  });
  final TaskCategoryEntity taskCategory;
  final int tileIndex;
  final int selectedIndex;
  // final Function() onDrawerClosed;
  @override
  Widget build(BuildContext context) {
    final optionalColorContainerWidth = 2.0.w;
    final sizedBoxWidth = 6.0.w;
    final isSelected = tileIndex == selectedIndex;
    final selectedColor = secondaryColor.withOpacity(0.2);
    return Material(
      color: isSelected ? selectedColor : drawerBackgroundColor,
      child: ListTile(
        selected: isSelected,
        onTap: () {
          CategoryTileCubit.of(context).changeCurrentSelectedCategory(
            index: tileIndex,
            catName: taskCategory.title,
          );

          Future.delayed(const Duration(milliseconds: 200), () {
            DrawerManager.closeDrawer();
          });
        },
        dense: true,
        leading: SizedBox(
          width:
              (defaultIconSize + sizedBoxWidth + optionalColorContainerWidth),
          child: Row(
            children: [
              if (taskCategory.color != null)
                Row(
                  children: [
                    Container(
                      color: taskCategory.color,
                      width: optionalColorContainerWidth,
                      height: (defaultListTileHeight - 32),
                    ),
                    SizedBox(
                      width: sizedBoxWidth,
                    ),
                  ],
                ),
              Icon(
                taskCategory.iconData ?? FontAwesomeIcons.bars,
                color: taskCategory.iconData != null
                    ? secondaryColor
                    : null, //null means will take the default value (Colors.white)
              ),
            ],
          ),
        ),
        title: Text(
          taskCategory.title,
          style: style15Bold,
        ),
        trailing: const Text('3'),
      ),
    );
  }
}
