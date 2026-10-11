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
        backgroundColor: AppColors.backgroundColor,
        foregroundColor: AppColors.primaryFontColor,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleSpacing: 20,
        title: const LogoWidget(),
        actions: [
          IconButton(
            onPressed: () {},
            tooltip: 'Notifications',
            icon: Icon(Icons.notifications_none_rounded, color: AppColors.ringColor),
          ),
        ],
      ),
      body: const HomeViewBody(),
    );
  }
}
