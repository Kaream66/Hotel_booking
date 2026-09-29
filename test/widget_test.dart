// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:hotel_app/features/onBoarding/presentation/views/onboarding_view.dart';
import 'package:hotel_app/main.dart';

void main() {
  testWidgets('Shows the hotel booking splash screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Hotels Booking'), findsOneWidget);
    expect(find.text('Find a stay that feels like yours.'), findsOneWidget);
    expect(find.byIcon(Icons.hotel_rounded), findsOneWidget);
  });

  testWidgets('Navigates to onboarding after the splash delay', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle();

    expect(find.byType(OnboardingView), findsOneWidget);
  });

  testWidgets('Swipes between the two onboarding pages', (WidgetTester tester) async {
    await tester.pumpWidget(const OnboardingView());

    expect(find.text('Live Space For You.'), findsOneWidget);
    expect(find.text('Find Your Next Stay.'), findsNothing);

    await tester.drag(find.byType(PageView), const Offset(-400, 0));
    await tester.pumpAndSettle();

    expect(find.text('Find Your Next Stay.'), findsOneWidget);
  });
}
