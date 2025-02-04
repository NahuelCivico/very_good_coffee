import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:very_good_coffee/core/utils/very_good_colors.dart';
import 'package:very_good_coffee/features/coffee/presentation/widgets/very_good_rate.dart';

void main() {
  testWidgets('renders VeryGoodRate correctly', (tester) async {
    const rate = '4.5';

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Stack(
            children: [
              VeryGoodRate(rate: rate),
            ],
          ),
        ),
      ),
    );

    expect(find.byType(VeryGoodRate), findsOneWidget);
    expect(find.byIcon(Icons.star), findsOneWidget);
    expect(find.text(rate), findsOneWidget);
  });

  testWidgets('VeryGoodRate has correct styling', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Stack(
            children: [
              VeryGoodRate(rate: '4.5'),
            ],
          ),
        ),
      ),
    );

    final containerFinder = find.byWidgetPredicate(
      (widget) =>
          widget is Container &&
          widget.decoration is BoxDecoration &&
          (widget.decoration! as BoxDecoration).borderRadius ==
              BorderRadius.circular(20) &&
          (widget.decoration! as BoxDecoration).border?.top.color ==
              VeryGoodColors.white &&
          (widget.decoration! as BoxDecoration).color ==
              VeryGoodColors.black.withAlpha(100),
    );

    expect(containerFinder, findsOneWidget);
  });

  testWidgets('VeryGoodRate displays different rating values', (tester) async {
    const testRates = ['5.0', '3.8', '2.0'];

    for (final rate in testRates) {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Stack(
              children: [
                VeryGoodRate(rate: rate),
              ],
            ),
          ),
        ),
      );

      expect(find.text(rate), findsOneWidget);
    }
  });
}
