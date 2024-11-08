import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pro_minder/core/utils/colors.dart';

class AddTile extends StatelessWidget {
  const AddTile({
    super.key,
    required this.actionText,
    required this.style,
    this.onTap,
    this.hasCustomHorizontalPadding = false,
  });
  final String actionText;
  final TextStyle style;
  final void Function()? onTap;
  final bool hasCustomHorizontalPadding;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      splashColor: primaryColor.withOpacity(0.1),
      contentPadding: hasCustomHorizontalPadding
          ? const EdgeInsets.symmetric(horizontal: 0)
          : null,
      leading: const Icon(
        FontAwesomeIcons.plus,
        color: secondaryColor,
      ),
      title: Text(
        actionText,
        style: style,
      ),
    );
  }
}
