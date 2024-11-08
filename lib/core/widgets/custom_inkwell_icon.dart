import 'package:flutter/material.dart';

class CustomInkwellIcon extends StatelessWidget {
  const CustomInkwellIcon(
      {super.key,
      this.onPressed,
      required this.icon,
      this.iconSize,
      this.iconColor});
  final void Function()? onPressed;
  final IconData icon;
  final double? iconSize;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Icon(
        icon,
        size: iconSize,
        color: iconColor,
      ),
    );
  }
}
