import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:school_answers_demo/l10n/app_localizations.dart';
import 'package:school_answers_demo/widgets/answer_display.dart';

void main() {
    testWidgets('AnswerDisplay shows the correct text', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('en'),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: const AnswerDisplay(answer: 'Flutter'),
      ),
    );

    expect(find.text('Your answer: Flutter'), findsOneWidget);
  });
}
