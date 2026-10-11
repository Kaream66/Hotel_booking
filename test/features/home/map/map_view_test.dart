import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_app/core/routs.dart';
import 'package:hotel_app/features/home/map/map_view.dart';
import 'package:hotel_app/features/home/widgets/search_card_widget.dart';

void main() {
  testWidgets('opens the map when the destination location icon is tapped', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: const Scaffold(body: SearchCard()),
        onGenerateRoute: RouterGenerator.getRoutes,
      ),
    );

    await tester.tap(find.byIcon(Icons.location_on_outlined));
    await tester.pump();

    expect(find.text('Explore map'), findsOneWidget);
  });
}
