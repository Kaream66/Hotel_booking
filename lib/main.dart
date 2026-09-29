import 'package:flutter/material.dart';
import 'package:hotel_app/core/routs.dart';
import 'package:hotel_app/features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
      onGenerateRoute: RouterGenerator.getRoutes,
    );
  }
}
