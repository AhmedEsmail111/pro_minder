import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MoreOptionsAppBarIconButton extends StatelessWidget {
  const MoreOptionsAppBarIconButton({
    super.key,
    required this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(
        FontAwesomeIcons.ellipsisVertical,
      ),
    );
  }
}
