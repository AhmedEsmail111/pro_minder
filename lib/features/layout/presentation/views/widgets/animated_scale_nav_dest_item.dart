import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../manager/bottom_nav_controller/bottom_nav_cubit.dart';

class AnimatedScaleNavDestItem extends StatelessWidget {
  const AnimatedScaleNavDestItem({
    super.key,
    required this.bottomNavCubit,
    required this.icon,
    required this.index,
  });

  final BottomNavCubit bottomNavCubit;
  final IconData icon;
  final int index;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: bottomNavCubit.currentIndex == index ? bottomNavCubit.scale : 1,
      duration: const Duration(milliseconds: 200),
      child: Padding(
        padding: EdgeInsets.only(top: 20.h),
        child: Icon(
          icon,
        ),
      ),
    );
  }
}
