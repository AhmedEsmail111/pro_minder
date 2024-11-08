import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pro_minder/core/utils/my_consonants.dart';

import '../../../../../../../core/utils/colors.dart';
import '../../../../../../../core/utils/text_styles.dart';

class MoreOptionsBottomSheet extends StatelessWidget {
  const MoreOptionsBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: bottomSheetBackground,
      shape: roundedBorder8Radius,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(
              top: 12.h,
              bottom: 8.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white38,
            ),
            height: 4.h,
            width: 32.w,
          ),
          ListTile(
            onTap: () {},
            splashColor: bottomSheetBackground,
            leading: const Icon(
              FontAwesomeIcons.rectangleList,
              color: smallIconsColor,
            ),
            title: Text(
              'Add Subtask',
              style: style15Bold,
            ),
          ),
          ListTile(
            onTap: () {},
            splashColor: bottomSheetBackground,
            leading: const Icon(
              FontAwesomeIcons.trashCan,
              color: Colors.red,
            ),
            title: Text(
              'Delete',
              style: style15Bold,
            ),
          ),
          SizedBox(
            height: 16.h,
          )
        ],
      ),
    );
  }
}
