import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:locator/locator.dart';
import 'package:pro_minder/core/utils/text_styles.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/my_consonants.dart';
import '../../../../core/utils/router.dart';
import '../../../../core/utils/services/shared_preferences.dart';
import 'widgets/on_boarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        actions: [
          TextButton(
            onPressed: () {
              const Locator()
                  .get<CacheService>()
                  .saveData(key: didShowOnBoarding, value: true);
              GoRouter.of(context).pushReplacement(AppRouter.layoutViewRoute);
            },
            child: Text(
              'SKIP',
              style: style16.copyWith(color: secondaryColor),
            ),
          )
        ],
      ),
      body: const OnBoardingViewBody(),
    );
  }
}
