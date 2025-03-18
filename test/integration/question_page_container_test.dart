import 'dart:async'; 
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:school_answers_demo/l10n/app_localizations.dart';
import 'package:school_answers_demo/pages/question_page/question_page_container.dart';
import 'package:school_answers_demo/providers/answer_provider.dart';
import 'package:school_answers_demo/providers/question_provider.dart';

class MockQuestionRepository extends Fake {
  Future<String> getQuestion() async {
    return "What is your favorite programming language?";
  }
}

final mockQuestionProvider = Provider<Future<String>>((ref) async {
  return "What is your favorite programming language?";
});


void main() {
  setUpAll(() {
    registerFallbackValue(MockQuestionRepository());
  });

  testWidgets('Displays a loading indicator while fetching the question', (WidgetTester tester) async {
    // arrange
    final Completer<String> completer = Completer<String>();
    final eternallyLoadingrovider = questionProvider.overrideWith((ref) => completer.future);

    // act
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          eternallyLoadingrovider
        ],
        child: const MaterialApp(home: QuestionPageContainer()),
      ),
    );

    // assert
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Displays the question when data is loaded', (WidgetTester tester) async {
    // arrange
    final filledQuestionValue = questionProvider.overrideWith((ref) => Future.value("testing question"));
    final emptyQuestionValue = answerProvider.overrideWith((ref) => "");
    // act
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          filledQuestionValue,
          emptyQuestionValue
        ],
        child: MaterialApp(
          locale: const Locale('en'),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('en')],
          home: const QuestionPageContainer(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // assert
    expect(find.text("testing question"), findsOneWidget);
  });

  testWidgets('Displays an error message if fetching question fails', (WidgetTester tester) async {
    // arrange
    final failureAnswerProvides = questionProvider.overrideWith((ref) => Future.error("Failed to load question"));
    // act
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          failureAnswerProvides
        ],
        child: MaterialApp(
          locale: const Locale('en'),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('en')],
          home: const QuestionPageContainer(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // assert
    expect(find.textContaining("Failed to load question"), findsOneWidget);
  });

  testWidgets('User can enter and submit an answer', (WidgetTester tester) async {
    // arrange
    const userAnswer = "I have no idea";
    final woodChuckQuestion = questionProvider.overrideWith((ref) => Future.value("How much wood would a woodchuck chuck if a woodchuck could chuck wood?"));
    final emptyQuestion = answerProvider.overrideWith((ref) => "");

    // act
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          woodChuckQuestion,
          emptyQuestion
        ],
        child: MaterialApp(
          locale: const Locale('en'),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('en')],
          home: const QuestionPageContainer(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), userAnswer);
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // assert
    expect(find.text("Your answer: $userAnswer"), findsOneWidget);
  });
}
