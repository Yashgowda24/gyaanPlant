import 'package:flutter/material.dart';

void navigateWithFade(BuildContext context, Widget page) {
  Navigator.of(context).push(PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final tween = Tween(begin: 0.0, end: 1.0);
      final fadeAnimation = animation.drive(tween);

      return FadeTransition(opacity: fadeAnimation, child: child);
    },
    transitionDuration: const Duration(milliseconds: 400),
  ));
}
