import 'package:flutter/material.dart';
import 'package:hotel_app/core/colors.dart';

class PopularHotelItem extends StatelessWidget {
  const PopularHotelItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Color(0xff2A2A28),
          border: Border.all(color: AppColors.ringColor),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 250,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(8),
                    child: Image.asset('assets/images/card_photo2.png', fit: BoxFit.cover),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hotel Name ',
                        style: TextStyle(color: AppColors.ringColor, fontSize: 15),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.star, color: AppColors.ringColor),
                          ),
                          Text(
                            'Hotel Rate ',
                            style: TextStyle(color: AppColors.ringColor, fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hotel Name ',
                        style: TextStyle(color: AppColors.ringColor, fontSize: 15),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.star, color: AppColors.ringColor),
                          ),
                          Text(
                            'Hotel Rate ',
                            style: TextStyle(color: AppColors.ringColor, fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
