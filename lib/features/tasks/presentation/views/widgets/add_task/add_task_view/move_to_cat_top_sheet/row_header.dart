import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../core/utils/text_styles.dart';

class RowHeader extends StatelessWidget {
  const RowHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(
            FontAwesomeIcons.xmark,
          ),
        ),
        Text(
          'Move to category',
          style: style18ExtraBold,
        )
      ],
    );
  }
}
