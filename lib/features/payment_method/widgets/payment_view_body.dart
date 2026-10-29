import 'package:flutter/material.dart';
import 'package:hotel_app/core/colors.dart';
import 'package:hotel_app/core/routs.dart';
import 'package:hotel_app/core/widgets/custom_text_field.dart';

class PaymentViewBody extends StatefulWidget {
  const PaymentViewBody({super.key});

  @override
  State<PaymentViewBody> createState() => _PaymentViewBodyState();
}

class _PaymentViewBodyState extends State<PaymentViewBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextField(
              hintText: 'Enter Your Full Name',
              label: 'Full Name',
              maxLines: 1,
              obscureText: false,
            ),
            SizedBox(height: 20),
            CustomTextField(
              hintText: 'Your Phone Number',
              label: 'Active Phone Number',
              maxLines: 1,
              obscureText: false,
            ),
            SizedBox(height: 20),
            CustomTextField(
              hintText: 'How many Members',
              label: 'Members',
              maxLines: 1,
              obscureText: false,
            ),
            SizedBox(height: 20),
            CustomTextField(
              hintText: 'ID Card Numbers',
              label: 'ID Card Numbers',
              maxLines: 1,
              obscureText: false,
            ),
            SizedBox(height: 30),
            Center(
              child: SizedBox(
                width: 180,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.creditCardDetailesView);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.ringColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text('Reserve'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
