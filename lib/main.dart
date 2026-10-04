import 'package:flutter/material.dart';
import 'package:hotel_app/core/routs.dart';
import 'package:hotel_app/features/splash/presentation/views/splash_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(url: 'SUPABASE_URL', publishableKey: 'SUPABASE_KEY');
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
