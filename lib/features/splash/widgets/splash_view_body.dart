import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hotel_app/core/routs.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  void _startDelay() {
    _timer = Timer(Duration(seconds: 2), _goNext);
  }

  void _goNext() {
    Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
  }

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color(0xff222220);
    const ringColor = Color(0xffE87461);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 190,
                  height: 190,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: ringColor.withValues(alpha: 0.35), width: 2),
                  ),
                ),
                Container(
                  width: 154,
                  height: 154,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: ringColor.withValues(alpha: 0.6), width: 2),
                  ),
                ),
                Container(
                  width: 118,
                  height: 118,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: ringColor),
                  child: const Icon(Icons.hotel_rounded, color: backgroundColor, size: 54),
                ),
              ],
            ),
            const SizedBox(height: 28),
            Text(
              'Hotels Booking',
              style: const TextStyle(
                color: Color(0xffE4D8C3),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Find a stay that feels like yours.',
              style: TextStyle(color: Color(0xffB8B0A4), fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
