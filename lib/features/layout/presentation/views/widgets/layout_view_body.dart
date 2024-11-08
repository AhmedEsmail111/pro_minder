import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../eisenhower_matrix/presentation/views/eisenhower_matrix_view.dart';
import '../../../../habits/presentation/views/habits_view.dart';
import '../../../../notes/presentation/views/notes_view.dart';
import '../../../../promodo/presentation/views/promodo_view.dart';
import '../../../../tasks/presentation/views/tasks_view.dart';
import '../../manager/bottom_nav_controller/bottom_nav_cubit.dart';
import '../../manager/bottom_nav_controller/bottom_nav_state.dart';
import 'animated_scale_nav_dest_item.dart';

class LayoutViewBody extends StatefulWidget {
  const LayoutViewBody({super.key});

  @override
  State<LayoutViewBody> createState() => _LayoutViewBodyState();
}

class _LayoutViewBodyState extends State<LayoutViewBody> {
  @override
  void initState() {
    super.initState();
  }

  final List<Widget> _views = const [
    TasksView(),
    HabitsView(),
    EisenhowerMatrixView(),
    PromodoView(),
    NotesView(),
  ];
  @override
  Widget build(BuildContext context) {
    final bottomNavCubit = BlocProvider.of<BottomNavCubit>(context);
    return BlocBuilder<BottomNavCubit, BottomNavStates>(
      builder: (context, state) {
        return Scaffold(
          body: _views[bottomNavCubit.currentIndex],
          bottomNavigationBar: NavigationBar(
            onDestinationSelected: (selectedIndex) {
              bottomNavCubit.setCurrentIndex(selectedIndex);
              bottomNavCubit.changeScale();
            },
            selectedIndex: bottomNavCubit.currentIndex,
            destinations: [
              NavigationDestination(
                icon: AnimatedScaleNavDestItem(
                  bottomNavCubit: bottomNavCubit,
                  icon: FontAwesomeIcons.solidSquareCheck,
                  index: 0,
                ),
                label: '',
              ),
              NavigationDestination(
                icon: AnimatedScaleNavDestItem(
                  bottomNavCubit: bottomNavCubit,
                  icon: FontAwesomeIcons.solidCalendar,
                  index: 1,
                ),
                label: '',
              ),
              NavigationDestination(
                icon: AnimatedScaleNavDestItem(
                  index: 2,
                  bottomNavCubit: bottomNavCubit,
                  icon: Icons.dashboard,
                ),
                label: '',
              ),
              NavigationDestination(
                icon: AnimatedScaleNavDestItem(
                  index: 3,
                  bottomNavCubit: bottomNavCubit,
                  icon: FontAwesomeIcons.circleDot,
                ),
                label: '',
              ),
              NavigationDestination(
                icon: AnimatedScaleNavDestItem(
                  index: 4,
                  bottomNavCubit: bottomNavCubit,
                  icon: FontAwesomeIcons.solidNoteSticky,
                ),
                label: '',
              ),
            ],
          ),
        );
      },
    );
  }
}
