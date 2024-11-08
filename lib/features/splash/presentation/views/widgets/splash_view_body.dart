import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:locator/locator.dart';
import 'package:pro_minder/core/utils/router.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/my_consonants.dart';
import '../../../../../core/utils/services/shared_preferences.dart';
import 'sliding_text.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<Offset> slidingAnimation;
  @override
  void initState() {
    super.initState();

    _initSlidingAnimation();

    _navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();

    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.1,
          ),
          Image.asset(
            productivityLogo,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 8,
          ),
          SlidingText(
            slidingAnimation: slidingAnimation,
          ),
        ],
      ),
    );
  }

  void _initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 4), end: Offset.zero)
            .animate(animationController);

    animationController.forward();
  }

  void _navigateToHome() {
    final locator = const Locator().get<CacheService>();
    Future.delayed(const Duration(milliseconds: 1800), () {
      final bool? didShowOnBoardingBefore =
          locator.getData(key: didShowOnBoarding) ?? false;
      if (didShowOnBoardingBefore == true) {
        GoRouter.of(context).pushReplacement(
          AppRouter.layoutViewRoute,
        );
        return;
      }
      GoRouter.of(context).pushReplacement(
        AppRouter.onBoardingViewRoute,
      );
    });
  }
}
