import 'package:flutter/material.dart';
import 'package:hotel_app/features/forgot_password/forgot_password_view.dart';
import 'package:hotel_app/features/login/views/login_view.dart';
import 'package:hotel_app/features/onBoarding/presentation/views/onboarding_view.dart';
import 'package:hotel_app/features/signUp/views/signp_view.dart';
import 'package:hotel_app/features/splash/presentation/views/splash_view.dart';

class Routes {
  static const String onBoardingRoute = '/onBoarding';
  static const String splashRoute = '/splash';
  static const String loginRoute = '/login';
  static const String signUpRoute = '/signUp';
  static const String forgotPasswordRoute = '/forgotPassword';
}

class RouterGenerator {
  static Route<dynamic>? getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (context) => const OnboardingView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (context) => const LoginView());
      case Routes.signUpRoute:
        return MaterialPageRoute(builder: (context) => const SignpView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (context) => const ForgotPasswordView());

      default:
        return null;
    }
  }
}
