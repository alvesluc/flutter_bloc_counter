import 'package:flutter/material.dart';
import 'package:flutter_counter/counter/counter.dart';
import 'package:flutter_counter/counter/view/counter_view.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('renders CounterView', (tester) async {
    await tester.pumpWidget(MaterialApp(home: CounterPage(),));
    expect(find.byType(CounterView), findsOneWidget);
  });
}