import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:school_answers_demo/l10n/app_localizations.dart';
import 'package:school_answers_demo/pages/question_page/question_page_container.dart';

void main() {
  testWidgets('QuestionPageContainer displays question and handles answer submission', (WidgetTester tester) async {
    // arrange
    await tester.pumpWidget(const ProviderScope(child: MaterialApp(
      locale: Locale('en'),
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
      home: QuestionPageContainer()
    )));

    // act
    await tester.pumpAndSettle();
    final initialFoundText = find.text("How much wood would a woodchuck chuck if a woodchuck could chuck wood?");
    await tester.enterText(find.byType(TextField), 'Dart');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();
    final updatedFoundText = find.text("Your answer: Dart");

    // assert
    expect(initialFoundText, findsOneWidget);
    expect(updatedFoundText, findsOneWidget);
  });
}
