import 'package:flutter/material.dart';
import 'package:hotel_app/core/colors.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.ringColor, width: 2),
              ),
            ),
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.ringColor, width: 2),
              ),
            ),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.ringColor),
              child: Icon(Icons.hotel_rounded, color: AppColors.backgroundColor, size: 15),
            ),
          ],
        ),
        SizedBox(width: 8),
        Text(
          'Hotel App',
          style: TextStyle(
            color: AppColors.primaryFontColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
