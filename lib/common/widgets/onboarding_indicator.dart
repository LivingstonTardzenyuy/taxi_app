import 'package:flutter/material.dart';
import '../../theme/colors.dart';

class OnboardingIndicator extends StatelessWidget {
  final int itemCount;
  final int currentIndex;
  final double size;

  const OnboardingIndicator({
    Key? key,
    required this.itemCount,
    required this.currentIndex,
    this.size = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(itemCount, (index) {
        final bool active = index == currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 6),
          width: active ? size * 2 : size,
          height: size,
          decoration: BoxDecoration(
            color: active ? AppColors.primaryColor : AppColors.primaryColor.withOpacity(0.25),
            borderRadius: BorderRadius.circular(8),
          ),
        );
      }),
    );
  }
}
