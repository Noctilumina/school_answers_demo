import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_answers_demo/l10n/app_localizations.dart';
import 'pages/question_page/question_page_container.dart';

final answerProvider = StateProvider<String>((ref) => '');

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Question app demo',
      theme: _AppTheme.lightTheme,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'),
      ],
      home: const QuestionPageContainer(),
    );
  }
}
//todo: unit testing? 0% coverage
class _AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 39, 124, 217)),
    useMaterial3: true,
    textTheme: const TextTheme(
      headlineSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(fontSize: 16),
    ),
    cardTheme: CardTheme(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: Colors.white,
    ),
  );
}
