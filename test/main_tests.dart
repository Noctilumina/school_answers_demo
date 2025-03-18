import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:school_answers_demo/main.dart';

void main() {
  testWidgets('App boots correctly without crashing', (WidgetTester tester) async {
    // arrange & act
    await tester.pumpWidget(const ProviderScope(child: MyApp()));


    // assert
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
