import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pro_minder/core/entities/task_entity.dart';
import 'package:pro_minder/features/layout/presentation/views/layout_view.dart';
import 'package:pro_minder/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:pro_minder/features/tasks/presentation/views/add_task_view.dart';

import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const onBoardingViewRoute = '/onBoardingViewRoute';
  static const layoutViewRoute = '/layoutViewRoute';
  static const addTaskView = '/layoutViewRoute/addTaskView';
  static const fadingAnimationDuration = Duration(milliseconds: 400);
  static const slidAnimationDuration = Duration(milliseconds: 350);
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (ctx, state) => const SplashView(),
      ),
      GoRoute(
        path: onBoardingViewRoute,
        pageBuilder: (ctx, state) => CustomTransitionPage(
          transitionDuration: fadingAnimationDuration,
          reverseTransitionDuration: fadingAnimationDuration,
          key: state.pageKey,
          child: const OnBoardingView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        ),
      ),

      GoRoute(
        path: layoutViewRoute,
        pageBuilder: (ctx, state) => CustomTransitionPage(
          transitionDuration: fadingAnimationDuration,
          reverseTransitionDuration: fadingAnimationDuration,
          key: state.pageKey,
          child: const LayoutView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        ),
      ),
      GoRoute(
        path: addTaskView,
        pageBuilder: (ctx, state) => CustomTransitionPage(
          key: state.pageKey,
          transitionDuration: slidAnimationDuration,
          reverseTransitionDuration: const Duration(milliseconds: 200),
          child: AddTaskView(
            taskEntity: state.extra as TaskEntity,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        ),
      ),
      // GoRoute(
      //   path: kSearchView,
      //   pageBuilder: (ctx, state) => CustomTransitionPage(
      //     key: state.pageKey,
      //     transitionDuration: kSlidAnimationDuration,
      //     reverseTransitionDuration: kSlidAnimationDuration,
      //     child: const SearchView(),
      //     transitionsBuilder: (context, animation, secondaryAnimation, child) =>
      //         SlideTransition(
      //       position: Tween<Offset>(
      //         begin: const Offset(1.0, 0.0),
      //         end: Offset.zero,
      //       ).animate(animation),
      //       child: child,
      //     ),
      //   ),
      // ),
    ],
  );
}
