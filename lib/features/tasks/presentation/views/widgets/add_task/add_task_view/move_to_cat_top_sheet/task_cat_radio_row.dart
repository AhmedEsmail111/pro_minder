import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pro_minder/core/utils/colors.dart';
import 'package:pro_minder/core/utils/text_styles.dart';

class TaskCatRadioRow extends StatelessWidget {
  const TaskCatRadioRow({super.key, required this.icon, required this.title});
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: primaryColor.withOpacity(0.1),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white70,
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(
            title,
            style: style14Regular,
          ),
          const Spacer(),
          Radio(
            fillColor: const WidgetStatePropertyAll(secondaryColor),
            value: 1,
            groupValue: 1,
            onChanged: (selectedValue) {},
          ),
        ],
      ),
    );
  }
}
