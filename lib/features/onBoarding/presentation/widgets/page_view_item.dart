import 'package:flutter/material.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({super.key, required this.image, required this.title, required this.subTitle});
  final String image;
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(image, fit: BoxFit.fill),
        SizedBox(height: 20),
        Text(
          title,
          style: TextStyle(
            color: Color(0xffE4D8C3),
            fontFamily: 'Playfair Display',
            fontSize: 34,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),

        Text(
          subTitle,
          style: TextStyle(color: Color(0xffC1C1C1), fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
