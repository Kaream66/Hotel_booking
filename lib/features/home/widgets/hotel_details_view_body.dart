import 'package:flutter/material.dart';
import 'package:hotel_app/core/colors.dart';
import 'package:hotel_app/core/routs.dart';

class HotelDetailsViewBody extends StatefulWidget {
  const HotelDetailsViewBody({super.key});

  @override
  State<HotelDetailsViewBody> createState() => _HotelDetailsViewBodyState();
}

class _HotelDetailsViewBodyState extends State<HotelDetailsViewBody> {
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
          icon: Icon(Icons.arrow_back_ios_new),
          color: AppColors.ringColor,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz), color: AppColors.ringColor),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Image.asset('assets/images/card_photo2.png', fit: BoxFit.cover),
              ),
              SizedBox(height: 20),
              Text(
                textAlign: TextAlign.start,
                'Hotel Name',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryFontColor,
                ),
              ),
              SizedBox(height: 20),
              Text(
                textAlign: TextAlign.start,
                'Room Details',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryFontColor,
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Icon(Icons.star, color: AppColors.ringColor),
                  ),
                  Text(
                    'Rate Number',
                    style: TextStyle(color: AppColors.primaryFontColor, fontSize: 18),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Hotel Location',
                style: TextStyle(color: AppColors.primaryFontColor, fontSize: 18),
              ),
              SizedBox(height: 20),
              Divider(color: AppColors.ringColor, thickness: 2),
              SizedBox(height: 20),
              Text(
                'About Hotel',
                style: TextStyle(color: AppColors.primaryFontColor, fontSize: 24),
              ),
              SizedBox(height: 20),
              Text(
                'Hotel Description',
                style: TextStyle(color: AppColors.primaryFontColor, fontSize: 18),
              ),
              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.ringColor,
                        borderRadius: BorderRadius.circular(12),
                      ),

                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsetsGeometry.all(12),
                            child: Text(
                              'Reservation Price',
                              style: TextStyle(color: AppColors.backgroundColor, fontSize: 18),
                            ),
                          ),
                          Icon(Icons.monetization_on, color: Colors.black),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(AppColors.ringColor),
                    ),
                    onPressed: () async {
                      final DateTime? date = await showDatePicker(
                        barrierColor: AppColors.ringColor,
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2035),
                      );
                      if (date != null) {
                        // ignore: use_build_context_synchronously
                        Navigator.pushReplacementNamed(context, Routes.paymentViewRoute);
                      }
                    },
                    child: Text(
                      'Book Now',
                      style: TextStyle(color: AppColors.backgroundColor, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
