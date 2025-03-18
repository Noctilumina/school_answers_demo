import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_answers_demo/l10n/app_localizations.dart';
import 'package:school_answers_demo/pages/question_page/question_page_presentation.dart';

void main() {
  testWidgets('QuestionPage renders question and input field', (WidgetTester tester) async {
    // arrange
    await tester.pumpWidget(ProviderScope(child: MaterialApp(
      locale: const Locale('en'),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
      home: QuestionPagePresentation(
        question: 'Test question',
        onSubmitPressed: () => {},
        controller: TextEditingController(),
        answer: '',
      )
    )));
    // act
    // assert
    expect(find.text('Test question'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
  });
}
