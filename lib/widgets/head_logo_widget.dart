import 'package:flutter/material.dart';

class HeadLogoWidget extends StatelessWidget {
  const HeadLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Center(
          child: Image.asset('assets/images/Mosque-01.png'),
        ),
        Text(
          'Islami',
          style: TextStyle(
              fontSize: 80,
              fontWeight: FontWeight.w400,
              fontFamily: 'Kamali',
              color: Theme.of(context).colorScheme.primary),
        )
      ],
    );
  }
}
