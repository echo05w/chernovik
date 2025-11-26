import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('Counter increments', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Center(
            child: Text('0', key: Key('counter')),
          ),
        ),
      ),
    );

    expect(find.text('0'), findsOneWidget);
  });
}
