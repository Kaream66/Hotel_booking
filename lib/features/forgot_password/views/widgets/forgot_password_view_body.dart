import 'package:flutter/material.dart';
import 'package:hotel_app/core/colors.dart';
import 'package:hotel_app/core/widgets/custom_button.dart';
import 'package:hotel_app/core/widgets/custom_text_field.dart';
import 'package:hotel_app/core/widgets/login_button.dart';
import 'package:hotel_app/core/widgets/logo_widget.dart';

class ForgotPasswordViewBody extends StatelessWidget {
  const ForgotPasswordViewBody({super.key});

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
                'Forgot Password',
                style: TextStyle(
                  color: AppColors.primaryFontColor,
                  fontFamily: 'Playfair Display',
                  fontSize: 26,
                  fontWeight: FontWeight(600),
                ),
              ),
              SizedBox(height: 10),
              Icon(Icons.mail_lock, size: 110, color: AppColors.ringColor),
              Text(
                'We have sent an email to\n example@gmail.com with instructions to\nreset your password.',
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Playfair Display', color: AppColors.primaryFontColor),
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: CustomTextField(
                  hintText: 'example@gmail.com',
                  label: 'Email',
                  maxLines: 1,
                  obscureText: false,
                  suffixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(height: 15),
              //if the code that the user write it right routename is login ;
              CustomButton(title: 'Send', routeName: ''),
            ],
          ),
        ),
      ),
    );
  }
}
