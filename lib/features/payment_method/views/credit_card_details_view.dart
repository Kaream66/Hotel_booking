import 'package:flutter/material.dart';
import 'package:hotel_app/core/colors.dart';
import 'package:hotel_app/core/widgets/custom_text_field.dart';
import 'package:hotel_app/core/widgets/logo_widget.dart';

class CreditCardDetailsView extends StatelessWidget {
  const CreditCardDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_sharp, color: AppColors.ringColor),
        ),
        title: LogoWidget(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(16),
          child: Column(
            children: [
              CustomTextField(
                hintText: 'Enter Your Full Name',
                label: 'ID Numbers',
                maxLines: 1,
                obscureText: false,
              ),
              SizedBox(height: 20),
              CustomTextField(
                hintText: 'Enter Your cvv',
                label: 'CVV',
                maxLines: 1,
                obscureText: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
