import 'package:flutter/material.dart';

import '../colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title, required this.routeName});
  final String title;
  final String routeName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, routeName),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 18),
          decoration: BoxDecoration(
            color: const Color(0xffE87461),
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: Text(title, style: TextStyle(color: AppColors.backgroundColor, fontSize: 16)),
        ),
      ),
    );
  }
}
