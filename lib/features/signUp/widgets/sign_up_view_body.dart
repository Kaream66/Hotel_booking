import 'package:flutter/material.dart';
import 'package:hotel_app/core/colors.dart';
import 'package:hotel_app/core/routs.dart';
import 'package:hotel_app/core/widgets/custom_text_field.dart';
import 'package:hotel_app/core/widgets/login_button.dart';
import 'package:hotel_app/core/widgets/logo_widget.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  bool _isPasswordVisible = false;
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
                'Sign Up',
                style: TextStyle(
                  color: AppColors.primaryFontColor,
                  fontFamily: 'Playfair Display',
                  fontSize: 26,
                  fontWeight: FontWeight(600),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Enter to a Jiva Space Account to \n start discover a bunch of Live \n Spaces waiting for you.',
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Playfair Display', color: AppColors.primaryFontColor),
              ),
              SizedBox(height: 40),
              CustomTextField(
                hintText: 'example@gmail.com',
                label: 'Your Email',
                maxLines: 1,
                obscureText: false,
                suffixIcon: Icon(Icons.email),
              ),
              SizedBox(height: 30),
              CustomTextField(
                hintText: 'Enter your password',
                label: 'Password',
                maxLines: 1,
                obscureText: !_isPasswordVisible,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                  icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                ),
              ),
              SizedBox(height: 30),
              CustomTextField(
                hintText: ' password',
                label: 're-Enter your Password',
                maxLines: 1,
                obscureText: !_isPasswordVisible,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                  icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                ),
              ),
              Align(
                alignment: AlignmentGeometry.topStart,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.forgotPasswordRoute);
                  },
                  child: Text('Forgot Password', style: TextStyle(color: Color(0xffC1C1C1))),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(child: Divider(thickness: 1, color: AppColors.primaryFontColor)),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('OR', style: TextStyle(color: AppColors.primaryFontColor)),
                  ),
                  Expanded(child: Divider(thickness: 1, color: AppColors.primaryFontColor)),
                ],
              ),
              SizedBox(height: 20),
              LoginButton(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/google_image.png'),
                    SizedBox(width: 10),
                    Text('Login with Google', style: TextStyle(color: AppColors.primaryFontColor)),
                  ],
                ),
              ),
              SizedBox(height: 8),
              LoginButton(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/apple_image.png'),
                    SizedBox(width: 10),
                    Text('Login with Apple', style: TextStyle(color: AppColors.primaryFontColor)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
