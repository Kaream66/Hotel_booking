import 'package:flutter/material.dart';
import 'package:hotel_app/features/onBoarding/presentation/views/onboarding_view.dart';
import 'package:hotel_app/features/splash/presentation/views/splash_view.dart';

class Routes {
  static const String onBoardingRoute = '/onBoarding';
  static const String splashRoute = '/splash';
}

class RouterGenerator {
  static Route<dynamic>? getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (context) => const OnboardingView());
      default:
        return null;
    }
  }
}
