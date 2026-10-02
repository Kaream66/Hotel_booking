import 'package:flutter/material.dart';
import 'package:hotel_app/core/colors.dart';
import 'package:hotel_app/core/widgets/custom_text_field.dart';
import 'package:hotel_app/core/widgets/logo_widget.dart';

class CertificationCodeView extends StatelessWidget {
  const CertificationCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LogoWidget(),
              SizedBox(height: 10),
              Text(
                'Verification Code',
                style: TextStyle(
                  color: AppColors.primaryFontColor,
                  fontFamily: 'Playfair Display',
                  fontSize: 26,
                  fontWeight: FontWeight(600),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Please enter the verification code sent to your email.',
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Playfair Display', color: AppColors.primaryFontColor),
              ),
              SizedBox(height: 40),
              CustomTextField(
                hintText: 'Enter verification code',
                label: 'Verification Code',
                maxLines: 1,
                obscureText: false,
                suffixIcon: Icon(Icons.lock),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Handle verification code submission
                },
                child: Text('Verify'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
