import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../core/utils/assets.dart';
import '../../../../../../core/utils/text_styles.dart';
import '../../../../../../core/widgets/custom_inkwell_icon.dart';

class DrawerRowHeader extends StatelessWidget {
  const DrawerRowHeader({
    super.key,
    required this.userEmail,
  });

  final String userEmail;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          radius: 22,
          backgroundImage: AssetImage(profileImage),
        ),
        const SizedBox(
          width: 8,
        ),
        Flexible(
          child: Text(
            userEmail,
            style: style18ExtraBold,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ),
        CustomInkwellIcon(
          icon: FontAwesomeIcons.magnifyingGlass,
          onPressed: () {},
        ),
        const SizedBox(
          width: 10,
        ),
        CustomInkwellIcon(
          icon: FontAwesomeIcons.bell,
          onPressed: () {},
        ),
        const SizedBox(
          width: 10,
        ),
        CustomInkwellIcon(
          icon: FontAwesomeIcons.gear,
          onPressed: () {},
        ),
      ],
    );
  }
}
