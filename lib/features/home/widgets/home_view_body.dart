import 'package:flutter/material.dart';
import 'package:hotel_app/core/widgets/custom_search_field.dart';
import 'package:hotel_app/features/home/widgets/home_image_card.dart';
import 'package:hotel_app/features/home/widgets/popular_hotel_item.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final PageController _pageController = PageController(viewportFraction: 0.9);
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            CustomSearchField(
              hintText: 'Search here for places',
              maxLines: 2,
              suffixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            ),
            SizedBox(height: 30),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      SizedBox(
                        height: 190,
                        child: Stack(
                          children: [
                            PageView(
                              controller: _pageController,
                              onPageChanged: (page) => setState(() => _currentPage = page),
                              children: const [
                                HomeImageCard(image: 'assets/images/card_photo2.png'),
                                HomeImageCard(image: 'assets/images/card_photo3.png'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          2,
                          (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: 9,
                            height: 9,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentPage == index
                                  ? const Color(0xffE87461)
                                  : Colors.white38,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Align(
                        alignment: AlignmentGeometry.centerStart,
                        child: Text(
                          'Popular Spaces',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      PopularHotelItem(),
                      PopularHotelItem(),

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
