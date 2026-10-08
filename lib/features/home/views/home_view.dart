import 'package:flutter/material.dart';
import 'package:hotel_app/core/colors.dart';
import 'package:hotel_app/core/widgets/logo_widget.dart';
import 'package:hotel_app/features/home/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: LogoWidget(),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.notifications))],
      ),
      body: const HomeViewBody(),
    );
  }
}
