import 'package:flutter/material.dart';
import 'package:hotel_app/core/routs.dart';
import 'package:hotel_app/features/home/views/home_view.dart';
import 'package:hotel_app/features/splash/presentation/views/splash_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://epgajwapwathpdcuycqu.supabase.co/rest/v1/',
    publishableKey: 'sb_publishable_iRlT1stvBfxFyITt-3XOxg_drUdH7sD',
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
      onGenerateRoute: RouterGenerator.getRoutes,
    );
  }
}
