import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pro_minder/core/utils/colors.dart';
import 'package:pro_minder/features/tasks/presentation/manager/category_tile/category_tile_cubit.dart';
import 'package:pro_minder/features/tasks/presentation/manager/category_tile/category_tile_state.dart';

import '../../../../../../core/entities/task_category_entity.dart';
import 'add_category_menu_row.dart';
import 'drawer_row_header.dart';
import 'task_category_tile.dart';

const drawerHeaderHeight = 140;

class CustomMenuDrawer extends StatelessWidget {
  const CustomMenuDrawer({
    super.key,
    required this.userEmail,
    required this.taskCats,
    // required this.onDrawerClosed,
  });
  final String userEmail;
  final List<TaskCategoryEntity> taskCats;
  // final Function() onDrawerClosed;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
          color: drawerBackgroundColor,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(15))),
      width: mediaQuery.size.width * 0.78,
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          NavigationDrawer(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 22.h, left: 12.w, right: 8.w),
                child: DrawerRowHeader(userEmail: userEmail),
              ),
              SizedBox(
                height: 20.h,
              ),
              ...List.generate(
                taskCats.length,
                (index) => BlocBuilder<CategoryTileCubit, CategoryTileStates>(
                  builder: (context, state) {
                    final cubit = CategoryTileCubit.of(context);
                    return TaskCategoryTile(
                      taskCategory: taskCats[index],
                      selectedIndex: cubit.selectedIndex,
                      tileIndex: index,
                      // onDrawerClosed: onDrawerClosed,
                    );
                  },
                ),
              ),
            ],
          ),
          const AddCategoryMenuRow()
        ],
      ),
    );
  }
}
