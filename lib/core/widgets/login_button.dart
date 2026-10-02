import 'package:flutter/material.dart';
import 'package:hotel_app/core/colors.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.title, required this.routeName});
  final Widget title;
  final String routeName;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, routeName),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.ringColor, width: 2),
        ),
        alignment: Alignment.center,
        child: title,
      ),
    );
  }
}
