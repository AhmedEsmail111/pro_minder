import 'package:flutter/material.dart';
import 'package:pro_minder/core/utils/text_styles.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnimation,
            child: Text(
              'Your Time worth your life...',
              textAlign: TextAlign.center,
              style: style20,
            ),
          );
        });
  }
}
