import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pro_minder/core/utils/colors.dart';
import 'package:pro_minder/features/tasks/presentation/views/widgets/add_task/add_task_view/move_to_cat_top_sheet/available_task_cats_list.dart';

import '../../../rounded_text_field.dart';
import 'row_header.dart';

class MoveToCategoryTopSheet extends StatelessWidget {
  const MoveToCategoryTopSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: Material(
          color: primaryColor,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.sizeOf(context).height,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const RowHeader(),
                  SizedBox(
                    height: 12.h,
                  ),
                  SizedBox(
                    height: 41.h,
                    child: const RoundedTextField(
                      hintText: 'Search',
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const Expanded(
                    child: AvailableTaskCatsList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
