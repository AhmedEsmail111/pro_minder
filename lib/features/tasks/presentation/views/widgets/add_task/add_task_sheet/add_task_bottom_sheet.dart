import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:pro_minder/features/tasks/presentation/manager/add_task_bottomsheet/add_task_bottomsheet_cubit.dart';

import '../../../../../../../core/utils/colors.dart';
import '../../../../../../../core/utils/router.dart';
import '../../../../../../../core/utils/text_styles.dart';
import '../../../../../../../debugging.dart';
import '../add_task_text_field.dart';
import 'additional_info_bottom_sheet_row.dart';
import 'submit_task_button.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({
    super.key,
    required this.hasTaskCatButtonMenu,
  });
  final bool hasTaskCatButtonMenu;
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  late final TextEditingController _titleEditingController;
  late final TextEditingController _descEditingController;
  late final GlobalKey<FormState> _formKey;
  @override
  void initState() {
    super.initState();
    _titleEditingController = TextEditingController();
    _descEditingController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    _titleEditingController.dispose();
    _descEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTaskBottomSheetCubit(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 3,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsetsDirectional.only(
                      start: 16,
                      end: 8,
                      top: 8,
                      bottom: 0,
                    ),
                    height: 35.h,
                    child: AddTaskTextField(
                      controller: _titleEditingController,
                      autoFocus: true,
                      textInputAction: TextInputAction.done,
                      hintText: 'What would you like to do?',
                      hintStyle: style13.copyWith(
                        color: greyWhite,
                      ),
                      textStyle: style15Bold,
                      onValidate: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'please enter a task title';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _titleEditingController.text = value!;
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsetsDirectional.only(
                      start: 16,
                      end: 8,
                      bottom: 0,
                    ),
                    height: 35.h,
                    child: AddTaskTextField(
                      hintText: 'Description',
                      controller: _descEditingController,
                      hintStyle: style12.copyWith(
                        color: greyWhite,
                      ),
                      textStyle: style12,
                      onSaved: (value) {
                        _descEditingController.text = value ?? '';
                      },
                    ),
                  ),
                  AdditionalInfoRow(
                    hasTaskCatButtonMenu: widget.hasTaskCatButtonMenu,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 105.h,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  iconSize: 16.w,
                  icon: const Icon(
                    FontAwesomeIcons.upRightAndDownLeftFromCenter,
                    color: smallIconsColor,
                  ),
                  onPressed: () {
                    GoRouter.of(context).pop();
                    Future.delayed(
                      (const Duration(milliseconds: 150)),
                      () {
                        GoRouter.of(context).push(
                          AppRouter.addTaskView,
                          extra: tasks.first,
                        );
                      },
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 16),
                  child: SubmitTaskButton(
                    onTap: () {},
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
