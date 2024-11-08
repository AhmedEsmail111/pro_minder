import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pro_minder/features/tasks/presentation/manager/category_tile/category_tile_cubit.dart';
import 'package:pro_minder/features/tasks/presentation/manager/category_tile/category_tile_state.dart';
import 'package:pro_minder/features/tasks/presentation/manager/drawer_controller.dart';
import 'package:pro_minder/features/tasks/presentation/views/widgets/more_options_appbar_icon.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: BlocBuilder<CategoryTileCubit, CategoryTileStates>(
        builder: (context, state) {
          final cubit = CategoryTileCubit.of(context);
          return Text(cubit.selectedCategoryName);
        },
      ),
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          size: 24.w,
        ),
        onPressed: () {
          DrawerManager.openDrawer();
        },
      ),
      actions: [
        MoreOptionsAppBarIconButton(
          onPressed: () {},
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
