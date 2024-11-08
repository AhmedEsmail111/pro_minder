import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pro_minder/core/utils/colors.dart';
import 'package:pro_minder/core/utils/my_consonants.dart';
import 'package:pro_minder/core/utils/text_styles.dart';
import 'package:pro_minder/features/tasks/presentation/views/widgets/add_task/add_task_view/add_tile.dart';
import 'package:pro_minder/features/tasks/presentation/views/widgets/add_task/add_task_view/move_to_cat_top_sheet/task_cat_radio_row.dart';
import 'package:pro_minder/features/tasks/presentation/views/widgets/rounded_text_field.dart';

class AvailableTaskCatsList extends StatelessWidget {
  const AvailableTaskCatsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: materialsDefaultColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(8),
          topLeft: Radius.circular(8),
        ),
      ),
      child: ListView.builder(
        padding: EdgeInsetsDirectional.only(
          start: 16.w,
          end: 8.w,
          top: 4.h,
          bottom: 8.h,
        ),
        itemCount: 5,
        itemBuilder: (context, index) {
          if (index == 4) {
            return AddTile(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => Dialog(
                    backgroundColor: materialsDefaultColor,
                    shape: roundedBorder8Radius,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Add Category',
                          style: style15Bold,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.95,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: const RoundedTextField(
                              hintText: 'Category Name',
                            ),
                          ),
                        )
                      ],
                    ),
                    // title: Text(
                    //   'Add Category',
                    //   style: style15Bold,
                    // ),
                    // content: SizedBox(
                    //   width: MediaQuery.sizeOf(context).width * 0.90,
                    //   child: const RoundedTextField(
                    //     hintText: 'Category Name',
                    //   ),
                    // ),
                    // actions: [
                    //   TextButton(
                    //     onPressed: () {},
                    //     child: const Text(
                    //       'Cancel',
                    //     ),
                    //   ),
                    //   TextButton(
                    //     onPressed: () {},
                    //     child: const Text(
                    //       'Ok',
                    //     ),
                    //   ),
                    // ],
                  ),
                );
              },
              hasCustomHorizontalPadding: true,
              actionText: 'Add Category',
              style: style14Regular.copyWith(
                color: secondaryColor,
              ),
            );
          }
          return const TaskCatRadioRow(
            icon: FontAwesomeIcons.bars,
            title: 'Work',
          );
        },
      ),
    );
  }
}
