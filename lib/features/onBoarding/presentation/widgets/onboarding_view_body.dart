import 'package:flutter/material.dart';
import 'package:hotel_app/core/colors.dart';
import 'package:hotel_app/core/routs.dart';
import 'package:hotel_app/core/widgets/custom_button.dart';
import 'package:hotel_app/core/widgets/logo_widget.dart';
import 'package:hotel_app/features/onBoarding/presentation/widgets/page_view_item.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  final PageController pageController = PageController();
  int currentPage = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 24),
            const LogoWidget(),
            const SizedBox(height: 12),
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: (index) => setState(() => currentPage = index),
                children: const [
                  PageViewItem(
                    image: 'assets/images/onboarding_image 1.png',
                    title: 'Live Space For You.',
                    subTitle: 'Discover live spaces that suit you best. Stay with ease, live relaxed, and search with Jiva.',
                  ),
                  PageViewItem(
                    image: 'assets/images/onboarding_image 2.png',
                    title: 'Find Your Next Stay.',
                    subTitle: 'Explore welcoming hotels and find a stay that feels like yours.',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  2,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: currentPage == index ? 22 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: currentPage == index
                          ? AppColors.ringColor
                          : AppColors.primaryFontColor.withAlpha(100),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            CustomButton(title: 'Login', routeName: Routes.loginRoute),
            SizedBox(height: 10),
            CustomButton(title: 'SignUp', routeName: Routes.signUpRoute),
          ],
        ),
      ),
    );
  }
}
