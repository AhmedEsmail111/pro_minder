import 'package:flutter/material.dart';

class TaskCheckBox extends StatelessWidget {
  const TaskCheckBox({
    super.key,
    required this.checkBoxColor,
  });
  final Color checkBoxColor;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      fillColor: const WidgetStatePropertyAll(Colors.transparent),
      onChanged: (value) {},
      value: false,
      side: BorderSide(
        color: checkBoxColor,
      ),
    );
  }
}
