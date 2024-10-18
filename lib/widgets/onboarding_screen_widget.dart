import 'package:flutter/material.dart';

class OnboardingScreenWidget extends StatelessWidget {
  const OnboardingScreenWidget(
      {super.key,
      required this.image,
      required this.label,
      required this.info});
  final String image;
  final String label;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          SizedBox(
            height: 300,
            child: Image.asset(image),
          ),
          const SizedBox(height: 30),
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          const SizedBox(height: 25),
          Text(
            info,
            textAlign: TextAlign.center,
            style:
                Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
