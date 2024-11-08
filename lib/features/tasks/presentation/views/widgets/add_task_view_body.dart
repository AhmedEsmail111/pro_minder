import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:pro_minder/features/tasks/presentation/views/widgets/add_task/add_task_view/sub_tasks_column.dart';

import '../../../../../core/entities/task_entity.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/text_styles.dart';
import 'add_task/add_task_text_field.dart';
import 'add_task/add_task_view/time_and_priority_row.dart';

class AddTaskViewBody extends StatefulWidget {
  const AddTaskViewBody({super.key, required this.taskEntity});
  final TaskEntity taskEntity;

  @override
  State<AddTaskViewBody> createState() => _AddTaskViewBodyState();
}

class _AddTaskViewBodyState extends State<AddTaskViewBody> {
  late final TextEditingController _titleEditingController;
  late final TextEditingController _descEditingController;

  @override
  void initState() {
    super.initState();
    _titleEditingController = TextEditingController();
    _descEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final formatter = DateFormat('EE, MMM d');
    final time = formatter.format(widget.taskEntity.date!);
    return SingleChildScrollView(
      padding: EdgeInsetsDirectional.only(
          start: 16.w, bottom: 16.w, end: 16.w, top: 12.h),
      child: Column(
        children: [
          TimeAndPriorityRow(
            time: time,
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            height: 40.h,
            child: AddTaskTextField(
              controller: _titleEditingController,
              autoFocus: true,
              textInputAction: TextInputAction.done,
              maxLines: 2,
              hintText: 'What would you like to do?',
              hintStyle: style18ExtraBold.copyWith(
                color: greyWhite,
              ),
              textStyle: style18ExtraBold,
            ),
          ),
          AddTaskTextField(
            controller: _descEditingController,
            textInputAction: TextInputAction.newline,
            hintText: 'Description',
            maxLines: 15,
            hintStyle: style12.copyWith(
              color: greyWhite,
            ),
            textStyle: style13,
          ),
          SizedBox(
            height: 40.h,
          ),
          if (widget.taskEntity.subTasks.isNotEmpty)
            SubTasksColumnCard(
              subTasks: widget.taskEntity.subTasks,
            ),
        ],
      ),
    );
  }
}
