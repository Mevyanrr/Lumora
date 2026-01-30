import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lumora/features/onBoarding/presentation/pages/onboarding0.dart';
import 'onboarding1.dart';
import 'onboarding2.dart';
import 'onboarding3.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  Timer? _timer;
  int _currentIndex = 0;

  final _pages = const [
    Onboarding0(),
    Onboarding1(),
    Onboarding2(),
    Onboarding3(),
  ];

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
  _timer = Timer.periodic(
    const Duration(seconds: 2),
    (timer) {
      if (_currentIndex < _pages.length - 1) {
        setState(() {
          _currentIndex++;
        });
      } else {
        timer.cancel();
      }
    },
  );
}


  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 1000),
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        child: SizedBox(
          key: ValueKey(_currentIndex),
          child: _pages[_currentIndex],
        ),
      ),
    );
  }
}
