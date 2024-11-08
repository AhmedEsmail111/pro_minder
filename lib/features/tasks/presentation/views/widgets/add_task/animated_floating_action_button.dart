import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pro_minder/core/utils/my_consonants.dart';

import '../../../../../../core/utils/colors.dart';
import '../../../manager/floating_action_button/floating_action_button_cubit.dart';
import '../../../manager/floating_action_button/floating_action_button_state.dart';
import 'add_task_sheet/add_task_bottom_sheet.dart';

class AnimatedFloatingActionButton extends StatefulWidget {
  const AnimatedFloatingActionButton({super.key});

  @override
  State<AnimatedFloatingActionButton> createState() =>
      _AnimatedFloatingActionButtonState();
}

class _AnimatedFloatingActionButtonState
    extends State<AnimatedFloatingActionButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: actionButtonAnimationDuration,
      reverseDuration: const Duration(milliseconds: 300),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, 2),
    ).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FloatingActionButtonCubit(),
      child: SlideTransition(
        position: _slideAnimation,
        child:
            BlocBuilder<FloatingActionButtonCubit, FloatingActionButtonStates>(
          builder: (context, state) {
            final cubit = FloatingActionButtonCubit.of(context);
            return cubit.isVisible
                ? FloatingActionButton(
                    onPressed: () {
                      _animationController.forward().then((_) {
                        cubit.hideButton();
                      });

                      _lazilyShowBottomSheet(cubit);
                    },
                    child: const Icon(FontAwesomeIcons.plus),
                  )
                : const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  void _lazilyShowBottomSheet(FloatingActionButtonCubit cubit) {
    Future.delayed(actionButtonAnimationDuration, () {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: bottomSheetBackground,
        shape: _bottomSheetShape(),
        builder: (context) => Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: const AddTaskBottomSheet(
            hasTaskCatButtonMenu: true,
          ),
        ),
      ).whenComplete(() {
        Future.delayed(const Duration(milliseconds: 200), () {
          cubit.showButton();
          _animationController.reverse();
        });
      });
    });
  }

  RoundedRectangleBorder _bottomSheetShape() {
    return const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(14),
        topRight: Radius.circular(14),
      ),
    );
  }
}
