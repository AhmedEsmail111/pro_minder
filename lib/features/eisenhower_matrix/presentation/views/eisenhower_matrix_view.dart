import 'package:flutter/material.dart';

import 'widgets/eisenhower_matrix_view_body.dart';

class EisenhowerMatrixView extends StatelessWidget {
  const EisenhowerMatrixView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: EisenhowerMatrixViewBody(),
    );
  }
}
