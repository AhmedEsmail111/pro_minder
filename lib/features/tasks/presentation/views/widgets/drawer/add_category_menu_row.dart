import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pro_minder/core/utils/colors.dart';
import 'package:pro_minder/core/utils/my_consonants.dart';
import 'package:pro_minder/core/utils/text_styles.dart';

class AddCategoryMenuRow extends StatelessWidget {
  const AddCategoryMenuRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: drawerBackgroundColor,
      child: SizedBox(
        height: defaultListTileHeight,
        child: Row(
          children: [
            Flexible(
              flex: 4,
              child: ListTile(
                onTap: () {},
                dense: true,
                leading: const Icon(
                  FontAwesomeIcons.plus,
                ),
                title: Text(
                  'Add Category',
                  style: style15Bold,
                ),
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
            Flexible(
              flex: 1,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.sliders,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
