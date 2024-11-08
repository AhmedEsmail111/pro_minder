import 'package:flutter/material.dart';

import 'widgets/habits_view_body.dart';

class HabitsView extends StatelessWidget {
  const HabitsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HabitsViewBody(),
    );
  }
}
