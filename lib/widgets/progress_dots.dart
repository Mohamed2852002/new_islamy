import 'package:flutter/material.dart';

class ProgressDots extends StatelessWidget {
  const ProgressDots({super.key, required this.currentIndex});
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        5,
        (index) => Container(
          margin: const EdgeInsets.only(right: 5),
          height: 15,
          width: index == currentIndex ? 30 : 15,
          decoration: BoxDecoration(
              color: index == currentIndex
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.tertiary,
              borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}
