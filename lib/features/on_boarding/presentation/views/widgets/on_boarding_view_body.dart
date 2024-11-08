import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:locator/locator.dart';
import 'package:pro_minder/core/utils/my_consonants.dart';
import 'package:pro_minder/core/utils/router.dart';
import 'package:pro_minder/features/on_boarding/domain/entities/boarding_page_entity.dart';
import 'package:pro_minder/features/on_boarding/presentation/views/widgets/page_view_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/services/shared_preferences.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  var isLast = false;
  final List<BoardingPageEntity> onBoardingPagesData = [
    BoardingPageEntity(
      title: 'Welcome to ProMinder',
      description:
          'Boost Your Efficiency: Manage tasks, take notes, track habits, and stay organized effortlessly.',
      imageAsset: tasksManagementImage,
    ),
    BoardingPageEntity(
      title: 'Pomodoro Technique',
      description:
          'Enhance Focus: Use the Pomodoro technique to work in focused intervals.',
      secondLineDescription:
          'Timed Sessions: Work for 25 minutes, then take a 5-minute break',
      imageAsset: promodoImage,
    ),
    BoardingPageEntity(
      title: 'Habit Tracking',
      description:
          'Build Productive Habits: Track and maintain your daily habits.',
      secondLineDescription:
          'Stay Consistent: Visualize your progress and stay motivated.',
      imageAsset: habitTrackingImage,
    ),
    BoardingPageEntity(
      title: 'Eisenhower Matrix',
      description:
          'Prioritize Effectively: Use the Eisenhower Matrix to prioritize your tasks.',
      secondLineDescription:
          'Focus on What Matters: Separate urgent tasks from important ones',
      imageAsset: eisenhowerImage,
    ),
    BoardingPageEntity(
      title: 'Get Started',
      description: 'Ready to Transform Your Productivity? Let’s get started!',
      imageAsset: achieveDreamsImage,
    ),
  ];
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: PageView(
              onPageChanged: (index) {
                isLast = index == onBoardingPagesData.length - 1;
                setState(() {});
              },
              controller: _pageController,
              children: List.generate(
                5,
                (index) => PageViewWidget(
                  pageData: onBoardingPagesData[index],
                ),
              ),
            ),
          ),
          Row(
            children: [
              SmoothPageIndicator(
                effect: const ExpandingDotsEffect(
                  activeDotColor: secondaryColor,
                  dotColor: secondaryColor,
                  dotWidth: 10,
                  dotHeight: 10,
                  spacing: 5,
                  expansionFactor: 4,
                ),
                controller: _pageController,
                count: onBoardingPagesData.length,
              ),
              const Spacer(),
              FloatingActionButton(
                onPressed: () {
                  if (isLast) {
                    const Locator().get<CacheService>().saveData(
                          key: didShowOnBoarding,
                          value: true,
                        );
                    GoRouter.of(context)
                        .pushReplacement(AppRouter.layoutViewRoute);
                  } else {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.fastLinearToSlowEaseIn,
                    );
                  }
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                child: const Icon(
                  Icons.arrow_forward_ios_outlined,
                ),
              )
            ],
          ),
        ],
      ),
    ));
  }
}
