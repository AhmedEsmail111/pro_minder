import 'package:flutter/material.dart';

import 'widgets/promodo_view_body.dart';

class PromodoView extends StatelessWidget {
  const PromodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PromodoViewBody(),
    );
  }
}
