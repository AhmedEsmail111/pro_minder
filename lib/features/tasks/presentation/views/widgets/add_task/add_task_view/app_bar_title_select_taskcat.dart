import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pro_minder/features/tasks/presentation/views/widgets/add_task/add_task_view/move_to_cat_top_sheet/move_to_category_top_sheet.dart';

import '../../../../../../../core/utils/text_styles.dart';

class AppBarTitleSelectTaskCat extends StatelessWidget {
  const AppBarTitleSelectTaskCat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _showTopSheet(context);
      },
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 3.w),
        child: Row(
          children: [
            Text(
              'Work',
              style: style18,
            ),
            SizedBox(
              width: 2.w,
            ),
            Icon(
              FontAwesomeIcons.angleDown,
              size: 13.w,
              color: const Color.fromARGB(193, 255, 255, 255),
            ),
          ],
        ),
      ),
    );
  }
}

void _showTopSheet(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black54,
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (
      BuildContext buildContext,
      Animation animation,
      Animation secondaryAnimation,
    ) =>
        const MoveToCategoryTopSheet(),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, -1),
          end: const Offset(0, 0),
        ).animate(animation),
        child: child,
      );
    },
  );
}
