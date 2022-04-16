import 'package:flutter/material.dart';

/// Get the transition to a new page without any animation.
Route getPageTransition(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation1, animation2) => page,
    transitionDuration: Duration.zero,
    reverseTransitionDuration: Duration.zero,
  );
}