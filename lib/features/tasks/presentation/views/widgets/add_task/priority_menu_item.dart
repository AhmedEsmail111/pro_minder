import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../core/utils/text_styles.dart';

class PriorityMenuItem extends StatelessWidget {
  const PriorityMenuItem({
    super.key,
    required this.color,
    required this.title,
  });
  final Color color;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 6.w),
      child: Row(
        children: [
          Icon(
            FontAwesomeIcons.solidFlag,
            color: color,
            size: 16.w,
          ),
          SizedBox(
            width: 16.w,
          ),
          Text(
            title,
            style: style13,
          ),
        ],
      ),
    );
  }
}
