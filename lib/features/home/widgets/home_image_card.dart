import 'package:flutter/material.dart';

class HomeImageCard extends StatelessWidget {
  const HomeImageCard({super.key, required this.image});


  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(image, fit: BoxFit.cover),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.centerRight,
                  colors: [Colors.transparent, Color(0x99000000)],
                  stops: [0.35, 1],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
